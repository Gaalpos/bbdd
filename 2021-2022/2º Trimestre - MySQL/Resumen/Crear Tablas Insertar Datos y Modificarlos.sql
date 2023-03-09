DROP DATABASE IF EXISTS BaseDeDatos;
CREATE database IF NOT EXISTS BaseDeDatos;
USE BaseDeDatos;

CREATE TABLE IF NOT EXISTS TablaA (
columna1 CHAR(3) NOT NULL,
columna2 VARCHAR(30) NOT NULL,
columna3 ENUM('opcionA','opcionB', 'opcionC') DEFAULT 'opcionA',
columna4 INT NOT NULL,
PRIMARY KEY (columna1),
FOREIGN KEY (columna2) REFERENCES TablaB(columnaB1)) ENGINE = InnoDB;

INSERT INTO TablaA (columna1, columna2, columna3, columna4) VALUES
('abc', 'Fulanito', 'opcionA', 100),
('efg', 'Menganito', 'opcionB', 200),
('hij', 'Menganita', 'opcionA', 100);


##ALTER TABLE
	ALTER TABLE TablaA ADD COLUMN columna5 DATE not null;
	ALTER TABLE TablaA DROP PRIMARY KEY;
	ALTER TABLE TablaA ADD Id int primary key auto_increment;
	ALTER TABLE TablaA ADD INDEX (columna1);

##UPDATE
	UPDATE nombreTabla
	SET columna3 = 'opcionA'
	WHERE columna1 = 'efg';

##DELETE
	DELETE FROM TablaA
	WHERE columna1 = 'abc';