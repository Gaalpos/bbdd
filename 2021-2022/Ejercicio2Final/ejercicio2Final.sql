use dbejerciciofinalunidad;
set SQL_SAFE_UPDATES = 0;

/* 
1) Para los empleados que no tienen comisión obtener por orden alfabético el nombre y el
cociente entre su salario y el número de hijos.
*/
select EmSalario/EmNumHijos as cociente from empleados
where (EmComision is null or EmComision=0) and EmNumHijos>0
order by 1;

/*
2) Para los departamentos cuyo salario medio supera al salario medio de la empresa, hallar
cuántas extensiones telefónicas tienen
*/
select DeNombre, COUNT(EmExTelefono) as Extensiones
from Empleados 
join Departamentos on EmCodigoDepartamento = DeCodigo
group by EmCodigoDepartamento
having avg(EmSalario) > (select avg(EmSalario) from Empleados);

/* 
3) Obtener por orden alfabético los nombres de empleados cuyo apellido empieza por G y
trabajan en un departamento ubicado en algún centro de trabajo de la calle Alcalá.
*/
select EmNombre, ceDireccion
from Empleados join Departamentos on DeCodigo = EmcodigoDepartamento
join Centros on CeCodigo = DeCodigoCentro
where EmNombre like 'G%' and CeDireccion like 'C. ALCALA%'
order by EmNombre;

/* 
4) Crear la tabla EmpleDepar con la misma estructura que la tabla Empleados, insertando los
empleados cuyo salario supere al salario medio de su departamento. (Crear la tabla e insertar al
mismo tiempo).
*/
create table if not exists empledepar
select *  from empleados emp
where emsalario > (select avg(emsalario) from empleados 
where emp.emcodigodepartamento = empleados.emcodigodepartamento);

/* 
5) Actualizar en la tabla EmpleDepar el salario aumentándoles la comisión, en los empleados
que la tengan y poniendo Nulo en la comisión.
*/

update EmpleDepar set EmSalario = (EmSalario + EmComision), EmComision = NULL 
where EmComision is not null;

/* 
6) Se desea analizar un plan de jubilación anticipada para los empleados con 60 años
cumplidos en el que se ofrece una paga adicional extra de jubilación equivalente al salario
actual de un mes por cada año de servicio cumplido. Hallar una lista por orden alfabético de los
empleados que este año cumplen 60 ó más años indicando para cada uno la cuantía de esta
paga extra.
*/

select EmNombre, ((year(curdate()) - year(EmFecIngreso)) - 
if(right(EmFecIngreso,5) > right(curdate(), 5),1,0)) * EmSalario as  'Paga Extra Jubilación'
from Empleados where year(CURDATE()) - year(EmFecNacimiento) > 60;

/*
 7) Hallar por orden alfabético los nombres de los empleados cuyo director de departamento es
Marcos Pérez, bien en propiedad o bien en funciones, indicando cuál es el caso para cada uno
de ellos.
*/
select EmNombre, DeTipoDirector, DeDirector
from Empleados join Departamentos on EmCodigoDepartamento = DeCodigo
where DeDirector = (select EmCodigo from Empleados where EmNombre = 'PÉREZ, MARCOS')
order by EmNombre;

/* 
8) Borrar en la tabla EmpleDepar a los empleados cuyo salario (sin incluir comisión) supere al
salario medio de los empleados de su departamento en 1000 euros.
*/

delete  
from EmpleDepar where EmSalario > (select avg(EmSalario) 
from Empleados as Dep where EmCodigoDepartamento = Dep.EmCodigoDepartamento) +1000;


/*9) Hallar, por orden alfabético, los nombres de los empleados y la gratificación, tales que si se
les da una gratificación de 10 euros por hijo, el total de esta gratificación no supera la
centésima parte del salario. Solo los empleados con gratificación.*/
select EmNombre, EmNumHijos*10, EmSalario*10 from empleados
where EmNumHijos*10 < (EmSalario*10)/100
order by EmNombre;

/* 
10) Obtener, por orden alfabético, los nombres de los departamentos que, o bien tienen
directores en funciones y su presupuesto no excede los 5 mil euros, o bien no dependen de
ningún otro departamento.
*/
select DeNombre from Departamentos
where (DeTipoDirector = 'F' and DePresupuesto <= 5000) or DeDepartamento is null
order by DeNombre;

/*
 11) Hallar los siguientes datos para cada departamento:
a) Número de empleados.
b) Salario medio.
c) Salario máximo y mínimo.
d) Varianza y desviación típica del salario.
e) Media de las comisiones
f) Número de comisiones que hay distintas.
g) Media de las comisiones que hay distintas.
*/

select DeCodigo, DeNombre, count(EmCodigo) as 'Num Empleados', 
format(avg(EmSalario),2) as 'Salario Medio', 
min(EmSalario) as 'Salario Mínimo', 
max(EmSalario) as 'Salario Máximo', 
format(variance(EmSalario),2) as Varianza, 
format(stddev(EmSalario),2) as 'Desviación Típica',
format(avg(EmComision),2) as 'Comisión Media', 
count( distinct EmComision) as 'Nº Comisiones distintas', 
format(avg(distinct EmComision), 2) as 'Media de comisiones distintas'
from Departamentos join Empleados on DeCodigo = EmCodigoDepartamento
group by DeCodigo;

