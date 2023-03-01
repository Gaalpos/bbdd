## listar el nombre del empleado, la oficina en al que trabaja indicando
## la ciudad y las ventas de la oficina
## JOIN

SELECT codEmpleado, nombre, oficina, codOficina, ciudad, ventas
FROM Empleados JOIN oficinas ON oficinas = codoficina;

## producto cartesiano

SELECT codEmpleado, nombre, oficina, codOficina, ciudad, ventas
FROM Empleados, Oficinas
WHERE oficina = codOficina;

## listar los pedidos indicando el nombre del cliente

## JOIN

SELECT codpedido, fecPedido, codCliente, nombre
FROM Pedidos JOIN Clientes USING (codCliente);

SELECT codpedido, fecPedido, clientes.codCliente, nombre
FROM Pedidos JOIN Clientes ON clientes.codClientes = pedidos.codClientes;

## producto cartesiano

SELECT codpedido, fecPedido, clientes.codCliente, nombre
FROM Pedidos, Clientes
WHERE clientes.codClientes = pedidos.codClientes;

## listar el codpedido, el producto (nombre), cantidad, precioVenta, importe
## JOIN

SELECT codPedido, descripcion, cantidad, precioVenta, cantidad * precioVenta
FROM LineasPedido JOIN Productos ON idFabricante = fabricante AND idProducto = producto;

## producto cartesiano

SELECT codPedido, descripcion, cantidad, precioVenta, cantidad * precioVenta
FROM LineasPedido, Productos
WHERE idFabricante = fabricante AND idProducto = producto;

#join
select codPedido, descripcion, cantidad,precioVenta, cantidad * precioVenta
from productos join LineasPedido ON idFabricante = fabricante and idproducto = Producto;

##Listar el codigo pedido, codigo y nombre del cliente y codigo y nombre del
##empleado que hizo la venta

#Producto cartesiano
SELECT p.codPedido, p.fechaPedido,c.codCliente, c.nombre, e.codEmpleado,e.nombre
FROM Clientes c, Pedidos p, Empleados empleados
WHERE c.codCliente= p.codCliente AND p.codRepresentante = codEmpleado;



#JOIN
SELECT p.codPedido, p.fechaPedido,c.codCliente, c.nombre, e.codEmpleado,e.nombre
FROM Clientes AS c JOIN Pedidos AS p USING (codCliente)
JOIN Empleados AS e ON codEmpleado = p.codRepresentante;


##Listar los clientes con el nombre de su representante
SELECT codCliente, clientes.nombre AS Cliente, codEmpleado, empleados.nombre AS empleados
FROM Clientes JOIN Empleados ON codEmpleado= codRepresentante;


#JOIN
SELECT p.codPedido, p.fechaPedido, c.codCliente, c.nombre, e.codEmpleado, e.nombre AS Empleado, nuevo
FROM Clientes AS c JOIN Pedidos AS p USING (codCliente)
JOIN Empleados AS e ON Empleados = p.codRepresentante;

SELECT p.codPedido, p.fechaPedido, c.codCliente, c.nombre, e.codEmpleado, e.nombre
FROM Clientes c JOIN (Empleados e JOIN Pedidos p ON codEmpleado= codRepresentante)
USING (codCliente);

#Composicion Externa
#Listar todos los clientes con su codPedido y la fecha de pedido

SELECT codCliente,nombre,codpedido,fechapedido
FROM Clientes LEFT JOIN Pedidos USING (codCliente);

#Listar todos los clientes que no han realizado ningún pedido
SELECT codCliente,nombre,codpedido,fechapedido
FROM Clientes LEFT JOIN Pedidos USING (codCliente)
WHERE codPedido IS NULL;

#Listar los productos que no se han vendido

SELECT idFabricante,idfabricante,descripcion,existencias,precioCompra
FROM Productos LEFT JOIN LineasPedido
ON idFabricante = fabricante AND idProducto = producto
WHERE codPedido IS NULL;

