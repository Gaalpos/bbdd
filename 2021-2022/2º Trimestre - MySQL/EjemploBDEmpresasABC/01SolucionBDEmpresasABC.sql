/* Solución Ejercicios. Las consultas simples
La lista de selección
1) Obtener una lista de todos los productos indicando para cada uno su idfabricante, 
idproducto, descripción, precio de compra, IVA y precio con I.V.A. incluido 
(es el precio anterior aumentado en un 21%).
*/
SELECT idFabricante, idProducto, descripcion, precioCompra, FORMAT(precioCompra *0.21, 2) AS IVA,
FORMAT(precioCompra * 1.21, 2) AS Total
FROM Productos;

/*
2) De cada lineapedido queremos saber su número de pedido, fabricante, producto, cantidad, 
precio de venta y el importe.
*/
SELECT codPedido, fabricante, producto, cantidad, precioVenta, cantidad * precioVenta AS Importe
FROM LineasPedido
ORDER BY producto;
/*
3) Listar de cada empleado su nombre, nº de días que lleva trabajando en la empresa y su edad 
(suponiendo que este año ya ha cumplido años).
*/

SELECT CURDATE(), YEAR(CURDATE());
-- la resta de dos fechas no da la diferencia en días hay que utilizar DATEDIFF
SELECT codEmpleado, nombre, CURDATE() - FecContrato, YEAR(CURDATE()) - YEAR(FEcNacimiento)
FROM Empleados;

SELECT codEmpleado, nombre, DATEDIFF(CURDATE(), FecContrato), fecContrato,
YEAR(CURDATE())- YEAR(FecContrato), YEAR(CURDATE()) - YEAR(FEcNacimiento) AS EDAD, fecNacimiento
FROM Empleados;

SELECT nombre, YEAR(CURDATE()) - YEAR(FecNacimiento) - 
IF(RiGHT(FecNacimiento, 5) > RIGHT(CURDATE(), 5), 1, 0) AS EDAD,
YEAR(CURDATE()) - YEAR(FEcNacimiento)
FROM Empleados;

/*Ordenación de filas.
4) Obtener la lista de los clientes agrupados por código de representante asignado, visualizar 
todas las columnas de la tabla.
*/
SELECT *
FROM Clientes
ORDER BY codRepresentante;

/*
5) Obtener las oficinas ordenadas por orden alfabético de región y dentro de cada región por ciudad, 
si hay más de una oficina en la misma ciudad, aparecerá primero la que tenga el número de oficina mayor.
*/
SELECT * 
FROM Oficinas
ORDER BY region, ciudad, codOficina;

/*
6) Obtener los pedidos ordenados por fecha de pedido.
*/
SELECT *
FROM Pedidos
ORDER BY fechaPedido;

/*
Selección de filas.
7) Listar las ocho líneas de pedido más caras (las de mayor importe).
*/
SELECT codPedido, numLinea, fabricante,producto, cantidad * precioVenta AS Importe
FROM LineasPedido
ORDER BY cantidad * precioVenta DESC
LIMIT 8;

SELECT codPedido, numLinea, fabricante,producto, cantidad * precioVenta AS Importe
FROM LineasPedido
ORDER BY Importe DESC
LIMIT 8;

/*
8) Obtener las mismas columnas que en el ejercicio anterior pero sacando únicamente las 5 
líneas de pedido de menor precio unitario.
*/
SELECT  codPedido, numLinea, fabricante,producto,  precioVenta 
FROM LineasPedido
ORDER by precioVenta
Limit 5;

SELECT DISTINCT  fabricante,producto,  precioVenta 
FROM LineasPedido
ORDER by precioVenta
Limit 5;

/*
9) Listar toda la información de los pedidos de marzo del último año.
*/
SELECT *
FROM Pedidos
WHERE MONTH(fechaPedido) = 3 AND YEAR(CURDATE()) -1 = YEAR(FechaPedido);

/*
10) Listar los pedidos del mes pasado.
*/

SELECT *
FROM Pedidos
WHERE MONTH(fechaPedido) = IF(MONTH(CURDATE())-1 = 0, 12, MONTH(CURDATE())-1)
AND YEAR(FECHAPedido) = IF(MONTH(CURDATE())-1 = 0, yEAR(CURDATE())-1, 
YEAR(CURDATE()));

