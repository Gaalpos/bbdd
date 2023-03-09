DROP DATABASE IF EXISTS aaaaaCursosFormacion;
CREATE DATABASE IF NOT EXISTS aaaaaCursosFormacion;
USE aaaaaCursosFormacion;

CREATE TABLE IF NOT EXISTS Cursos(
codCurso INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
coste INTEGER NOT NUll,
duracion INTEGER NOT NULL,
descripcion VARCHAR(100) NOT NULL) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Empleados(
codEmpleado Int PRIMARY Key,
NIF CHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(20) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
fecNacimiento DATE NOT NULL,
nacionalidad VARCHAR(30) NOT NULL,
sexo VARCHAR(20) NOT NULL,
salario INT NOT NULL,
firma VARCHAR(30) NOT NULL,
capacitado ENUM ('Si', 'No') NOT NULL)Engine = InnoDB;

CREATE TABLE IF NOT EXISTS CAPACITADOS(
codEmpleado INT Primary key,
FOREIGN KEY (codEmpleado) REFERENCES Empleados (CodEmpleado) ON DELETE CASCADE ON UPDATE CASCADE);

DROP TABLE IF EXISTS Edicion;
CREATE TABLE IF NOT EXISTS Edicion(
codCurso INT NOT NULL,
idEdicion INT NOT NULL,
horario VARCHAR(20) NOT NULL,
fecha DATE NOT NULL,
lugar CHAR(15) NOT NULL,
codCapacitado INT NOT NULL,
PRIMARY KEY (codCurso, idEdicion),
FOREIGN KEY (codCapacitado) REFERENCES Capacitados(codEmpleado))Engine = InnoDb;

CREATE TABLE IF NOT EXISTS Telefonos(
numTelefono INT PrimARY kEY,
codEmpleado INt NOT NULL,
FOREIGN KEY (codEmpleado) REFERENCES Empleados(CodEmpleado) 
ON DELETE CASCADE ON UPDATE CASCADE) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Reciben(
CodCurso INT NOT NULL,
idEdicion INT NOT NULL,
codEmpleado INT NOT NULL,
PRIMARy KEY (codCurso, idEdicion, codEmpleado),
FOREIGN KEY (codCurso, idEdicion) REFERENCES Edicion (codCurso, idEdicion),
FOREIGN KEY (codEmpleado) REFERENCES Empleados (codEmpleado) )ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Prerequisito(
codCursoHago INT NOT NULL,
codCursoRequisito INT NOT NULL,
obligatorio ENUM ('Si', 'No'),
PRIMARY KEY (codCursoHago, codCursoRequisito),
FOREIGN KEY (codCursoHago) REFERENCES Cursos (codCurso),
FOREIGN KEY (codCursoRequisito) REFERENCES Cursos (codCurso))ENGINE = InnoDB;












