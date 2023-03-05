## Ejercicios Base de Datos EmpresasABC
## Ejercicios. Las consultas simples
##La lista de selección

/*
1) Obtener una lista de todos los productos indicando para cada uno su idfabricante, idproducto,
descripción, precio de compra, IVA y precio con I.V.A. incluido (es el precio anterior aumentado en
un 21%).
*/
select idFabricante, idProducto, descripcion, precioCompra,precioCompra * 0.21 as IVA, precioCompra * 1.21 as precioVenta
from productos;

/*
2) De cada lineapedido queremos saber su número de pedido, fabricante, producto, cantidad, precio
de venta y el importe.
*/
select codPedido,fabricante, producto, cantidad, precioVenta, cantidad * precioventa as Importe
from lineaspedido;


/*
3) Listar de cada empleado su nombre, no de días que lleva trabajando en la empresa y su edad
(suponiendo que este año ya ha cumplido años).
Ordenación de filas.
*/
select nombre, datediff(curdate(), fecContrato) as dias, timestampdiff(year, fecContrato, curdate()) as Años,
timestampdiff(year, fecNacimiento, curdate()) as Edad
from empleados;

select nombre, timestampdiff(day, fecContrato, curdate())
from empleados;

## Version que asume que el empleado ya ha cumplido años
select nombre, datediff(curdate(), fecContrato) as dias, timestampdiff(year, fecContrato, curdate()) as Años, year(curdate())-year(fecNacimiento) as Edad
from empleados;



/*
4) Obtener la lista de los clientes agrupados por código de representante asignado, visualizar todas
las columnas de la tabla.
*/
select *
from clientes
order by codRepresentante , nombre;



/*
5) Obtener las oficinas ordenadas por orden alfabético de región y dentro de cada región por ciudad,
si hay más de una oficina en la misma ciudad, aparecerá primero la que tenga el número de oficina
mayor.
*/
select codOficina, region, ciudad
from oficinas
order by region, ciudad, codOficina desc; 




/*
6) Obtener los pedidos ordenados por fecha de pedido.
Selección de filas.
*/
select * 
from pedidos
order by fechaPedido;



/*
7) Listar las ocho líneas de pedido más caras (las de mayor importe).
*/
select *, cantidad  * precioVenta as importe
from lineaspedido
order by importe desc limit 8;



/*
8) Obtener las mismas columnas que en el ejercicio anterior pero sacando únicamente las 5 líneas de
pedido de menor precio unitario.
*/
select *, cantidad  * precioVenta as importe
from lineaspedido
order by importe asc limit 5;

/*
9) Listar toda la información de los pedidos de marzo del último año.
*/

select fechaPedido
from pedidos;

select codPedido, fechaPedido
from pedidos
where month(fechaPedido) =3 and year(fechaPedido = curdate()-1);

select *
from pedidos
where timestampdiff(year, fechaPedido, curdate() = 2 );


/*
10) Listar los pedidos del mes pasado.
*/
select *
from pedidos
where month(fechaPedido = curdate()-1);

/*
11) Listar los números de los empleados que tienen una oficina asignada.
*/
select codEmpleado, nombre, oficina
from empleados
where oficina is not null;



/*
12) Listar los nombres de los empleados que no tienen asignada una oficina.
*/
select codEmpleado, nombre, oficina
from empleados
where oficina is null;


/*
13) Listar los datos de las oficinas de las regiones del Galicia y Euzkadi (tienen que aparecer primero las
del Euzkadi y después las de Galicia).
*/
select *
from Oficinas
where region = 'Galicia' or region = 'Euzkadi'
order by region desc;


/*
14) .Listar los clientes de nombre Julia.
*/
select *
from clientes
where nombre = ' Julia %';

select *
from clientes
where nombre = ' Julia %';

/*
15) Listar los productos cuyo idproducto acabe en x.
*/
select *
from productos
where idProducto like "%x";


/*
16) Obtener toda la información de los empleados cuya edad este comprendida entre 40 y 60 años.
*/
select *, timestampdiff(year, fecNacimiento, curdate()) as edad
from empleados
where timestampdiff(year, fecNacimiento, curdate()) between 40 and 60;

/*
17) Obtener todos los clientes cuyos representantes tengan los códigos 102, 104 y 109.
*/
select *
from clientes
where codRepresentante in ('102', '104', '109') ;


/*
18) Obtener un listado de todos los productos ordenados alfabéticamente por fabricante y después de
mayor a menor precio.
*/
select *
from productos
order by idFabricante, precioCompra desc;



/*
19) Listar todos los empleados que lleven trabajando más de 25 años en la empresa.
*/
select *, timestampdiff(year, fecContrato, curdate()) as tiempo
from empleados
where timestampdiff(year, fecContrato, curdate()) >=25;


/*
20) Listar todas las oficinas que no tengan marcado ningún objetivo.
*/
select *
from oficinas
where objetivo is null;

/*
21) Obtener el nombre de todos los empleados cuyo salario acumulado hasta la fecha actual no han
llegado a cubrir el objetivo que tenían, además se deberá calcular el importe que les falta.
*/
select nombre ,(sueldo + ifnull(comision,0)) * month(curdate()) as acumulado, objetivo, objetivo - (sueldo + ifnull(comision,0)) * month(curdate()) as Falta
from empleados
where (sueldo + ifnull(comision,0)) * month(curdate())  < objetivo;


/*
22) Obtener el nombre del empleado, sueldo, comisión, sueldo bruto (sueldo + comisión), el importe
de las retenciones tanto del IRPF como de la S.S., y el sueldo neto (sueldo bruto – las retenciones).
*/

select nombre, sueldo, comision, sueldo + ifnull(comision, 0) as sueldoBruto, retencionesIRPF, retencionesSS, (sueldo + ifnull(comision, 0)) - (retencionesIRPF + retencionesSS) as sueldoNeto
from empleados;