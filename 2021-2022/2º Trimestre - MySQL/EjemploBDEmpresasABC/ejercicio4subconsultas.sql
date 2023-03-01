## Ejercicios Subconsultas

## 1) Listar los nombres de los clientes que tienen asignado el representante García Gómez, Luis
## Antonio (suponiendo que no pueden haber representantes con el mismo nombre).
select nombre
from clientes
where codRepresentante = (select codempleado from empleados where nombre = 'García Gómez, Luis Antonio');

## con join
select clientes.*
from clientes join empleados on codEmpleado = codRepresentante
where empleados.nombre = "García Gómez, Luis Antonio";

## 2) Listar los vendedores (codEmpleado, nombre, y no de oficina) que trabajan en oficinas "buenas"
## (las que tienen ventas superiores a su objetivo).

## subconsulta saber oficinas  buenas
select codoficina from oficinas where ventas > objetivo;

select codEmpleado, nombre, codOficina
from empleados
where oficina in (
select codoficina 
from oficinas 
where ventas > objetivo);


select nombre,codEmpleado, sueldo
from empleados 
where  exists (
select * 
from oficinas
where ventas > objetivo and codOficina = codOficina);

select codEmpleado, nombre, codOficina
from empleados join oficinas on codOficina= oficina
where ventas > oficinas.objetivo;

## 3) Listar los vendedores que no trabajan en oficinas dirigidas por el empleado 108.
select codEmpleado, nombre, categoria, oficina
from empleados
where oficina not in( select codOficina from directores where codDirector = 108); 

select *
from empleados
where oficina not in (21,22,23,24); ## asi sabes las oficinas que dirige
## subconsultas obtener las oficinas que dirige el 108
select codOficina
from directores
where codDirector =108;



## 4) Listar los productos (idfabricante, idproducto y descripción) para los cuales no se ha recibido
## ningún pedido de 500 € o más.
## subconsulta: averiguar cualess son los productos con lineas de pedido mayores a 500 

select fabricante, producto, cantidad * precioVenta from lineasPedido
where cantidad * precioVenta > 500;

select idFabricante, idproducto, descripcion
from productos 
where (idfabricante, idproducto) not in (select fabricante, producto from lineaspedido
where cantidad * precioVenta > 500);

select idFabricante, idproducto, descripcion
from productos 
where row (idfabricante, idproducto) not in (select fabricante, producto from lineaspedido
where cantidad * precioVenta > 500);

select idfabricante, idproducto, descripcion
from productos 
where not exists (select Fabricante, producto from lineaspedido
where cantidad * precioVenta > 500 and idFabricante= fabricante and idProducto = producto);

select distinct idfabricante, idproducto, descripcion, cantidad* precioVenta
from productos left join lineaspedido on idFabricante = fabricante and idProducto = producto
where cantidad * precioVenta < 500 or cantidad * precioVenta is null
order by idfabricante, idproducto;


## 5) Listar los clientes asignados a García Gómez, Luis Antonio que no han remitido un pedido
## superior a 5.000 €.

## Listar los clientes asignados aListar los clientes asignados a García Gómez, Luis Antonio
select codEmpleado from empleados where nombre="García Gómez, Luis Antonio";

## obtener los clientes con pedidos superiores a 5000 €
select codcliente, sum(cantidad*precioVenta)
from pedidos join lineaspedido using (codPedido)
group by codPedido;

select *
from clientes where codRepresentante = (select codEmpleado from empleados where nombre = "García Gómez, Luis Antonio")
and codCliente not in (select codCliente
from pedidos join lineaspedido using (codPedido)
group by codPedido
having sum(cantidad*precioVenta)>5000);

## 6) Listar las oficinas en donde haya un vendedor cuyas ventas representen más del 55% del objetivo
## de su oficina.

##subconsulta
select sum(cantidad* precioVenta), codrepresentante
from pedidos join lineaspedido using (codPedido)
group by  codRepresentante;


select *
from Oficinas
where objetivo * 0.55 < any (select sum(cantidad* precioVenta) from pedidos join lineaspedido using (codPedido)
join empleados on codRepresentante = codEmpleado group by codRepresentante);



## 7) Listar las oficinas en donde todos los vendedores tienen sueldos que superan al 50% del objetivo
## de la oficina.
select oficinas.*
from oficinas
where objetivo*05 < all(select sueldo from empleados where codOficina = oficina);

## subcolsulta
select sueldo from empleados

## 8) Listar las oficinas que tengan un objetivo mayor que la suma de los objetivos de sus vendedores.


## 9) Listar las oficinas que tengan un objetivo mayor que la suma de los objetivos de sus vendedores.


## 10) Hallar cuántos pedidos (total de cada pedido) hay de más de 1800 €.


## 11) Saber cuántas oficinas tienen empleados con ventas superiores a su objetivo, no queremos saber
## cuáles sino cuántas hay.


## 12) Listar las oficinas en donde todos los vendedores tienen ventas que superan al 50% del objetivo
## de la oficina.


## 13) Seleccionar los pedidos, entendiendo por un pedido el Código del pedido y todas sus líneas, con
## un importe superior a 30.000€.


## 14) Listar las oficinas que no tienen director.


## 15) Seleccionar los clientes que no han realizado ningún pedido.


##subconsultas


## 16) Seleccionar los productos que no han sido vendidos.


## 17) Seleccionar los representantes que no han realizado ninguna venta, indicando el nombre del
## empleado.