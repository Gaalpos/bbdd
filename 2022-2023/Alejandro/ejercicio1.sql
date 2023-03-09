DROP DATABASE IF EXISTS aaabdempleados;
CREATE DATABASE IF NOT EXISTS aaabdempleados;
USE aaabdempleados;

CREATE TABLE IF NOT EXISTS Centros(
ceCodigo INT AUTO_INCREMENT PRIMARY KEY,
ceNombre VARCHAR(30) NOT NULL,
cdDireccion VARCHAR(100) NOT NULL);

CREATE TABLE IF NOT Exists Empleados(
emCodigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
emCodigoDepartamento INT UNSIGNED NOT NULL,
emExTelefono SMALLINT NOT NULL,
emFechaNacimiento DATE NOT NULL,
emFechaIngreso DATE NOT NULL,
emSalario DOUBLE NOT NULL,
emComision DOUBLE NOT NULL,
emNumHijos SMALLINT DEFAULT 0,
emNombre VARCHAR(20) NOT NULL);

CREATE TABLE IF NOT EXISTS Departamentos(
deCodigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
deCodigoCentro INT NOT NULL,
deTipoDirector ENUM('P', 'F'),
dePresupuesto Double NOT NULL,
deDepartamento INT UNSIGNED,
deNombre VARCHAR(30) NOT NULL,
deDirector INT UNSIGNED ,
FOREIGN KEY (deCodigoCentro) REFERENCES Centros (ceCodigo),
FOREIGN KEY (deDirector) REFERENCES Empleados (emCodigo));

ALTER TABLE Empleados ADD 
FOREIGN KEY (emCodigoDepartamento) REFERENCES Departamentos (deCodigo);

ALTER TABLE Departamentos ADD 
CONSTRAINT FKDepar FOREIGN KEY (deDepartamento) REFERENCES Departamentos (deCodigo);

INSERT INTO Centros (ceCodigo, ceNombre, cddireccion) VALUES
(null, "primero", "Vigo");

INSERT INTO Centros (ceCodigo, ceNombre, cddireccion) VALUES
(100, "cuarto", "Porriño"),
(null, "quinto", "Caldas de Reyes");

iNSERT INTO CENTROS(ceNombre, cDDireccion, ceCodigo) VALUES
("sexto", "Santiago",null);

INSERT INTO Centros VALUES
(null, "septimo", "Coruña");
## da error porque le falta una columna y no hemos indicado los nombres de las columnas
##INSERT INTO Centros VALUES
##( "septimo", "Coruña");

INSERT INTO Centros (ceNombre, cdDireccion) VALUES
( "septimohghjghghghjg", "Bilbao");

INSERT INTO Centros VALUES
(150, "hhjghjghjghjghjg", "Sevilla");

INSERT INTO Departamentos (deCodigoCentro, deTipoDirector, 
dePresupuesto,deDepartamento, deNombre, deDirector) VALUES
(100, 'P', 50000, null, "Direccion General", null);

INSERT INTO Departamentos (deCodigoCentro, deTipoDirector, 
dePresupuesto,deDepartamento, deNombre, deDirector) VALUES
(101, 'F', 60000, 1, 'Financiero', null);

INSERT INTO Departamentos (deCodigoCentro, deTipoDirector, 
dePresupuesto,deDepartamento, deNombre, deDirector) VALUES
(101, 'P', 60000, 1, 'RRHH', null);

## insertar un departamento en un centro que no existe
## para que se produzac el error de FOREIGN KeY

INSERT INTO Departamentos (deCodigoCentro, deTipoDirector, 
dePresupuesto,deDepartamento, deNombre, deDirector) VALUES
(10999, 'P', 60000, 1, 'RRHH', null);

##cambiar el código del centro por uno que exista
INSERT INTO Departamentos (deCodigoCentro, deTipoDirector, 
dePresupuesto,deDepartamento, deNombre, deDirector) VALUES
(1, 'P', 60000, 1, 'RRHH', null);

## eliminar el centro con código 105
DELETE FROM Centros WHERE ceCodigo=105;

## eliminar el centro con código 101
## se va a producir un error de FOREIGN KEY
##DELETE FROM Centros WHERE ceCodigo=101;

##solución sería eliminar primero los departamentos del centro 101 y después eliminar el centro

INSERT INTO Empleados (emCodigoDepartamento, emexTelefono, emFechaIngreso, 
emSalario, emComision, emNumHijos, emNombre)VALUES
(5, 123, "1978-11-05", "2020-02-15", 2500, 350.50, 2, 'María');

SET SQL_SAFE_UPDATES=0;
##cambiando el nombre al empleado de codigo 1
UPDATE Empleados SET emNombre = "María del Carmen"
WHERE emCodigo = 1;


## Incrementar el sueldo de los empleados en un 5% y la comisión en un 3%

UPDATE Empleados SET emSalario = emSalario*1.05,
emComision = emComision*1.03;


##Ejemplo on delete cascade y on update cascade

CREATE TABLE Alumnos(
dni int primary key,
nombre VARCHAR(20));

CREATE TABLE Notas(
id int AUTO_INCREMENT primary key,
dni int not null,
nota inT,
FOREIGN KEY (dni) REFERENCES Alumnos(dni)
ON DELETE SET NULL ON UPDATE SET NULL);


INSERT INTO Alumnos1 (dni, nombre) VALUES
(12, 'Ana'),
(13, 'Bea'),
(14, 'Isabel'),
(15, 'Jorge');

INSERT INTO Notas1(dni, notas) VALUES
(12, 5),
(12, 6),
(12, 7),
(14, 5),
(14, 9);

##eliminar el alumno de codigo 13 qie tiene notas
delete FROM alumnos Where dni = 13;

##eliminar el alumno de codigo 14 qie tiene notas
delete FROM alumnos Where dni = 14;

UPDATE alumnos SET dni=25 Where dni=12;












