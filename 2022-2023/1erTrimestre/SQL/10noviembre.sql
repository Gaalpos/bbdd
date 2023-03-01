create database if not exists aaaPrimera;

create database if not exists aaaSegunda;

create database if not exists aaatercera;

alter database aaaPrimera default collate utf8mb4_bin;

alter database aaaPrimera default collate latin1_bin;

alter database aaaPrimera default charset latin1;

create table if not exists Alumnos(
dni char(9),
nombre varchar(50),
fecNacimiento date,
curso enum('1º DAM','2º DAM'),
nota int);

create table if not exists Modulos(
codigo int primary key,
nombre varchar(30) unique not null,
numHoras integer not null,
nombreProfesor varchar(50) not null);

create table if not exists Coches(
matricula varchar(25),
marca varchar (20),
modelo varchar (20),
precio int not null,
primary key(matricula),
unique (marca));

create table if not exists Columnas(
clave1 int,
clave2 int,
nombre varchar(20),
primary key (clave1, clave2));


create table if not exists Fabricante(
nombreFabricante varchar(50) primary key,
direccion varchar (30) not null,
telefono int not null);

create table if not exists Muebles(
codigo int primary key,
linea varchar (20) not null,
color enum('Blanco','Beige','Azul'),
alto int not null,
largo int not null,
ancho int not null,
material varchar (20) not null,
altura int not null,
fabricante varchar(50) not null references Fabricante(nombreFabricante));

## foreign key (fabricante) references Fabricante (nombreFabricante)

alter table alumnos
add column direccion varchar(50);

create index nombreIndice on alumnos (nombre);
create unique index nombreUK1 on alumnos (curso);

## Añadir la columna apellidos en la tabla alumnos

alter table alumnos add column ape1 varchar(20);
alter table alumnos add ape2 varchar(20) not null;

alter table alumnos add email varchar (50) first;
alter table alumnos add telefono int not null after direccion;

#añadir un indice para la columna email


