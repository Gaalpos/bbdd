create database if not exists aaaPrimera;

create database if not exists aaaSegunda;

create database if not exists aaatercera;

alter database aaaPrimera default collate utf8mb4_bin;

alter database aaaPrimera default collate latin1_bin;

alter database aaaPrimera default charset latin1;

use aaaprimera;

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

alter table alumnos add index (email);

#añadir un indice para las columnas ape1 y ape2 conjuntamente
alter table alumnos add index indApe ( ape1,ape2);

#añadir la clave para la columna dni
Alter table alumnos add primary key (dni);

#eliminar la columna telefono
alter table alumnos drop telefono;
alter table alumnos drop primary key;
alter table alumnos drop index indApe;

# alter tabla nombreTabla alter...
# alter table nombreTabla  change...
# alter table nombreTabla  modify...

#añadir a la columna nota un valor por defecto de 5
alter table alumnos alter nota set default 5;

#eliminar de la columna nota el valor por defecto
alter table alumnos alter nota drop default;

# cmabiar el tipo de dato de la columna nombre a char(20)
alter table alumnos change nombre nombre char(20) not null first;
alter table alumnos change nombre nombre1 char(20) not null;

#cambiar el tipo de dato de la columna email a char(30)
alter table alumnos modify nombre char(30) unique after ape2;

# cambiar el nombre de la tabla alumnos por personas
alter table alumnos rename personas;

# aeliminar una tabla
# drop table nombreTabla;
# drop table if exists modulos2;

drop index personas (nbUK);



