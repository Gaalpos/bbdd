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
where month(fechapedido) = 2 and year(fechaPedido) = year (curdate() -1);



#10) Listar los pedidos del mes pasado.
select * 
from pedidos 
where month(fechapedido) = month(curdate()-1) and year(fechaPedido) = year (curdate());


#11) Listar los números de los empleados que tienen una oficina asignada.
select codEmpleado, oficina
from empleados
where oficina is not null;

#12) Listar los nombres de los empleados que no tienen asignada una oficina.
select codEmpleado
from empleados
where oficina is null;

#13) Listar los datos de las oficinas de las regiones del Galicia y Euzkadi (tienen que aparecer primero las
#del Euzkadi y después las de Galicia).
select *
from Oficinas
where region = 'Galicia' or region = 'Euzkadi'
order by region desc;

select *
from oficinas
where region in ( 'Galicia','Euzkadi')
order by region desc;

#14) .Listar los clientes de nombre Julia.
select *
from Clientes
where nombre like ' Julia %';

#15) Listar los productos cuyo idproducto acabe en x.
select *
from productos
where idproducto like '%x';


#16) Obtener toda la información de los empleados cuya edad este comprendida entre 40 y 60 años.
select codEmpleado, nombre, fecNacimiento, year(curdate())- year(FecNacimiento) as Edad
from empleados
where year(curdate())-year(FecNacimiento) between 40 and 60;

select codEmpleado, nombre, fecNacimiento, year(curdate())- year(FecNacimiento) as Edad
from empleados
where year(curdate())-year(FecNacimiento) >= 40 and
 year(curdate())-year(FecNacimiento) <=60 ;
 
 ## edad exacta
select codEmpleado, nombre, fecNacimiento, year(curdate()) - year(FecNacimiento) -
if (right(fecnacimiento, 5) > right(curdate(), 5), 1, 0) as Edad
from empleados
where  year(curdate()) - year(FecNacimiento) -
if (right(fecnacimiento, 5) > right(curdate(), 5), 1, 0) between 40 and 60;


#17) Obtener todos los clientes cuyos representantes tengan los códigos 102, 104 y 109.
select *
from Clientes
where codRepresentante in (102,104,109);

select*
from Clientes
where codRepresentante = 102 or  codRepresentante = 104 or codRepresentante = 109;

#18) Obtener un listado de todos los productos ordenados alfabéticamente por fabricante y después de
#mayor a menor precio.
select *
from productos
order by idfabricante  , precioCompra desc;

#19) Listar todos los empleados que lleven trabajando más de 25 años en la empresa.
select codEmpleado, nombre, fecContrato,
year(curdate())-year(fecContrato) as 'Años trabajados'
from empleados
where year(curdate())-year(fecContrato) > 25;

#20) Listar todas las oficinas que no tengan marcado ningún objetivo.
select *
from oficinas
where objetivo is null;

#21) Obtener el nombre de todos los empleados cuyo salario acumulado hasta la fecha actual no han
#llegado a cubrir el objetivo que tenían, además se deberá calcular el importe que les falta.

select adddate(curdate(), interval  5 day), adddate(curdate(), interval 5 month),
adddate(curdate(), interval 5 year);

select nombre, sueldo, sueldo * month(curdate()) as 'Sueldo acumulado', objetivo 
from empleados
where sueldo * month(curdate()) < objetivo ;

# sueldo acumulado desde que trabaja en la empresa
select codEmpleado, nombre, sueldo, (year(curdate())-year(FecContrato)-1)*12* sueldo + 
sueldo * month(curdate())  as ' sueldo acumulado'
from empleados
where (year(curdate())-year(FecContrato)-1)*12*Sueldo + 
sueldo * month(curdate()) < objetivo;

select codEmpleado, nombre, sueldo, if( (year(fecContrato) <> year(curdate())),
(year(curdate())-year(fecContrato)-1)*12*sueldo + 
sueldo * month (curdate()), sueldo * month(curdate())) as ' Sueldo acumulado'
from empleados 
where if( (year(fecContrato) <> year(curdate())),
(year(curdate())-year(fecContrato)-1)*12*sueldo + 
sueldo * month (curdate()), sueldo * month(curdate())) < objetivo;



#22) Obtener el nombre del empleado, sueldo, comisión, sueldo bruto (sueldo + comisión), el importe
#de las retenciones tanto del IRPF como de la S.S., y el sueldo neto (sueldo bruto – las retenciones).
select 25 + null;
select ifnull(25,0), ifnull(null, 0);


select nombre, sueldo, comision, sueldo + comision as SBRuto, 
(sueldo + comision ) * retencionesIRPF as IRPF,
(sueldo + comision ) * retencionesSS as SS,
(sueldo + comision ) - (sueldo + comision ) * retencionesIRPF - (sueldo + comision ) * retencionesSS
from empleados;

select nombre, sueldo, ifnull(comision, 0) as comision,
format (sueldo + ifnull(comision, 0),2) as SB,
format((sueldo + ifnull(comision, 0)) * retencionesIRPF,2) as IRPF,
format ((sueldo + ifnull(comision, 0)) * retencionesSS, 2) as SS,
format ((sueldo + ifnull(comision,0)) -
((sueldo + ifnull(comision,0)) * retencionesIRPF) -
((sueldo + ifnull(comision, 0)) * retencionesSS),2) as neto
from empleados;
