SELECT * FROM Clientes;

SELECT codCliente, nombre, codRepresentante, limiteCredito
FROM Clientes;

SELECT nombre, sueldo
FROM Empleados;

SELECT nombre, limiteCredito, limiteCredito + 5000
FROM Clientes;

SELECT now(), curdate();

SELECT codpedido AS pedido, producto, cantidad, precioVenta,
cantidad *  precioVenta AS Importe
FROM LineasPedido;

#Clausula ORDER BY se utiliza para ordenar la lista de resultados a mostrar
## ASC <o DESC 
SELECT codEmpelado, nombre,feNacimineto, categoria, sueldo, oficina  
FROM Empleados
ORDER BY nombre;

SELECT codEmpelado, nombre,feNacimineto, categoria, sueldo, oficina 
FROM Empleados
ORDER BY 3;

SELECT codEmpelado, nombre,feNacimineto, categoria, sueldo, oficina 
FROM Empleados
ORDER BY categoria, nombre;


SELECT codEmpelado, nombre,feNacimineto, categoria, sueldo, oficina  
FROM Empleados
ORDER BY oficina, categoria, nombre;

SELECT codEmpelado, nombre,feNacimineto, categoria, sueldo, oficina 
FROM Empleados
ORDER BY categoria, nombre
LIMIT 4;

SELECT codEmpelado, nombre,feNacimineto, categoria, sueldo, oficina 
FROM Empleados
ORDER BY sueldo DESC
LIMIT 10;

SELECT nombre, feNacimiento, YEAR(feContrato), MONTH(feContrato),
MONTHNAME(feContrato), DAY(feContrato), HOUR(NOW()), MINUTE(NOW()), SECOND(MOW())
FROM Empleados;

#Listar el nombre del empleado, su fecha de nacimiento, su edad
## lo años de contrato y los años que lleve trabajando en la empresa

SELECT nombre, feNacimiento, YEAR(CURDATE())-YEAR(feNacimiento) AS EDAD,
feContrato, YEAR(CURDATE())-YEAR(feContrato) AS Años
FROM Empleados;  

SELECT ALL nombre, feNacimiento, YEAR(CURDATE())-YEAR(feNacimiento) AS EDAD,
feContrato, YEAR(CURDATE())-YEAR(feContrato) AS Años
FROM Empleados;  

#Listar la categoría de los empleados
SELECT  DISTINCT categoria
FROM Empleados;

# Clausula WHERE

#Listar los empleados cuya categoria sea Representante

SELECT nombre, sueldo, categoria
FROM Empleados
WHERE categoria = "Representante";

SELECT nombre, sueldo, categoria
FROM Empleados
WHERE sueldo< 3000;

#listar el nombre, sueldo, comision y la suma del sueldo y la comisión

SELECT nombre, sueldo, comision, sueldo+comision AS SB
FROM Empleados;

SELECT 7+null, 8*null, 20-null,15/null;

#funcion IFNULL
SELECT IFNULL(7,0), IFNULL(NULL,0);

SELECT nombre, sueldo, IFNULL(comision,0), sueldo+IFNULL(comision,0) AS SB
FROM Empleados;

#Listar los empleados cuya categoria sea representante y sueldo+comision
#mayor de 7000

SELECT nombre, sueldo, IFNULL(comision,0), sueldo+IFNULL(comision,0) AS SB
FROM Empleados
WHERE categoria = "Representante" && sueldo+IFNULL(comision,0) > 7000;

#Listar los empleados de las oficinas 11,12,13

SELECT*
FROM Empleados
WHERE oficina = 11 || oficina = 12 || oifcina = 13;
# TEST de Rango BETWEEN
# Listar los empleados con un sueldo entre 2000 y 3000 euros

SELECT *
FROM Empleados
WHERE sueldo>= 2000 && sueldo<= 3000;

#utilizando BETWEEN
SELECT nombre, sueldo
FROM Empleados
WHERE suledo BETWEEN 2000 AND 3000;

#Test de Conjunto  IN

SELECT nombre, oficina
FROM Empleados
WHERE oficina IN(11, 12, 13);

#Listar las oficinas 
SELECT *
FROM Oficinas
WHERE ciudad= 'Eibar' OR ciudad = 'Vigo' OR ciudad= 'Gijon' OR ciudad = 'Bilbao';

