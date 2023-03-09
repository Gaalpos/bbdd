## JOIN (INNER JOIN)
	SELECT DISTINCT coddirector, codempleado, nombre
	FROM directores JOIN empleados ON coddirector = codempleado;

	SELECT codpedido, fechapedido, pedidos.codcliente, clientes.codcliente, nombre
	FROM pedidos JOIN clientes USING(codCliente);

	SELECT pedidos.*, clientes.nombre, empleados.nombre 
	FROM (Clientes JOIN pedidos USING (codcliente))
	JOIN empleados ON pedidos.codrepresentante = codEmpleado;

	#otra forma de enlazar los joins
	SELECT pedidos.*, clientes.nombre, empleados.nombre
	FROM clientes JOIN (Pedidios JOIN empleados ON pedidos.codRepresentante = codempleado) USING (codcliente);
    
## LEFT JOIN
	SELECT codpedido, fechapedido, pedidos.codCliente, clientes.codCliente, nombre
	FROM clientes LEFT JOIN pedidos USING (codcliente);
## RIGHT JOIN (mismo resultado que la anterior)
	SELECT codpedido, fechapedido, pedidos.codCliente, clientes.codCliente, nombre
	FROM pedidos RIGHT JOIN clientes USING (codcliente);
    