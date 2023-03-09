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

insert into Cursos (CodCurso,nb,coste,duracion,descripcion) values
("300","Fotografia I","300","700","sacar fotos"),
("400","Danza I","500","900","aprender a bailar"),
("500","Dibujo I","200","500","aprender a dibujar"),
("301","Fotografia II","400","700","sacar fotos mejores"),
("401","Danza II","700","900","aprender a bailar mejor"),
("501","Dibujo II","350","500","aprender a dibujar mejor");

insert into prerrequisito (codCursohago, codCursoRequisito, obligatorio) values
("301","300","s"),
("401","400","s"),
("501","500","s");

insert into empleados (codEmpleado,nif,nb,apel,dire,fecnacimiento,nacionalidad,sexo,salario,firma,capacitado) values
("01","1234","Pablo", "García López", "Vigo","2000-01-10","Español","Varón","2000","Pablo12","S"),
("02","4321","Raúl", "Matamoros Pazos", "Madrid","1980-07-06","Francés","Varón","1500","Raulito","N"),
("03","9097","Marta", "Ramírez Costas", "Lugo","199-11-15","Venezolana","Mujer","6000","Marta guay","S");

insert into telefonos (numTelefono, codEmpleado) values
("676789075","01"),
("650896272","02"),
("699900622","03");

insert into capacitados (codEmpleado) values
("01"),
("03");

insert into Edicion (codCurso, idEdicion,horario,fecha,lugar,codEmpleCapa) values
("300","777","lunes", "2022-03-15", "Vigo","01"),
("501","666","jueves", "2022-04-18", "Vigo","03");

insert into reciben (codCurso, idEdicion,CodEmpleado) values
("300","777","01"),
("501","666","03");

update telefonos
set numTelefono="661908861" where codEmpleado="01";

delete from telefonos where codEmpleado="03";





## ESTE ARCHIVO ES ORIGINAL DE GABRIEL PAZOS ALONSO
## SI LEE ESTO ES POSIBLE QUE DICHO ARCHIVO SEA UNA MODIFICACIÓN O COPIA DEL ORIGINAL
