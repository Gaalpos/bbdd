## listar el nombre del empleado, la oficina en al que trabaja indicando
## la ciudad y las ventas de la oficina
## JOIN

SELECT codEmpleado, nombre, oficina, cofoicina, ciuad, ventas
FROM Empleados JOIN oficinas ON oficinas = codoficina;

## producto cartesiano

SELECT codEmpleado, nombre, oficina, cofoicina, ciuad, ventas
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

# join

select codPedido, descripcion, cantidad,precioVenta, cantidad * precioVenta
from productos join LineasPedido ON idFabricante = fabricante and idproducto = Producto;

select * from aaaejemplo.cursos;

insert into cursos values (4, 'PASI');

select *
from Alumnos join Cursos using (codCurso);


## listar el codigo del pedido, codigo y nombre del cliente y el codigo y nombre DELETE
# empleado que hizo la venta

# join
select p.codPedido, p.fechaPedido, c.codCliente, c.nombre, e.codEmpleado, e.nombre
from Clientes as c join Pedidos as p using (codCliente)
join Empleados as E on codEmpleado = p.codRepresentante;

#producto cartesiano
select p.codPedido, p.fechaPedido, c.codCliente, c.nombre, e.codEmpleado, e.nombre
from Clientes c, Pedidos p, Empleados e
where c.codCliente = p.codCliente and p.codRepresentante = codEmpleado;


# listar los clientes con el nombre de su representante

select codCliente, nombre as Cliente, codEmpleado, codEmpleado, empleados.nombre as empleado
from Clientes join Empleados on codEmpleado = codRepresentante;

## utilizando un alias para las tablas
#select  codCliente, c.nombre as Cliente, codEmpleado, e.nombre as empleado

###

select p.codPedido, p.fechaPedido, c.codCliente, c.nombre, e.codEmpleado, e.nombre
from Clientes c join ( Empleados join Pedidos on codEmpleado = codRepresentante)
using (codCliente);

select p.codPedido, p.fechaPedido, c.codCliente, c.nombre, e.codEmpleado, e.nombre
from Clientes c join ( Empleados join Pedidos on codEmpleado = codRepresentante)
using (codCliente);

## COMPOSICION EXTERNA

# listar los clientes con su codPedido y fecha pedido

select codCliente, nombre, codPedido, fechaPedido
from clientes left join Pedidos using (codCliente);

# listar los cleitnes que no han realizado ningun pedido

select codCliente, nombre, codPedido, fechaPedido
from clientes left join Pedidos using (codCliente)
where codPedido is null;


# listar los productos que no se han vendido
select idFabricante, idfabricante, descripcion, existencias, precioCompra, codPedido
from Productos left join LineasPedido
on idFabricante = fabricante and idProducto = producto
where codPedido is null;