SELECT *
FROM Oficinas
WHERE ciudad IN ('Eibar', 'Vigo', 'Gijon', 'Bilbao');

SELECT nombre, oficina
FROM Empleados 
WHERE oficina IS NULL;

SELECT nombre, comision
FROM Empleados 
WHERE comision IS NULL;

#Ejercicios Base de Datos EmpresasABC

#Ejercicios. Las consultas simples

#La lista de selección

# 1) Obtener una lista de todos los productos indicando para cada uno su idfabricante, idproducto,
# descripción, precio de compra, IVA y precio con I.V.A. incluido (es el precio anterior aumentado en
# un 21%).
select *, precioCompra * 0.21 as IVA, precioCompra *1.21 as Total
from productos;

select idFabricante as Proveedor, idProducto as producto,
descripcion as nombre, preciocompra as Precio, existencias as Existencias,
format (precioCompra * 0.21, 2) as IVA,
format (precioCompra *1.21, 2 ) as Total
from Productos;



#2) De cada lineapedido queremos saber su número de pedido, fabricante, producto, cantidad, precio
#de venta y el importe.
select codPedido as Pedido, numLinea as Linea, fabricante as Proveedor, producto as Producto, cantidad as Cantidad,
precioVenta as PVP,
cantidad * precioVenta as Importe
from lineaspedido
order by codPedido, numLinea;

select *
from lineaspedido
order by codPedido, numLinea;


#3) Listar de cada empleado su nombre, no de días que lleva trabajando en la empresa y su edad
#(suponiendo que este año ya ha cumplido años).
#Ordenación de filas.
select nombre, fecContrato, datediff(curdate(), fecContrato) as Dias,
format (datediff(curdate(),fecContrato)/365,0) as Años,
fecNacimiento, year(curdate())-year(fecNacimiento) as Edad
from Empleados;

select nombre, right(nombre, 5 ), left(nombre, 10)
from Empleados;

select if(10>4, "true", "false"), if (4>10, "true", "false");

select nombre, sueldo, if(sueldo>3000, "Mucho","Poco")
from empleados;

select nombre, fecContrato, datediff(curdate(), feccontrato) as dias, FecNacimiento,
 year(curdate()) - year(FecNacimiento) 
- if (right(FecNacimiento,5) > right (curdate(), 5), 1 , 0) as edad
from empleados;


#4) Obtener la lista de los clientes agrupados por código de representante asignado, visualizar todas
#las columnas de la tabla.
select *
from clientes
order by codRepresentante, nombre;

select *
from clientes
order by 3,2;

select codCliente, nombre, codRepresentante, limiteCredito
from clientes
order by 3, 2 ;

#5) Obtener las oficinas ordenadas por orden alfabético de región y dentro de cada región por ciudad,
#si hay más de una oficina en la misma ciudad, aparecerá primero la que tenga el número de oficina
#mayor.
select codOficina, ciudad, region, objetivo, ventas
from Oficinas
order by 3, 2, 1;
## las enumeraciones (columna region) es ordenada por el orden en el que esté 
#colocadas las filas a la hora de crear la tabla


#6) Obtener los pedidos ordenados por fecha de pedido.
#Selección de filas.
select *
from pedidos
order by fechaPedido;

#7) Listar las ocho líneas de pedido más caras (las de mayor importe).
select *, cantidad * precioventa as importe
from lineasPedido
order by importe desc limit 8;


#8) Obtener las mismas columnas que en el ejercicio anterior pero sacando únicamente las 5 líneas de
#pedido de menor precio unitario.
select *, cantidad * precioventa as importe
from lineasPedido
order by importe limit 5;


#9) Listar toda la información de los pedidos de marzo del último año.
select *
from pedidos
WHERE MONTH(fechaPedido)= 3 AND YEAR(fechaPedido)=YEAR(CURDATE()) ;



#10) Listar los pedidos del mes pasado.
select *
from pedidos
WHERE MONTH(fechaPedido)= MONTH(CURDATE())-1 AND YEAR(fechaPedido)=YEAR(CURDATE()) ;

#11) Listar los números de los empleados que tienen una oficina asignada.
select *
from empleados
WHERE oficina IS NOT NULL;


