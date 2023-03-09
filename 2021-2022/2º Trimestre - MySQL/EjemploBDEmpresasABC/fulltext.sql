##Indices FULLTEXT (Las tablas tienen que ser MyISAM)

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

SELECT *
FROM Frases;

ALTER TABLE Frases
ADD FULLTEXT (autor);

ALTER TABLE Frases
ADD FULLTEXT (frase),
ADD FULLTEXT (frase, autor);

## Busquedas de lenguaje natural
##Buscar las frases del autor Roosevelt

SELECT *
FROM Frases
WHERE MATCH(autor) AGAINST('Roosevelt');

##Buscar las frases con time en la columna frase
SELECT *
FROM Frases
WHERE MATCH(frase) AGAINST('time');

##Buscar la palabra Bell en cualquier columna
SELECT *
FROM Frases
WHERE MATCH(frase, autor) AGAINST('Bell');

SELECT *
FROM Frases
WHERE MATCH(frase, autor) AGAINST('you');

##Contar cuantas veces aparece la palabra time
SELECT COUNT(*)
FROM Frases
WHERE MATCH(frase) AGAINST('time');

##Relevancia
SELECT frase, MATCH(frase) AGAINST('time')
FROM Frases;

## buscar frases que contengan hard y soft
select * from frases
where match(frase) against ('hard soft');

## in boolean mode
## buscar las frases que contengan Bell en cual y no contengan candle

## consulta en lenguaje natural
select * from frases
where match(frase,autor) against ('bell');

## consulta en modo booleano
select * from frases
where match(frase,autor) against('+bell -candle' in boolean mode);

## buscar frases que contengan time y money
select * from frases
where match(frase) against('time money');

select * from frases
where match (frase) against ('+time +money' in boolean mode);

## buscar una frase bell, book, and candle
select * from frases
where match (frase) against('bell, book' in boolean mode);

select * from frases
where match (frase,autor) against('bell, book');

select * from frases
where match (frase,autor) against('bell, book' with query expansion);