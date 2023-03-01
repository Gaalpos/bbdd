CREATE DATABASE IF NOT EXISTS aaaEjemplo;
USE aaaEjemplo;
CREATE TABLE IF NOT EXISTS Cursos(
codCurso INT PRIMARY KEY,
nombre VARCHAR(20));

CREATE TABLE IF NOT EXISTS Alumnos(
Dni CHAR(9) PRIMARY KEY,
nombre VARCHAR(30),
codCurso INT NOT NULL,
FOREIGN KEY (codCurso) REFERENCES Cursos (codCurso));

INSERT INTO Cursos (codCurso,Nombre) VALUES
(1,'PDAM'),(2,'SDAM'),(3,'2ASI');

INSERT INTO Alumnos (Dni,nombre,codCurso) VALUES
('123A',"Leo",1),('321A',"Cristiano",3),('456B',"Pedro",2),
('875R',"Anuel",2),('783A',"Cristian",3),('123M',"Marco",1),
('123F',"Teresa",1),('123G',"María",1),('123H',"Bea",1);
