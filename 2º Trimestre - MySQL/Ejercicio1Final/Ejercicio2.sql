create database BDCursosFormacion;
use BDCursosFormacion;

create table if not exists Empleados(
codEmpleado int primary key,
nif char(9),
nb char(20),
apel char(20),
dire char(30),
fecNacimiento date,
nacionalidad char (30),
sexo char (20),
salario int,
firma char (30),
capacitado char(1));

create table if not exists Telefonos(
numTelefono int primary key,
codEmpleado int,
foreign key (codEmpleado) references Empleados (codEmpleado));

create table if not exists Cursos(
codCurso int primary key,
nb char(30),
coste int,
duracion int,
descripcion char(100));

create table if not exists Prerrequisito(
codCursoHago int,
codCursoRequisito int,
obligatorio char(1),
primary key (codCursoHago, codCursoRequisito),
foreign key (codCursoHago) references Cursos (codCurso),
foreign key (codCursoRequisito) references Cursos (codCurso));

create table if not exists Capacitados(
codEmpleado int,
foreign key (codEmpleado) references Empleados (codEmpleado));

create table if not exists Edicion(
codCurso int,
idEdicion int,
horario char(12),
fecha date,
lugar char(20),
codEmpleCapa int,
primary key (codCurso,idEdicion),
foreign key (codCurso) references Cursos (codCurso),
foreign key (codEmpleCapa) references Capacitados (codEmpleado));

create table if not exists Reciben(
codCurso int,
idEdicion int,
codEmpleado int,
primary key (codCurso,idEdicion,codEmpleado),
foreign key (codCurso,idEdicion) references Edicion (codCurso,idEdicion),
foreign key (codEmpleado) references Empleados (codEmpleado),
foreign key (codEmpleado) references Capacitados (codEmpleado)
);









## ESTE ARCHIVO ES ORIGINAL DE GABRIEL PAZOS ALONSO
## SI LEE ESTO ES POSIBLE QUE DICHO ARCHIVO SEA UNA MODIFICACIÓN O COPIA DEL ORIGINAL