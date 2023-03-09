## PRODUCTO CARTESIANO
	SELECT codPedido, fechaPedido, pedidos.codCliente, clientes.codCliente,nombre
	FROM pedidos, clientes
	WHERE pedidos.codcliente = clientes.codcliente
	ORDER BY codPedido;

	SELECT Pedidos.*, clientes.nombre, empleados.nombre
	FROM Clientes, Pedidos, Empleados
	WHERE pedidos.codcliente = clientes.codcliente AND codrepresentante.pedidos = codempleado;
