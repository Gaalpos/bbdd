create database if not exists holding;
use holding;

create table if not exists persona(
dni char(9) primary key,
nombre varchar(50) not null,
direccion varchar(50),
tipo boolean not null
);

create table if not exists telefono(
dniTelf char(9) not null,
numTelf int not null,
primary key (dniTelf, numTelf),
foreign key (dniTelf) references persona (dni)
);

create table if not exists vendedor(
dni char(9) primary key,
porcomision int not null,
foreign key (dni) references persona(dni) on delete cascade
);

create table if not exists asesor(
dni char(9) primary key,
titulacion varchar(50),
foreign key (dni) references persona(dni)
);

create table if not exists empresa(
nombre varchar(30) primary key,
fechaEntrada date not null,
facturacion int default 0,
numVendedores int default 0
);

create table if not exists areaemp(
nombre varchar(20) primary key,
descripcion varchar(100) not null);

create table if not exists pais(
nombre varchar (30) primary key,
pib int default 0,
habitantes int default 0,
capital varchar(40));

create table if not exists asesorAreaEmpresa(
dniAsesor char(9) not null,
nomArea varchar(20) not null,
nomEmpresa varchar(30) not null,
fecha date not null,
primary key (dniAsesor,nomArea,nomEmpresa),
foreign key (dniAsesor) references asesor (dni),
foreign key (nomArea) references areaemp ( nombre),
foreign key (nomEmpresa) references empresa (nombre));

create table if not exists CapVenVenEmpresa(
id int primary key auto_increment,
nomEmpresa varchar(30) not null references empresa(nombre),
dniVenCapta char(9) not null references vendedor(dni),
dniCaptado char(9) not null references vendedor(dni));

create table if not exists actuaEmpresaPais(
id int primary key auto_increment,
nomEmpresa varchar(30) not null references empresa(nombre),
nomPais varchar(30) not null,
foreign key (nomPais) references pais(nombre));

alter table vendedor add column fechaNacimiento date not null;
alter table asesor add column fechaNacimiento date not null first;
alter table persona add column email varchar(60) not null after direccion;

alter table vendedor add sueldo int not null;
alter table empresa change facturacion facturacion double;
alter table empresa modify facturacion integer;

## añadir un campo clave
alter table asesorAreaEmpresa drop constraint asesorareaempresa_ibfk_1;
alter table asesorAreaEmpresa drop constraint asesorareaempresa_ibfk_2;
alter table asesorAreaEmpresa drop constraint asesorareaempresa_ibfk_3;

alter table asesorAreaEmpresa drop primary key;
alter table asesorAreaEmpresa add id int primary key auto_increment;

alter table persona add index(nombre);

create index indDireccion on persona (direccion);
drop index indDireccion on persona;

insert into persona (dni, nombre, direccion, email, tipo) values
("152A", "Paula", "Vigo", "paula@gmail.com", "2"),
("234J", "Ramón", "Madrid", "ramon@gmail.com", "1");

insert into persona values
("23234S", "Isao", "DEBA", "isa@gmail.com", "1");

insert into persona (dni, nombre, direccion, email, tipo) values
("1232A", "Laura", "madrid", "laura@gmail.com", "4");

## da error de foreign key
## insert into telefono (dniTelf, numTelf) values
## ("96428763","241223");

##La direccion no puede ser nulo
## insertar valores nulos

insert into persona (dni, nombre, direccion, email, tipo) values
("6623","Maria",NULL,"maria@gmail.com","6");

insert into persona (dni, nombre, email, tipo) values
("823J3","Santiago","santi@gmail.com","1");

delete from persona where nombre = "Santiago";

## da error de foreign key
delete from persona where nombre = 
