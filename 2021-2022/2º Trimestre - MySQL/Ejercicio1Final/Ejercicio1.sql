create database BDEntidadBancaria;
use BDEntidadbancaria;

SET SQL_SAFE_UPDATES = 0;

create table if not exists Cliente(
dni char(9) primary key,
nombre char(50) not null,
direccion char(59) not null);

create table if not exists Cuenta(
numCuenta int primary key,
saldo decimal not null
);

create table if not exists Sucursal(
numSucursal int primary key,
ciudad char(20) not null,
activo int not null);

create table if not exists AbrirCuentaClienteSucursal(
dni char(9)not null ,
numCuenta int not null,
numSucursal int not null,
primary key(dni,numCuenta),
foreign key (dni) references Cliente (dni),
foreign key (numCuenta) references Cuenta(numCuenta),
foreign key (numSucursal) references Sucursal(numSucursal));

create table if not exists Transaccion(
numeroCta int not null,
numTransaccion int not null,
fecha date not null,
tipoOperacion char(1),
cantidad decimal not null,
primary key(numeroCta,numTransaccion),
foreign key (numeroCta) references Cuenta (numCuenta));


alter table cliente add column fechaNacimiento date not null;
alter table cliente add column email char(50);

create table if not exists telefonos(
numTelefono int (9) primary key,
dni char (9),
foreign key (dni) references cliente (dni));


alter table cuenta add column fechaCreac date not null;
alter table sucursal modify column activo  double not null;


## alter table AbrirCuentaClienteSucursal drop primary key;
## alter table AbrirCuentaClienteSucursal add column id int primary key auto_increment;

create index indice_nombre
on Cliente (nombre);



insert into Cliente (dni, nombre,direccion,fechaNacimiento,email) values
("11223344A","Pablo Román García","Vigo","1990-08-21","pablo@gmail.com"),
("12345678J","Raúl Mencía Alonso","Vigo","1982-11-27","raul@gmail.com"),
("83719027B","Gabriel López Abalde", "Madrid","1970-03-08","gabrel@gmail.com");


insert into Sucursal (numSucursal, ciudad, activo) values
("1","Vigo","30000"),
("2","Vigo","45000"),
("3", "Madrid","125000");

insert into Cuenta (numCuenta, saldo,fechaCreac) values
("100", "3000","2000-01-21"),
("200","2300","2002-11-20"),
("300", "7000","2006-02-01");

insert into Transaccion (numeroCta, numTransaccion, fecha, tipoOperacion, cantidad) values
("100","1","2022-03-01","I","300.50"),
("200","2","2022-02-21","G","40"),
("200","3","2022-03-08","G","80"),
("300","4","2021-12-24","I","860");

insert into AbrirCuentaClienteSucursal(dni, numCuenta,NumSucursal) values
("11223344A","100","1"),
("12345678J","200","2"),
("83719027B","300", "3");


update cliente
set email="pablito" where nombre="Pablo Román García";

update cuenta
set saldo="5000" where numCuenta="100";

update Sucursal
set activo="500000" where numSucursal="2";

update transaccion
set tipoOperacion="I" where numTransaccion="3";

delete from AbrirCuentaClienteSucursal where numCuenta="100";
delete from Cliente where dni="11223344A";
delete from sucursal where numSucursal="1";
delete from transaccion where numeroCta="100";
delete from cuenta where numCuenta="100";

##  drop database bdentidadbancaria;









## ESTE ARCHIVO ES ORIGINAL DE GABRIEL PAZOS ALONSO
## SI LEE ESTO ES POSIBLE QUE DICHO ARCHIVO SEA UNA MODIFICACIÓN O COPIA DEL ORIGINAL