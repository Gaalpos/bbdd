/*
1) ¿Cuál es el sueldo medio y el sueldo total de todos los empleados?
*/
select avg (sueldo), avg(sueldo+ ifnull(comision, 0)), sum(sueldo), sum(sueldo + ifnull(comision,0))
from empleados;

/*
2) Hallar el importe medio de pedidos, el importe total de pedidos y el precio medio de venta.
*/
select avg (cantidad * precioVenta), sum(cantidad*precioVenta), avg (precioVenta)
from lineasPedido;


/*
3) Hallar el precio medio de los productos del fabricante ACI.
*/
## la media de los productos vendidos
select fabricante , avg (precioVenta)
from lineaspedido
where fabricante = "aci";


select fabricante , avg (precioVenta)
from lineaspedido
where fabricante = "aci"
group by fabricante;

## media del precio de compra de ltodos los productos
select fabricante , avg (precioVenta)
from productos
where fabricante = "aci"
group by fabricante;

##listar el precio de compra y venta de los productos del fabricante aci
select idFabricante, format(avg (precioventa),2),format(avg(precioCompra),2)
from lineaspedido join productos on idfabricante = fabricante and producto = idproducto
where fabricante ="aci";

select idFabricante, format(avg (precioventa),2),format(avg(ifnull(precioCompra,0)),2)
from lineaspedido right join productos on idfabricante = fabricante and producto = idproducto
where fabricante ="aci";
/*
4) Hallar el precio medio de los productos del fabricante ACI, BIC, QSA e IMM.
*/
select fabricante , (precioVenta), format (avg(precioVenta ),2)
from lineaspedido
where fabricante in ("aci", "bic", "qsa", "imm")
group by fabricante;

/*
5) Hallar el precio medio de los productos del fabricante ACI, BIC, QSA e IMM únicamente si el
precio medio supera los 180 €.
*/
select fabricante , (precioVenta), format (avg(precioVenta ),2)
from lineaspedido
where fabricante in ("aci", "bic", "qsa", "imm")
group by fabricante
having avg(precioVenta)>180;


/*
6) ¿Cuál es el importe total de los pedidos realizados por el empleado 'Vázquez Lopez, Jose Luis'?
*/
select nombre, sum(cantidad * precioVenta)
from empleados join pedidos on codRepresentante = codEmpleado
join lineaspedido using (codPedido)
where nombre = 'Vázquez Lopez, Jose Luis';

select nombre, sum(cantidad * precioVenta)
from empleados join (lineaspedido join pedidos  using (codPedido))
on codRepresentante = codEmpleado
where nombre = 'Vázquez Lopez, Jose Luis';

## total vendido por cada empleado
select sum(cantidad*precioVenta)
from empleados join pedidos on codRepresentante=codEmpleado
join lineaspedido using (codPedido)
group by nombre;

 ## total vendido por cada empleado  cada mes
select sum(cantida*precioVenta), month (fechapedido)
from empleados join pedidos on codRepresentante=codEmpleado
join lineaspedido using (codPedido)
group by nombre, month (fechapedio)
order by nombre;
/*
7) Hallar en qué fecha se realizó el primer pedido (suponiendo que en la tabla de pedidos tenemos
todos los pedidos realizados hasta la fecha).
*/
select fechaPedido
from pedidos
order by fechapedido
limit 1;

select min(fechaPedido)
from pedidos;


/*
8) Hallar cuántas líneas de pedido hay de más de 5.000 €.
*/
select count(precioVenta*cantidad), count(*), count(codPedido)
from LineasPedido
where cantidad*precioVenta > 5000;


/*
9) Listar cuántos empleados están asignados a cada oficina, indicar el número de oficina y cuántos
hay asignados.
*/
select Oficina, count(codEmpleado)
from empleados
group by oficina;

select Oficina, count(codEmpleado)
from empleados left join Oficinas on codOficina = oficina 
group by oficina;

/*
10) Para cada empleado, obtener su número, nombre, e importe vendido por ese empleado a cada
cliente indicando el número y nombre del cliente.
*/
select codEmpleado, e.nombre as vendedor, sum(cantidad*precioVenta),
codCliente , c.nombre as cliente
from empleados e join pedidos on codRepresentante = codEmpleado
join clientes c using (codCliente) 
join lineaspedido using (codPedido)
group by codEmpleado, codCliente
order by e.nombre;



