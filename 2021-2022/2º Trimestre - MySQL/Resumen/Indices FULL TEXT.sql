## INDICES FULLTEXT (ENGINE MyISAM)
	CREATE TABLE IF NOT EXISTS Frases(
	autor VARCHAR(50),
	frase TEXT) Engine = MyISAM;

	INSERT INTO Frases VALUES ('Aeschylus', 'Time as he grows old teaches many lessons'), 
	('Alexander Graham Bell', 'Mr. Watson, come here. I want you!'), 
	('Benjamin Franklin', 'It is hard for an empty bag to stand upright'), 
	('Benjamin Franklin', 'Little strokes fell great oaks'), 
	('Benjamin Franklin', 'Remember that time is money'), 
	('Miguel de Cervantes', 'Bell, book, and candle'), 
	('Proverbs 15:1', 'A soft answer turneth away wrath'), 
	('Theodore Roosevelt', 'Speak softly and carry a big stick'), 
	('William Shakespeare','But, soft! what light through yonder window breaks?'), 
	('Robert Burton', 'I light my candle from their torches.');
    
    ALTER TABLE Frases
	ADD FULLTEXT (autor);

	ALTER TABLE Frases
	ADD FULLTEXT (frase),
	ADD FULLTEXT (frase, autor);
    
    ##Buscar las frases con time en la columna frase
		SELECT *
		FROM Frases
		WHERE MATCH(frase) AGAINST('time');
    
    ##Buscar frases que contengan hard y soft
		SELECT *
		FROM Frases
		WHERE MATCH(frase) AGAINST('hard soft');
    
    ##Contar cuantas veces aparece la palabra time
		SELECT COUNT(*)
		FROM Frases
		WHERE MATCH(frase) AGAINST('time');
    
    ##Buscar las frases que contengan Bell en cualquier columna y no contengan candle
		SELECT *
		FROM Frases
		WHERE MATCH(frase, autor) AGAINST('+bell -candle' IN BOOLEAN MODE);
    
    SELECT *
	FROM Frases
	WHERE MATCH(frase) AGAINST('soft*' IN BOOLEAN MODE);
    
    ##Buscar una frase bell, book, and candle
		SELECT *
		FROM Frases
		WHERE MATCH(frase) AGAINST('"bell, book"' IN BOOLEAN MODE);
        
	## Busquedas en expansion de consultas
		SELECT *
		FROM Frases
		WHERE MATCH(frase, autor) AGAINST('bell book' WITH QUERY EXPANSION);