SELECT distinct categoría
FROM Empleados
ORDER BY categoría;



#1) Listar las oficinas de Galicia indicando para cada una de ellas su número, ciudad, códigos y
#nombres de sus empleados. Hacer una versión en la que aparecen sólo las que tienen empleados,
#y hacer otra en las que aparezcan las oficinas de Galicia que no tienen empleados.

select e.nombre, e.oficina
from empleados e
where e.oficina in(select oficina from oficina o where region='Galicia');

select o.ciudad, count(e.CodEmpleado) as "NumEmpleados"
from empleados e Right Join oficinas o ON e.oficina=o.codOficina
where o.region ='Galicia'
group by o.codOficina;

#2) Listar los pedidos mostrando su número, fecha del pedido, nombre del cliente, y el límite de
#crédito del cliente correspondiente (todos los pedidos tienen cliente y representante).
select p.codPedido, p.fechaPedido, c.nombre, c.limiteCredito
from clientes c join pedidos p on c.codCliente=p.codCliente;



#3) Listar los datos de cada uno de los empleados, la ciudad y región en donde trabaja.
select e.nombre, fecNacimiento, sueldo, categoria, fecContrato, o.region, o.ciudad
from empleados e join oficinas o on e.Oficina=o.codOficina;


#4) Listar las oficinas con objetivo superior a 3.500€ indicando para cada una de ellas el nombre de
#su director.
SELECT codOficina,ciudad, region, oficinas.objetivo, codEmpleado, codDirector,nombre
FROM Oficinas JOIN Directores USING (codOficina)
JOIN Empleados ON codEmpleado= codDirector
WHERE oficinas.objetivo > 3500;	



#5) Listar las líneas de pedido superiores a 150 €, incluyendo el nombre del empleado que tomó el
#pedido y el nombre del cliente que lo solicitó.
SELECT fabricante, producto, cantidad, precioVenta, cantidad * precioVenta AS Importe,
e.nombre AS Comercial, c.nombre AS Cliente
FROM LineasPedido INNER JOIN Pedidos p USING (CodPedido)
INNER JOIN Clientes c USING (codCliente)
INNER JOIN Empleados e ON p.codRepresentante= e.codEmpleado
WHERE cantidad * precioVenta >150
ORDER BY Importe;

SELECT fabricante, producto, cantidad, precioVenta, cantidad * precioVenta AS Importe,
e.nombre AS Comercial, c.nombre AS Cliente
FROM LineasPedido p, Clientes c, Empleados e, Pedidos p
WHERE cantidad* precioVenta >150 && p.codPedido=l.codPedido
&& p.codCliente= c.codCliente && p.codRepresentante= e.codEmpleado
ORDER BY Importe;



#6) Hallar los empleados que realizaron su primer pedido el mismo día en que fueron contratados.




#7) Listar los empleados con un sueldo superior al de su jefe; para cada empleado sacar sus datos y el
#número, nombre y sueldo de su jefe.

SELECT e.codEmpleado, e.nombre, e.sueldo, jefes.codEmpleado, jefes.nombre, jefes.sueldo
FROM Empleados e JOIN Empleados jefes ON jefes.codEmpleado= e.codJefe
WHERE e.sueldo > jefes.sueldo;



#8) Listar los códigos y nombre de los empleados que tienen una línea de pedido superior a 5.000 € o
#que tengan un objetivo inferior a 200.000 €. (El empleado deberá mostrarse una vez)

SELECT DISTINCT codEmpleado, nombre, objetivo, cantidad* precioVenta as Importe
FROM LineasPedido l JOIN Pedidos p USING (codPedido)
JOIN Empleados ON codRepresentante= codEmpleado
WHERE objetivo > 200000 AND cantidad * precioVenta >5000;


#9) Listar las 5 líneas de pedido con mayor importe indicando el nombre del cliente del producto y
#del representante.

