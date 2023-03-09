/*1) Listar las oficinas de Galicia indicando para cada una de ellas su número, ciudad, códigos y
nombres de sus empleados. Hacer una versión en la que aparecen sólo las que tienen empleados,
y hacer otra en las que aparezcan las oficinas de Galicia que no tienen empleados.*/
# Tienen empleados en JOIN
SELECT codOficina, ciudad, region, codEmpleado, nombre
FROM Oficinas JOIN empleados ON codOficina= oficina
WHERE region = 'Galicia';

#Producto cartesiano
SELECT codOficina,ciudad, region, codEmpleado, nombre
FROM Oficinas, Empleados
WHERE region = 'Galicia' AND codOficina = oficina;

# Segunda version oficinas con empleados y sin empleados

SELECT codOficina, ciudad,region, codEmpleado, nombre
FROM Oficinas left JOIN Empleados ON codOficina = oficina
WHERE region = 'Galicia';

SELECT codOficina, ciudad,region, codEmpleado, nombre
FROM Oficinas RIGHT JOIN Oficinas ON codOficina = oficina
WHERE region = 'Galicia';

#Segunda version oficinas sin empleados
SELECT codOficina, ciudad,region, codEmpleado, nombre
FROM Oficinas JOIN Empleados ON codOficina = oficina
WHERE region = 'Galicia' AND codEmpleado IS NULL;

/*2) Listar los pedidos mostrando su número, fecha del pedido, nombre del cliente, y el límite de
crédito del cliente correspondiente (todos los pedidos tienen cliente y representante).*/
SELECT codPedido, fechaPedido, nombre
FROM Pedidos JOIN Clientes USING (codCliente);

SELECT codPedido, fechaPedido, nombre
FROM Pedidos JOIN Clientes ON pedidos.codCliente = clientes.codCliente;

#puedo utilizar un alias para las tablas
SELECT codPedido, fechaPedido, nombre
FROM Pedidos AS p JOIN Clientes AS c ON p.codCliente = c.codCliente;


/*3) Listar los datos de cada uno de los empleados, la ciudad y región en donde trabaja.*/
SELECT codEmpleado, nombre, oficina, ciudad, region
FROM Empleados e JOIN Oficinas ON codOficina = oficina;

SELECT codEmpleado, nombre, oficina, ciudad, region
FROM Empleados, Oficinas
WHERE codOficina = oficina;

SELECT codEmpleado, nombre, oficina, ciudad, region
FROM Empleados e LEFT JOIN Oficinas ON codOficina = oficina;


#4) Listar las oficinas con objetivo superior a 3.500€ indicando para cada una de ellas el nombre de
#su director.
select codOficina, ciudad, region, oficinas.objetivo, codEmpleado, codDirector, nombre
from Oficinas join Directores using (codOficina)
	join Empleados on codEmpleado = codDirector
where oficinas.objetivo > 3500;
    
#producto cartesiano
select o.codOficina, ciudad, region, o.objetivo, codEmpleado, codDirector, nombre
from Oficinas o, empleados e , directores d
where o.objetivo > 3500 && o.codOficina = d.codOficina && d.codDirector = e.codEmpleado;

#5) Listar las líneas de pedido superiores a 150 €, incluyendo el nombre del empleado que tomó el
#pedido y el nombre del cliente que lo solicitó.
select Fabricante, producto, cantidad, precioVenta, cantidad*precioVenta as Importe,
	e.nombre as Comercial, c.nombre as Cliente
from lineasPedido l inner join pedidos p using (CodPedido)
	inner join Clientes c using (codCliente)
    inner join Empleados e on p.codRepresentante  = e.codEmpleado
where cantidad * precioVenta > 150
order by Importe;

select Fabricante, producto, cantidad, precioVenta, cantidad*precioVenta as Importe,
		e.nombre as Comercial, c.nombre as Cliente
from lineaspedido l, clientes c, Empleados e, pedidos p
where cantidad * precioVenta > 150 && p.codPedido = l.codPedido
	&& p.codCliente = c.codCliente && p.codRepresentante = e.codEmpleado
order by Importe;


## 6) Hallar los empleados que realizaron su primer pedido el mismo día en que fueron contratados.


#7) Listar los empleados con un sueldo superior al de su jefe; para cada empleado sacar sus datos y el
#número, nombre y sueldo de su jefe.
select e.CodEmpleado, e.nombre, e.sueldo, jefes.CodEmpleado, jefes.nombre, jefes.sueldo
from Empleados e join Empleados jefes on jefes.codEmpleado = e.codJefe
where e.sueldo > jefes.sueldo;

#8) Listar los códigos y nombre de los empleados que tienen una línea de pedido superior a 5.000 € o
#que tengan un objetivo inferior a 200.000 €. (El empleado deberá mostrarse una vez)
select distinct codEmpleado, nombre, objetivo, cantidad * precioVenta as Importe
from lineaspedido l join Pedidos p using (codPedido)
	join Empleados on CodRepresentante = codEmpleado
where objetivo > 200000 && cantidad * precioVenta > 5000;


#9) Listar las 5 líneas de pedido con mayor importe indicando el nombre del cliente del producto y
#del representante.

select fabricante, producto, descripcion, cantidad * precioVenta as importe, e.nombre as comercial, c.nombre as Cliente
from   Productos join lineaspedido on idFabricante = fabricante and idProducto = producto
	join Pedidos p using (codPedido)
    join Clientes c using (codCliente)
    join Empleados e on p.codRepresentante = codEmpleado
order by importe desc limit 5;

select fabricante, producto, descripcion, cantidad * precioVenta as importe, e.nombre as comercial, c.nombre as Cliente
from Pedidos p, LineasPedido l, Productos, Clientes c, empleados e
where p.codPedido = l.codPedido and p.codCliente = c.codCliente
	and p.codRepresentante = e.codEmpleado
    and idfabricante = fabricante and idProducto = producto
order by importe desc limit 5;

#10) Listar las oficinas que no tienen director.
select o.*,codDirector
from oficinas o left join directores d using (codOficina)
where codDirector is null;

select o.*,codDirector
from directores d right join oficinas o using (codOficina)
where codDirector is null;

#11) Seleccionar los clientes que no han realizado ningún pedido.

select *
from Clientes join Pedidos using (codCliente)
where codPedido is null;

#12) Seleccionar los productos que no han sido vendidos.
select Productos.*
from Productos left join lineaspedido on idFabricante = fabricante and idProducto = producto
where codPedido is null; 

#13) Seleccionar los representantes que no han realizado ninguna venta, indicando el nombre del
#empleado.