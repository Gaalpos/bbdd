DROP DATABASE IF EXISTS aaabdempleados;
CREATE DATABASE IF NOT EXISTS aaabdempleados;
USE aaabdempleados;
set SQL_SAFE_UPDATES =0;

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

 ## INSERT INTO Centros VALUES
 ## ( "septimo", "Coruña");
# da error porque le fatla una columna y no hemos indicado el nombre de las columnas

INSERT INTO Centros (ceNombre, cdDireccion) VALUES
( "septimohghjghghghjg", "Bilbao");

INSERT INTO Centros VALUES
(109, "hhjghjghjghjghjg", "Sevilla");

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
#INSERT INTO Departamentos (deCodigoCentro, deTipoDirector, 
#dePresupuesto,deDepartamento, deNombre, deDirector) VALUES
#(10099, 'P', 60000, 1, 'RRHH', null);

## Correcion: cambiar el codigo del centro por uno que exista
INSERT INTO Departamentos (deCodigoCentro, deTipoDirector, 
dePresupuesto,deDepartamento, deNombre, deDirector) VALUES
(1, 'P', 60000, 1, 'RRHH', null);

# eliminar el centro con codigo 105
delete from Centros where ceCodigo = 105;

# eliminar el centro con codigo 101
## se va a producir un error de foreign key o integridad referencial
# delete from Centros where ceCodigo = 101;

## solucion seria eliminar primero los departamentos del  centro 101 y despues eliminar el centro
#insert into Empleados (emCodigoDepartamento, emexTelefono, emFechaNacimiento, emFechaIngreso,
 #emSalario, emComision, emNumHijos, emNombre)values(
 #5,23,"1978-11-25", "2020-02-15",2500, 350.50, 2, "Mariaa");
 
 insert into Empleados (emCodigoDepartamento, emexTelefono, emFechaNacimiento, emFechaIngreso,
 emSalario, emComision, emNumHijos, emNombre)values(
 5,23,"1978-11-25", "2020-02-15",6500, 250.50, 1, "Maria");
 
 ## cambiado el nombre al empleado de coidgo 1
 update  Empleados set emNombre = "Maria del Carmen"
 where emCodigo = 1;
 
 ## incrementar el sueldo d elos empleados en un 5% y la comision en un 3%
 update Empleados set emSalario = emSalario*1.05, emComision = emComision*1.03;
 
 # un ejemplo on delete cascade y on update cascade
 create table Alumnos(
 dni int primary key,
 nombre varchar(20));
 
 create table notas(
 id int auto_increment primary key,
 dni int not null,
 nota int ,
 foreign key (dni) references Alumnos (dni) on delete cascade on update cascade);
 
 insert into Alumnos(dni, nombre) values
 (12,"Ana"),
 (13,"Alex"),
 (14,"Maria"),
 (15,"Pedro");
 
 insert into Notas (dni, nota) values
 (12,5),
 (12,6),
 (12,7),
 (14,5),
 (15,9);
 
 ## eliminar el alumno de codigo 13
 delete from alumnos where dni = 13;
 
  ## eliminar el alumno de codigo 14 que tiene notas
 delete from alumnos where dni = 13;
 
 update alumnos set dni = 25;
 
 
 