SELECT fabricante, producto, descripcion, cantidad * precioVenta, e.nombre as comercial, c.nombre as cliente
FROM Productos JOIN LineasPedido ON idFabricante = fabricante AND idProducto = productos
JOIN Pedidos USING (codPedido)
JOIN Clientes USING (codCliente)
JOIN Empleados e ON p.codRepresentante= codEmpleado
ORDER BY importe DESC
LIMIT 5;



SELECT fabricante, producto, descripcion, cantidad * precioVenta, e.nombre as comercial, c.nombre as cliente
FROM Pedidos p, LineasPedido l, Productos, Clientes c, Empleados empleados
WHERE p.codPedido = l.codPedido AND p.codCliente= e.codCliente
AND p.codRepresentante = e.codEmpleado
AND idfabricante = fabricante And idproducto = producto
ORDER BY importe DESC
LIMIT 5;




#10) Listar las oficinas que no tienen director.

SELECT o.*, codDirector
FROM oficinas o LEFT JOIN Directores d USING (codOficina)
WHERE codDirector IS NULL;

#11) Seleccionar los clientes que no han realizado ningún pedido.

SELECT clientes.*
FROM Clientes JOIN Pedidos USING (codCliente)
WHERE codPedido IS NULL;

#12) Seleccionar los productos que no han sido vendidos.

SELECT Productos.*
FROM Productos LEFT JOIN LineasPedido ON idfabricante = fabricante AND idProducto = producto
WHERE codPedido IS NULL;


#13) Seleccionar los representantes que no han realizado ninguna venta, indicando el nombre del
#empleado.


######

#5) Listar las líneas de pedido superiores a 150 €, incluyendo el nombre del empleado que tomó el
#pedido y el nombre del cliente que lo solicitó.
select p.codPedido as Pedido, e.nombre as "Nombre Empleado", c.nombre as "Nombre Cliente", (lp.cantidad*lp.precioVenta) as "Total Venta"
from lineasPedido lp 
join pedidos p using (CodPedido) 
join clientes c using (codCliente) 
join empleados e
on c.codRepresentante = e.codEmpleado
where (lp.cantidad*lp.precioVenta)>150;


## group by
select *
from lineaspedido;

select numLinea, producto
from lineaspedido;

select count(*)
from lineaspedido
where producto=410001;


select producto, count(*)
from lineaspedido
group by producto
having count(*)>20;

select producto, count(*), sum(cantidad*precioVenta) TOTAL
from lineaspedido
group by producto
having total>5000;


select (cantidad*precioVenta)
from lineasPedido
group by producto;


#6) Hallar los empleados que realizaron su primer pedido el mismo día en que fueron contratados.
select *
from empleados;

select fecContrato
from empleados;

select *
from empleados e
join pedidos p on e.codEmpleado=p.codRepresentante;


select *
from empleados e join pedidos on e.codEmpleado;

select *
from empleados e;

select *

where fecContrato=(select min(fechaPedido) from pedidos where e.codEmpleado=codRepresentante);

#7) Listar los empleados con un sueldo superior al de su jefe; para cada empleado sacar sus datos y el
#número, nombre y sueldo de su jefe.
select codEmpleado, nombre, sueldo, jefe
from empleado e;

select e.codEmpleado, e.nombre, e.sueldo, e.codJefe, j.codEmpleado, j.nombre, j.sueldo
from empleados e join empleados j on e.codJefe=j.codEmpleado
where j.sueldo<e.sueldo;


#8) Listar los códigos y nombre de los empleados que tienen una línea de pedido superior a 5.000 € o
#que tengan un objetivo inferior a 200.000 €. (El empleado deberá mostrarse una vez)

select *
from empleados
where objetivo;


# , codPedido, numLinea, (cantidad*precioVenta)
select  nombre, codRepresentante
from lineaspedido join pedidos using (codPedido) join empleados on
codRepresentante= codEmpleado
where (cantidad *precioVenta ) > 5000 or objetivo<200000
group by codRepresentante
order by 'pedidos', 'codRepresentate' asc;