/* 
12) Mostrar los departamentos (código y nombre) con sus centros (código y nombre) y el
salario medio de sus empleados de aquellos departamentos que tienen un salario medio en sus
empleados mayor a 3000 euros.
*/
select DeCodigo 'Código del centro' , DeNombre 'Nombre del centro' , CdeCodigo 'Código del departamento', Cenombre 'Nombre del departamento', avg(emsalario + ifnull(emcomision,0))
from centros join departamentos on cecodigo = decodigocentro join empleados on DeCodigo = EmCodigoDepartamento
group by DeCodigo
having avg(EmSalario + ifnull(EmComision,0)) > 3000;

/* 
13) Cree una vista llamada DPTOS_JEFES que contenga los siguientes datos para cada
departamento que sea jefe de otro departamento: Número y nombre del departamento,
número y nombre de su director, presupuesto de ese departamento y, por último, suma de los
presupuestos de todos los departamentos que son supervisados por él. Comprobar los
resultados de la vista.
*/
select DeparJefe.decodigo, deparJefe.denombre, empleados.emnombre, deparjefe.depresupuesto,
(select sum(depresupuesto) from departamentos where dedepartamento = deparjefe.decodigo)
from departamentos join departamentos as deparjefe on departamentos.dedepartamento = deparjefe.decodigo
join empleados on deparjefe.dedirector = empleados.emcodigo;


select distinct dptosJefes.decodigo, dptosjefes.denombre, dptosjefes.depresupuesto, empleados.emnombre,
(select sum(depresupuesto) from departamentos where dedepartamento = dptosjefes.decodigo)
from departamentos join departamentos as dptosjefes on departamentos.dedepartamento = dptosjefes.DeCodigo
join empleados on dptosjefes.dedirector = empleados.emcodigo;


create view dptosjefes (codde, nbde, pre, dir, total) as
select distinct  dptosJefes.decodigo, dptosjefes.denombre, dptosjefes.depresupuesto, empleados.emnombre,
(select sum(depresupuesto) from departamentos where dedepartamento = dptosjefes.decodigo)
from departamentos join departamentos as dptosjefes on departamentos.dedepartamento = dptosjefes.DeCodigo
join empleados on dptosjefes.dedirector = empleados.emcodigo;

/* 
14) Para los departamentos ubicados en la calle de Alcalá en los que haya algún empleado con
un salario entre 3000 y 5000 euros y tales que la media de hijos por cada de cada
departamento sea superior a 1, hallar el salario medio de estos empleados, indicando su
nombre, departamento y centro de trabajo.
*/

select EmNombre, Denombre, CeNombre, EmSalario
from Empleados join Departamentos as Dep on EmCodigoDepartamento = DeCodigo
join Centros on DeCodigoCentro = CeCodigo
where CeDireccion like 'C. ALCALA%'&&  (select avg(EmNumHijos) from Empleados join Departamentos on EmCodigoDepartamento = DeCodigo  
where Dep.DeNombre = Departamentos.DeNombre) > 1 && EmSalario between 3000 and 5000;

select *
from Frases 
where match(autor,frase) 
against('Gloria' with query expansion);

select *
from Frases 
where match(autor,frase) 
against('+Gloria -Popularidad' in boolean mode);


/* 
15) Crear la tabla Frases (idfrase#, autor, frase).
Cargar la tabla con los datos del fichero Frases.txt.
Añadirle 3 índices Fulltext uno para los campos (autor y frase), otro para el campo autor, y otro
para el campo frase.
Seleccionar los Frases que tengan la palabra Gloria en cualquiera de los campos autor o frase.
(Utilizar índices FULLTEXT).
Seleccionar los Frases que tengan la palabra Gloria y que no tengan la palabra Popularidad en
cualquiera de los campos autor o frase.
Modificar la consulta para que el resultado se con expansión de consulta.
*/

 ## Crear la tabla Frases (idfrase#, autor, frase).
drop table frases;
create table if not exists Frases(
idfrase int primary key auto_increment,
autor varchar(50) not null,
frase varchar(50) not null) engine = MyISAM;

## Cargar la tabla con los datos del fichero Frases.txt
insert into Frases (idfrase, autor, frase) values
('1528', 'Pablo','Gloria campos Popularidad'),
('1525', 'Gloria','Campos largos'),
('1524', 'Pablo','Gloria campos lago');

/*
Añadirle 3 índices Fulltext uno para los campos (autor y frase),
otro para el campo autor, y otro para el campo frase.
*/

alter table frases add fulltext(autor), add fulltext(frase), add fulltext(autor, frase);

select *  from frases;

/* 16) Crear una transacción para realizar las siguientes operaciones en la tabla de
Departamentos, una para deshacer y la otra para confirmar.*/
start transaction;
insert into Departamentos values (124,20,'F',130000,120,'producion',110);


delete from Departamentos 
where DePresupuesto < 5000;

update Departamentos set DePresupuesto = Depresupuesto + (DePresupuesto * 0.20) 
where DePresupuesto < (select avg(DePresupuesto) 
from Departamentos);

commit;
rollback;