## listar de la tabla de prodcutos  el idfabricante, el idProducto de
# aquellos productos con existencias menores de 100
# de la tabla LienasPedido el fabricante,y el producto de los productos con
# preciovneta mayor a 300


select idFabricante, idProducto, existencias
from Productos
where existencias > 100; # resultado es 23

select fabricante, producto, precioVenta
from LineasPedido
where precioVenta > 300; # resultado 160


select idFabricante, idProducto, existencias
from Productos
where existencias > 100
union
select fabricante, producto, precioVenta
from LineasPedido
where precioVenta > 300
order by existencias;


