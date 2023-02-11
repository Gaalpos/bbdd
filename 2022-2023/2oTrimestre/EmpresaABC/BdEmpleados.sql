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

INSERT INTO Centros VALUES
( "septimo", "Coruña");

INSERT INTO Centros (ceNombre, cdDireccion) VALUES
( "septimohghjghghghjg", "Bilbao");

INSERT INTO Centros VALUES
(100, "hhjghjghjghjghjg", "Sevilla");

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



