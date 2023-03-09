## SUBCONSULTAS
	SELECT codempleado, nombre, (SELECT MIN(fechapedido) FROM pedidos WHERE codempleado = codrepresentante)
	FROM empleados;
    
    SELECT nombre
	FROM clientes
	WHERE codRepresentante = (SELECT codempleado FROM empleados WHERE nombre = 'García Gómez, Luis Antonio');
    
    ## ANY
		SELECT codOficina, objetivo
		FROM oficinas 
		WHERE objetivo > ANY( SELECT sum(sueldo) FROM empleados GROUP BY oficina);
    
    ## EXISTS
		SELECT codEmpleado, nombre, oficina, sueldo
		FROM empleados
		WHERE EXISTS (SELECT * FROM oficinas WHERE region = 'Euzkadi' AND oficina = codoficina);

		SELECT codempleado, nombre, oficina, sueldo
		FROM empleados
		WHERE NOT EXISTS (SELECT * FROM oficinas WHERE region = 'Euzkadi' AND oficina = codoficina);
    
    SELECT nombre, categoria, fecnacimiento, sueldo
	FROM empleados
	WHERE (categoria, fecnacimiento) = 
	(SELECT categoria, fecnacimiento FROM empleados
	WHERE nombre = 'Viguer Ojanguren, Antonio');