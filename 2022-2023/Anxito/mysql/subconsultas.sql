## 1) Listar los nombres de los clientes que tienen asignado el representante García Gómez, Luis
## Antonio (suponiendo que no pueden haber representantes con el mismo nombre).

SELECT Nombre
FROM clientes
WHERE codRepresentante=(SELECT codEmpleado FROM empleados WHERE nombre ="García Gómez, Luis Antonio") ;

## lo mismo con un JOIN
SELECT c.nombre
FROM empleados e JOIN clientes c ON e.codEmpleado=c.codRepresentante
WHERE e.nombre="García Gómez, Luis Antonio";

## 2) Listar los vendedores (codEmpleado, nombre, y no de oficina) que trabajan en oficinas "buenas"
## (las que tienen ventas superiores a su objetivo).

SELECT codempleado, nombre
FROM empleados
WHERE oficina IN (SELECT codOficina FROM oficinas WHERE objetivo>ventas);

SELECT  p.codRepresentante, SUM(lp.cantidad*lp.precioVenta),o.objetivo
FROM lineaspedido lp JOIN pedidos p ON lp.codPedido=p.codPedido JOIN empleados e ON
p.codrepresentante=e.codEmpleado JOIN oficinas ON e.oficina=o.codOficina
GROUP BY e.oficina
HAVING SUM(lp.cantidad*lp.precioVenta);


SELECT p.codPedido, SUM(lp.cantidad*lp.precioVenta),o.objetivo
FROM pedidos p JOIN lineaspedido lp ON p.codPedido=lp.codPedido JOIN empleados e ON
p.codRepresentante=e.codEmpleado JOIN oficinas o ON e.oficina =o.codOficina
GROUP BY e.oficina;


## 3) Listar los vendedores que no trabajan en oficinas dirigidas por el empleado 108.
SELECT *
FROM empleados
WHERE