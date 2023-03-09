#Listar de la tabla de productos el idFabricante, el idProducto de aquellos productos con existencia menores que 50
#de la tabla lineasPedido el fabricante, y el producto de los productos con precioVenta mayor de 100

SELECT idFabricante, idProducto
FROM Productos
WHERE existencias > 50;

SELECT fabricante, producto, precioVenta
FROM LineasPedido
WHERE precioVenta> 100
UNION
SELECT fabricante, producto, precioVenta
FROM LineasPedido
WHERE precioVenta> 300
ORDER BY descripcion;