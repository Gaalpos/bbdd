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



#10) Listar los pedidos del mes pasado.
#11) Listar los números de los empleados que tienen una oficina asignada.
#12) Listar los nombres de los empleados que no tienen asignada una oficina.
#13) Listar los datos de las oficinas de las regiones del Galicia y Euzkadi (tienen que aparecer primero las
#del Euzkadi y después las de Galicia).
#14) .Listar los clientes de nombre Julia.
#15) Listar los productos cuyo idproducto acabe en x.
#16) Obtener toda la información de los empleados cuya edad este comprendida entre 40 y 60 años.
#17) Obtener todos los clientes cuyos representantes tengan los códigos 102, 104 y 109.
#18) Obtener un listado de todos los productos ordenados alfabéticamente por fabricante y después de
#mayor a menor precio.
#19) Listar todos los empleados que lleven trabajando más de 25 años en la empresa.
#20) Listar todas las oficinas que no tengan marcado ningún objetivo.
#21) Obtener el nombre de todos los empleados cuyo salario acumulado hasta la fecha actual no han
#llegado a cubrir el objetivo que tenían, además se deberá calcular el importe que les falta.

#22) Obtener el nombre del empleado, sueldo, comisión, sueldo bruto (sueldo + comisión), el importe
#de las retenciones tanto del IRPF como de la S.S., y el sueldo neto (sueldo bruto – las retenciones).