#12) Listar los nombres de los empleados que no tienen asignada una oficina.
select *
from empleados
WHERE oficina IS NULL;

#13) Listar los datos de las oficinas de las regiones del Galicia y Euzkadi (tienen que aparecer primero las
#del Euzkadi y después las de Galicia).
select *
from oficinas
WHERE region= 'Galicia' OR region='Euzkadi'
ORDER BY region DESC;


#14) .Listar los clientes de nombre Julia.
select *
from clientes
WHERE nombre LIKE 'Julia %';


#15) Listar los productos cuyo idproducto acabe en x.
select *
from productos
WHERE idproducto LIKE '%x';

#16) Obtener toda la información de los empleados cuya edad este comprendida entre 40 y 60 años.
select *
from empleados
WHERE YEAR(CURDATE())- YEAR (fecNacimiento) >=40 AND YEAR(CURDATE())- YEAR (fecNacimiento) <=60 ;



#17) Obtener todos los clientes cuyos representantes tengan los códigos 102, 104 y 109.
select *
from clientes
WHERE codRepresentante IN(102,104,106);

#18) Obtener un listado de todos los productos ordenados alfabéticamente por fabricante y después de
#mayor a menor precio.
select *
from productos
ORDER BY idFabricante, precioCompra DESC;


#19) Listar todos los empleados que lleven trabajando más de 25 años en la empresa.
SELECT codEmpleado, nombre, FecContrato,
 YEAR(CURDATE())- YEAR (FecContrato) AS 'Años trabajados'
 from Empleados
 WHERE  YEAR(CURDATE())- YEAR (FecContrato)>25;


#20) Listar todas las oficinas que no tengan marcado ningún objetivo.
select *
from oficinas
WHERE objetivo !=0;


#21) Obtener el nombre de todos los empleados cuyo salario acumulado hasta la fecha actual no han
#llegado a cubrir el objetivo que tenían, además se deberá calcular el importe que les falta.
SELECT ADDDATE(CURDATE(), INTERVAL 5 DAY),  ADDDATE(CURDATE(), INTERVAL 5 MONTH),
 ADDDATE(CURDATE(), INTERVAL 5 YEAR);
 
 
 #sueldo anual
 SELECT nombre, sueldo, sueldo* MONTH(CURDATE()), objetivo
 FROM Empleados
 WHERE sueldo* MONTH(CURDATE()) < objetivo;
 
 # sueldo acumulado desde su llegada a la empresa
 SELECT nombre, sueldo, (YEAR(CURDATE())- YEAR(fecContrato)-1)*12*sueldo + sueldo*MONTH(CURDATE()) AS 'Sueldo Acumulado'
 FROM Empleados
 WHERE (YEAR(CURDATE())- YEAR(fecContrato)-1)*12*sueldo + sueldo*MONTH(CURDATE()) < objetivo AND (YEAR(CURDATE())- YEAR(fecContrato)-1)*12*sueldo + sueldo*MONTH(CURDATE())>0 ;



#22) Obtener el nombre del empleado, sueldo, comisión, sueldo bruto (sueldo + comisión), el importe
#de las retenciones tanto del IRPF como de la S.S., y el sueldo neto (sueldo bruto – las retenciones).

SELECT nombre, sueldo, comision, sueldo+comision AS 'Sueldo Bruto', (sueldo + comision) * retencionesIRPF AS IRPF, (sueldo + comision) * retencionesSS AS SS,
(sueldo+ comision) - (sueldo + comision) * retencionesIRPF- (sueldo + comision) * retencionesSS
FROM empleados;


SELECT nombre, sueldo, IFNULL(comision,0) AS Comision,
FORMAT(sueldo+ IFNULL(comision,0),2) AS SB,
FORMAT((sueldo+ IFNULL(comision,0))* retencionesIRPF,2) AS SB,
FORMAT((sueldo+ IFNULL(comision,0))* retencionesSS,2) AS SS,
FORMAT((sueldo+ IFNULL(comision,0))-
((sueldo+IFNULL(comision,0))* retencionesIRPF)-
((sueldo+IFNULL(comision,0))* retencionesSS),2) AS SNeto
FROM Empleados;



