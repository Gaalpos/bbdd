create database ExamenGabrielPazosAlonso;
 use ExamenGabrielPazosAlonso;
 
 create table if not exists Proyecto (
 Codigo int primary key,
 Titulo varchar(59),
 FecInicio date,
 FecFinal date,
 Responsable varchar(50),
 CodSede int);
 
 create table if not exists Empleado(
 Codigo char(5) primary key,
 Nombre varchar(50),
 FecNacimiento date,
 Categoria varchar (20),
 Contrato date,
 CodProyecto int,
 Sueldo int,
 RetencionesIRPF float(4,2),
 RetencionesSS float (4,2),
 Nacionalidad varchar(20),
 foreign key (CodProyecto) references Proyecto (codigo));
 
 alter table Proyecto add column Presupuesto int not null;
 
 alter table empleado drop Contrato;
 alter table empleado add column Contrato date not null;
 
 alter table empleado drop sueldo;
 alter table empleado add column sueldo float(8,2) not null;
 
 alter table empleado drop contrato;
 alter table empleado add column FechaContrato date not null;
 
 alter table empleado drop nacionalidad;