/*
11) Listar los números de los empleados que tienen una oficina asignada.
*/
SELECT codEmpleado, nombre, oficina
FROM Empleados
where oficina IS NOT NULL;
/*
12) Listar los nombres de los empleados que no tienen asignada una oficina.
*/
SELECT codEmpleado, nombre, oficina
FROM Empleados
where oficina IS NULL;
/*
13) Listar los datos de las oficinas de las regiones del Galicia y Euzkadi 
(tienen que aparecer primero las del Euzkadi y después las de Galicia).
*/
SELECT *
FROM oficinas
WHERE region IN('Euzkadi', 'Galicia')
ORDER BY region DESC;

/*
14) Listar los clientes de nombre Julia.
*/
InSERT INTO Clientes (codCliente, nombre, codRepresentante, limiteCredito)
VALUES
(6666, 'María Julia Peres Sanchez', 102, 10000);

SELECT *
FROM Clientes
WHERE nombre lIKE 'Julia%';

SELECT *
FROM Clientes
WHERE nombre lIKE 'Julia %';

SELECT *
FROM Clientes
WHERE nombre lIKE '%Julia %';

SELECT *
FROM Clientes
WHERE nombre lIKE '%Julia%';
/*
15) Listar los productos cuyo idproducto acabe en x.
*/
SELECT *
FROM Productos
WHERE idproducto LIKE '%x';

/*
16) Obtener toda la información de los empleados cuya edad este 
comprendida entre 40 y 60 años.
*/

SELECT nombre, fecNacimiento, YEAR(CURDATE()) - YEAR(FecNacimiento) AS EDAD
FROM Empleados
WHERE YEAR(CURDATE()) - YEAR(FecNacimiento) BETWEEN 40 AND 60;

SELECT nombre, fecNacimiento, YEAR(CURDATE()) - YEAR(FecNacimiento) AS EDAD,
YEAR(CURDATE()) - YEAR(FecNacimiento) - 
IF(RIGHT(fecNacimiento, 5) > RIGHT(CURDATE(), 5), 1, 0) AS EDAD1
FROM Empleados
WHERE YEAR(CURDATE()) - YEAR(FecNacimiento) - 
IF(RIGHT(fecNacimiento, 5) > RIGHT(CURDATE(), 5), 1, 0) BETWEEN 40 AND 60;

/*
17) Obtener todos los clientes cuyos representantes tengan los 
códigos 102, 104 y 109.
*/
SELECT *
FROM Clientes
WHERE codREpresentante IN (102, 104, 109);

/*
18) Obtener un listado de todos los productos ordenados alfabéticamente por fabricante y después 
de mayor a menor precio 
*/
select *
from productos
order by idFabricante, precioCompra desc;

/*
19) Listar todos los empleados que lleven trabajando más de 25 años en la empresa.
*/
/*Tres formas de obtener los años*/
select nombre, fecContrato, round(datediff(curdate(), fecContrato)/365), /**/ year (curdate())-year(fecContrato), /**/
year (curdate())- year(feccontrato)-if(right(fecContrato, 5) > right (curdate(),5), 1,0)  
from empleados
where datediff(curdate(), fecContrato)/365 >25;

/*
20) Listar todas las oficinas que no tengan marcado ningún objetivo.
*/
select *
from oficinas
where objetivo is null or objetivo = 0;

/*
21) Obtener el nombre de todos los empleados cuyo salario acumulado hasta la fecha actual no han llegado a cubrir el objetivo que tenían, además se deberá calcular el importe que les falta.
*/
/*select nombre, sueldo +if(comision, 0=
/*
/*
22) Obtener el nombre del empleado, sueldo, comisión, sueldo bruto (sueldo + comisión), el importe de las retenciones tanto del IRPF como de la S.S., y el sueldo neto (sueldo bruto – las retenciones).
*/

select nombre, sueldo, ifnull(comision,0), sueldo + ifnull(comision,0) as "Sueldo Bruto",
sueldo + ifnull(comision,0)*retencionesIRPF "IRPF",
(sueldo+ifnull(comision,0))*retencionesSS SS,
(sueldo+ifnull(comision,0))-((sueldo+ifnull(comision,0))*retencionesIRPF)-
((sueldo+ifnull(comision,0))*retencionesSS) as "Sueldo Neto"
from Empleados;