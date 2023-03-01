create database if not exists aaaEjemplo;
use aaaEjemplo;

create table if not exists Cursos(
codCurso int primary key,
nombre varchar(20));

create table if not exists Alumnos(
dni char(9) primary key,
nombre varchar(30),
codCurso int not null,
foreign key (codCurso) references Cursos (codCurso));

insert into Cursos (codCurso, nombre) values
(1, 'PDAM'), ('2','2DAM'), ('3', '1ASI');

insert into Alumnos (dni, nombre, codCurso) values
( '17545678K', 'Jose', 1 ),
( '12311678B', 'carlos', 1 ),
( '12347178P', 'manolo', 2 ),
( '10145678N', 'luisa', 3 );

select * from aaaejemplo.alumnos;

# producto cartesiano
select *
from Cursos, alumnos
where cursos.codCurso = alumnos.codCurso
order by cursos.nombre; # nombre cualificado