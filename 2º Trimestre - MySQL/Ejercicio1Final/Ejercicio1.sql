create database BDEntidadBancaria;
use BDEntidadbancaria;

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


## alter table AbrirCuentaClienteSucursal add column id int primary key auto_increment;


/*
alter table AbrirCuentaClienteSucursal drop foreign key numCuenta; 
alter table AbrirCuentaClienteSucursal drop foreign key numSucursal; 
alter table AbrirCuentaClienteSucursal drop primary key;
*/
/*
alter table AbrirCuentaClienteSucursal drop foreign key  AbrirCuentaClienteSucursal_ibfk_1;
 alter table AbrirCuentaClienteSucursal add column id int primary key auto_increment;
*/












## ESTE ARCHIVO ES ORIGINAL DE GABRIEL PAZOS ALONSO
## SI LEE ESTO ES POSIBLE QUE DICHO ARCHIVO SEA UNA MODIFICACIÓN O COPIA DEL ORIGINAL