/*
11) Para cada empleado cuyos pedidos suman más de 100.000 €, hallar su importe medio de
pedidos. En el resultado indicar el número de empleado y su importe medio de pedidos.
*/
select nombre, format(avg(cantidad*precioVenta),2) , sum(cantidad*precioVEnta)
from empleados join pedidos on codEmpleado= codRepresentante
join lineaspedido using (codPedido)
where cantidad * precioVenta > 100000
group by nombre
having sum(cantidad*precioVenta) > 300000;



/*
12) Listar de cada producto, su descripción, precio y cantidad total pedida, incluyendo sólo los
productos cuya cantidad total pedida sea superior al 75% del stock; y ordenado por cantidad
total pedida.
*/
select descripcion, precioCompra, sum(cantidad+Existencias)
from productos join lineaspedido on
idfabricante = fabricante and idProducto = producto
group by descripcion, existencias, precioCompra
having sum(cantidad+Existencias)>0.75*existencias
order by sum(cantidad+ existencias);
/*
13) Listar las pedidos superiores a 10.000 €, incluyendo el nombre del empleado que tomó el pedido
y el nombre del cliente que lo solicitó.
*/
select codPedido, empleados.nombre as vendedor, clientes.nombre as cliente,
sum(cantidad*precioVenta) as total
from empleados join pedidos on pedidos.codRepresentante = codEmpleado
join clientes using (codcliente)
join lineaspedido using (codpedido)
group by codPedido
having total > 10000;

/*
14) Listar los 5 pedidos con mayor importe indicando el nombre del cliente del producto y del
representante.
*/
select nombre, codPedido, sum(cantidad*precioVenta)
from lineaspedido join pedidos using(codPedido)
join clientes using(codCliente)
group by codPedido, nombre
order by sum(cantidad*PrecioVenta) desc 
limit 5;


/*
15) Listar ordenadamente por el importe vendido por cada empleado, indicando su nombre.
*/


/*
16) Obtener el nombre de todos los empleados cuyas ventas no han llegado a cubrir el objetivo que
tenían, además se deberá listar también cual es la cantidad y el porcentaje que representa.
*/



/*
17) Calcular el total vendido a cada cliente
*/



/*
18) Calcular el total vendido a cada cliente de cada producto
*/



/*
19) Calcular el total de cada pedido, indicando el nombre del cliente, la fecha del pedido
*/




/*
20) Calcular el total vendido cada mes
*/
select fechapedido, cantidad*precioVenta
from pedidos join lineaspedido using (codpedido)
group by month(fechapedido) ;

select year(fechapedido) ,month(fechapedido), cantidad*precioVenta
from pedidos join lineaspedido using (codpedido)
group by month(fechapedido), year(fechapedido);
/*
21) Seleccionar para cada fabricante el precio medio de sus productos
*/



/*
22) Indicar cuál es el producto del que se han vendidos más unidades,
*/
select idfabricante , idproducto, descripcion, sum(cantidad)
from productos join lineaspedido on idFabricante = fabricante and idProducto = producto
group by idFabricante, idProducto, descripcion
order by sum(cantidad) desc
limit 1;



/*
23) Calcular para cada producto el beneficio (Ingresos – gastos), indicando el producto, el total
vendido y el total comprado.
*/



/*
24) Listar ordenadamente por el importe vendido por cada empleado, indicando su nombre.
*/



/*
25) Obtener las ventas mensuales de los empleados. Hay que diseñar una consulta sumaria
calculando la suma de los importes de los pedidos agrupando por empleado y mes de la venta.
*/
select nombre, month(fechaPedido), sum(cantidad*precioVenta) 
from empleados join pedidos on codRepresentante = codEmpleado
join lineaspedido using (codpedido)
group by nombre, month(fechapedido)
having sum(cantidad*precioVenta) > 20000
order by nombre;



/*
26) Igual que la anterior pero sólo nos interesan los meses de febrero, mayo y diciembre.
*/
select nombre, month(fechaPedido), sum(cantidad*precioVenta) 
from empleados join pedidos on codRepresentante = codEmpleado
join lineaspedido using (codpedido)
where month(fechaPedido) in (2,3,12)
group by nombre, month(fechapedido)
having sum(cantidad*precioVenta) > 20000
order by nombre;


/*
27) Igual que la anterior pero sólo nos interesan los meses de febrero, mayo y diciembre y la suma de
los pedidos sea mayor que 60000.
*/


/*
28) Obtener para cada empleado cuánto ha vendido en total y cuál ha sido el importe mayor vendido
en un pedido.
*/