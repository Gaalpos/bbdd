/*
1) Listar las oficinas de Galicia indicando para cada una de ellas su número, ciudad, códigos y
nombres de sus empleados. Hacer una versión en la que aparecen sólo las que tienen empleados,
y hacer otra en las que aparezcan las oficinas de Galicia que no tienen empleados.
*/


/*
2) Listar los pedidos mostrando su número, fecha del pedido, nombre del cliente, y el límite de
crédito del cliente correspondiente (todos los pedidos tienen cliente y representante).
*/

#producto cartesiano
select codPedido, fechaPedido, clientes.nombre as CLIENTE, clientes.codcliente, limitecredito,
empleados.nombre as representante
from Pedidos, Clientes, Empleados
where pedidos.codCliente = clientes.codCliente and codEmpleado = pedidos.codrepresentante;

#composicion interna
select p.codPedido, p.fechaPedido, c.nombre as CLIENTE, c.codcliente, limitecredito,
e.nombre as Representante
from Pedidos as p join Clientes as c using(codCliente) join Empleados e on codEmpleado = p.codRepresentante;
/*
3) Listar los datos de cada uno de los empleados, la ciudad y región en donde trabaja.
*/
select *, ciudad, region
from Empleados, oficinas
where codOficina =codOficina;

#composicion interna se muestran las oficinas con empleados
select Empleados.*,ciudad, region
from oficinas join empleados on codOficina =Oficina;

#composicion externa listar todas las oficinas y los datos de los empleados cuando los tengan
select Empleados.*, ciudad, region
from oficinas left join empleados on codOficina = oficina;

##mismo resultado
select empleados.*, ciudad, region
from empleados right join Oficinas on CodOficina = Oficina;

##composicion externa se muestren todos los empleados aunque no tengan oficina asignada
select empleados.*, ciudad, region
from empleados left join oficinas on CodOficina = Oficina;


select empleados.*, ciudad, region
from oficinas right join empleados on CodOficina = Oficina;
/*
4) Listar las oficinas con objetivo superior a 3.500€ indicando para cada una de ellas el nombre de
su director.
*/
select oficina, nombre, ciudad, region, oficinas.objetivo
from Empleados join Directores on codDirector = CodEmpleado
join oficinas using (codOficina)
where oficinas.objetivo > 3500;


/*
5) Listar las líneas de pedido superiores a 150 €, incluyendo el nombre del empleado que tomó el
pedido y el nombre del cliente que lo solicitó el producto
*/
select descripcion, cantidad,precioVenta, cantidad * precioVenta as importe
from productos join lineaspedido on  idFabricante = fabricante and idProducto=producto
join pedidos using (codPedido) join Empleados as e on codEmpleado = codRepresentante
join clientes using (codCliente)
where cantidad * precioVenta > 150;

select clientes.nombre as Cliente, e.nombre as vendedor, descripcion, precioVenta,
cantidad * precioVenta as importe
from Productos, lineaspedido, pedidos, clientes, empleados e
where cantidad *precioVenta > 150 and idProducto = producto and idFabricante =fabricante and
Pedidos.codPedido = lineaspedido.codPedido and pedidos.codrepresentante = codEmpleado 
and pedidos.codCliente= clientes.codCliente;

/*
6) Hallar los empleados que realizaron su primer pedido el mismo día en que fueron contratados.
*/
select nombre , fechapedido, feccontrato
from pedidos join empleados on codRepresentante=codempleado
where fecContrato = fechaPedido;

/*
7) Listar los empleados con un sueldo superior al de su jefe; para cada empleado sacar sus datos y el
número, nombre y sueldo de su jefe.
*/
select empleados.codEmpleado,empleados.codJefe, empleados.nombre, empleados.sueldo, 
jefes.codEmpleado, jefes.nombre, jefes.sueldo
from empleados join empleados as jefes on empleados.codjefe = jefes.codempleado
where empleados.sueldo > jefes.sueldo;

/*
8) Listar los códigos y nombre de los empleados que tienen una línea de pedido superior a 5.000 € o
que tengan un objetivo inferior a 200.000 €. (El empleado deberá mostrarse una vez)
*/
## join
select codempleado, nombre, cantidad, precioVenta, objetivo
from empleados join pedidos on codRepresentante=codEmpleado join lineaspedido using(codpedido)
where cantidad *precioventa > 5000 or objetivo < 200000;

## join
select distinct codempleado, nombre
from empleados join pedidos on codRepresentante=codEmpleado join lineaspedido using(codpedido)
where cantidad *precioventa > 5000 or objetivo < 200000;

## producto cartesiano
select distinct codEmpleado,nombre
from empleados, pedidos, lineaspedido
where (codRepresentante = codEmpleado and Pedidos.codPedido = lineaspedido.codPedido)
and (cantidad *precioVenta > 5000 or objetivo < 200000);

/*
9) Listar las 5 líneas de pedido con mayor importe indicando el nombre del cliente del producto y
del representante.
*/
select clientes.nombre, empleados.nombre, codPedido, cantidad*precioVenta as importe, descripcion
from lineaspedido join pedidos using(codpedido)
 join clientes using(codcliente)
 join empleados on Pedidos.codRepresentante = codEmpleado
 join productos on idFabricante=fabricante and idproducto = producto
 order by importe desc
 limit 5;

/*
10) Listar las oficinas que no tienen director.
*/
## composicion externa
select oficinas.*, codDirector
from oficinas left join directores using(codoficina)
where codDirector is null;


/*
11) Seleccionar los clientes que no han realizado ningún pedido.
*/
##composicion externa
select clientes.*,pedidos.codcliente
from clientes left join pedidos USING(codcliente)
where codPedido is null; 


/*
12) Seleccionar los productos que no han sido vendidos.
*/
select productos.*,lineaspedido.codPedido
from productos join lineaspedido on idFabricante = fabricante and idproducto=producto;

/*
13) Seleccionar los representantes que no han realizado ninguna venta, indicando el nombre del
empleado.
*/