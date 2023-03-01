# clausula order by se utiliza para ordenar la lista de resultados o mostrar de ascendente a descendente

# listar los empleados ordenados de forma ascendente

select codEmpleado, nombre, fecNacimiento, categoria, sueldo, oficina
from empleados
order by nombre asc;  ## default ordena de forma ascendente, el asc se peude omitir

# listar los empleados ordenados de forma descendente
select codEmpleado, nombre, fecNacimiento, categoria, sueldo, oficina
from empleados
order by nombre desc;

# listar los empleados de forma descendente. tambien se puede utilizar el numero de columna dentro
# de la consulta por la que queramos ordenar

#listar los empleados ordenados por nombre descendente utilizando la posicion de la columna
select codEmpleado, nombre, fecNacimiento, categoria, sueldo, oficina
from empleados
order by 3;

#listar los empleados ordenados por categoria y nombre
select codEmpleado, oficina,  nombre, fecNacimiento, categoria, sueldo
from empleados
order by categoria, nombre;

#listar los empleados ordenados por categoria ,nombre y oficina
select codEmpleado, oficina,  nombre, fecNacimiento, categoria, sueldo
from empleados
order by oficina, categoria, nombre;

#listar los empleados ordenados por categoria ,nombre y oficina con LIMIT
select codEmpleado, oficina,  nombre, fecNacimiento, categoria, sueldo
from empleados
order by oficina, categoria, nombre
limit 4;

# listar nombre y el sueldo de los 10 empleados que  mas ganen
 select codEmpleado, oficina,  nombre, fecNacimiento, categoria, sueldo
from empleados
order by sueldo desc
limit 10;

# listar nombre y el sueldo de los 10 empleados que  menos ganen
 select codEmpleado, oficina,  nombre, fecNacimiento, categoria, sueldo
from empleados
order by sueldo asc
limit 10;

select nombre, fecNacimiento, year(fecContrato),month(fecContrato),
monthname(fecContrato),day(fecContrato),
hour(now()),minute(now()),second(now()) from empleados;

# lsitar el nombre del empleado, su fecha de nacimiento, su ed
#ead, el num de años
# de contrato y los años que lleva trabajando en la empresa
select nombre, fecNacimiento, year(curdate())-year(fecNacimiento) as edad,
fecContrato, year(curdate())-year(fecContrato) as años
from empleados;

select all nombre, fecNacimiento, year(curdate())-year(fecNacimiento) as edad,
fecContrato, year(curdate())-year(fecContrato) as años
from empleados;

# listar la categoria de los empleados
select distinct categoria
from empleados;

# clausula where 
# listar los empleados cuya categoria sea representante
select nombre, sueldo, categoria
from empleados
where categoria = "Representante";

# listar los empleados cuyo sueldo sea mayor de 3000 euros
select nomnre, sueldo, categoria
from empleados where sueldo > 3000;

# listar el nombre, sueldo, comision, y la suma del sueldo y la comision
select nombre, sueldo, comision, sueldo+comision as sb
from empleados;

select 7+null, 8*null, 20-null, 15/null;

# function ifnull
select ifnull(7,0), ifnull(null, 0);
select nombre, sueldo, ifnull(comision, 0), sueldo+ifnull(comision,0) as sb
from empleados;

# mayor de 5000
select ifnull(7,0), ifnull(null, 0);
select nombre, sueldo, ifnull(comision, 0), sueldo+ifnull(comision,0) as sb
from empleados
where categoria = "Representante" and sueldo +ifnull(comision, 0) > 7000;

# listar los empleados de las oficinas 11, 12, 13
select *
from empleados 
where oficina = 11 or oficina = 12 or oficina = 13;

select *
from empleados 
where oficina = 11 || oficina = 12 || oficina = 13;

# test de rango between
# listar los empleados con un sueldo entre 2000 y 4000
select *
from empleados where sueldo >= 2000 and sueldo <= 3000;

# utilizar between
select nombre, sueldo
from empleados
where sueldo between 2000 and 3000;


# operador de conjunto in
select nombre, oficina
from Empleados
where oficinia in (11, 12 , 13);

# listar las oficinas de eibar, vigo, gijon, bilbao
select * 
from oficinas
where ciudad = "Eibar" or ciudad = "Vigo" or ciudad = "Gijón" or ciudad = "Bilbao";

select * 
from oficinas
where ciudad in( "Eibar" ,"Vigo" ,"Gijón", "Bilbao" );

# utilizar not between
select nombre, sueldo
from empleados
where sueldo not between 2000 and 3000;

# test de nulo is null

select nombre, oficina
from empleados
where oficina = null; # mal

select nombre, oficina
from empleados
where oficina is null;

## listar los empleados que tienen oficina
select nombre, oficina
from empleados
where oficina is not null;

# lisar empleados que no tinen comision
select nombre, comision
from empleados
where comision is null;

# teste de comparacion patrol LIKE  / NOT LIKE
# listar los empleados cuyonombre comience por G
select nombre, sueldo
from Empleados
where nombre like "G%";

# listar los empleados cuyo nombre termine por O
select nombre, sueldo
from Empleados
where nombre like "%o";

# listar los empleados cuyo nombre contenga "la"
select nombre, sueldo
from Empleados
where nombre like "%la%";

# lsitar oficinas de Gijón
select *
from oficinas
where ciudad = "Gijon";

select *
from oficinas
where ciudad like "Gij_n";

# Listar los empleados cuyo nombre este entre ls letras L y P
select nombre , fecContrato
from empleados
where nombre regexp '^[L-p]';

