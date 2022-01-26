create database base1;
use base1;

create table if not exists Primera(
codigo integer,
nombre varchar(20),
sueldo double,
tipo enum ('Alumno','Profesor','Administrativo'),
fallecimiento date);

create table if not exists Segunda(
codigo integer primary key,
nombre varchar(20) not null unique,
sueldo float not null default 2000,
tipo set ('Alumno','Profesor','Administrativo'),
fallecimeinto date,
observaciones longtext);

create database borrar;
drop database borrar
