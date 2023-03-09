## Ejercicios Subconsultas

## 1) Listar los nombres de los clientes que tienen asignado el representante García Gómez, Luis
## Antonio (suponiendo que no pueden haber representantes con el mismo nombre).
select nombre
from clientes
where codrepresentante = (select codempleado from empleados where nombre = 'García Gómez, Luis Antonio');

## 2) Listar los vendedores (codEmpleado, nombre, y no de oficina) que trabajan en oficinas "buenas"
## (las que tienen ventas superiores a su objetivo).
select codEmpleado, nombre, oficina
from empleados
where oficina = (select codoficina from oficinas where sum(ventas.empleados) > objetivo);

## 3) Listar los vendedores que no trabajan en oficinas dirigidas por el empleado 108.
select *
from empleados
where oficina = (select codoficina from directores where codDirector <> 108); 

## 4) Listar los productos (idfabricante, idproducto y descripción) para los cuales no se ha recibido
## ningún pedido de 500 € o más.


## 5) Listar los clientes asignados a García Gómez, Luis Antonio que no han remitido un pedido
## superior a 5.000 €.


## 6) Listar las oficinas en donde haya un vendedor cuyas ventas representen más del 55% del objetivo
## de su oficina.


## 7) Listar las oficinas en donde todos los vendedores tienen sueldos que superan al 50% del objetivo
## de la oficina.


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
select clientes.*, codpedido
from clientes left join pedidos using (codcliente)
where codPedido is null;

##subconsultas
select *
from clientes
where codcliente not in (select codcliente from pedidos);


## 16) Seleccionar los productos que no han sido vendidos.


## 17) Seleccionar los representantes que no han realizado ninguna venta, indicando el nombre del
## empleado.