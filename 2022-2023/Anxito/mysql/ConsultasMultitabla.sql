##primero
SELECT p.codPedido, p.fechaPedido, c.nombre,c.limiteCredito
FROM clientes c JOIN pedidos p ON c.codCliente=p.codCliente;

## segundo
SELECT e.nombre, fecNacimiento, sueldo, categoria, fecContrato, o.region, o.ciudad
FROM empleados e JOIN oficinas o ON e.codOficina=o.codOficina;

##tercero
SELECT  o.codOficina, o.ciudad, e.nombre
FROM oficinas o JOIN Directores d USING(codOficina) JOIN empleados e ON  d.codDirecor=e.codDirector
WHERE o.objetivo>3500;

##cuatro
SELECT e.noDniDnimbre AS Pedido, e.nombre AS "Nombre empleado", c.nombre AS "Nombre cliente", (lp.cantidad*lp.precioVenta) AS "Total línea"
FROM lineasPedido lp JOIN pedidos p USING(CodPedido)
JOIN clientes c USING (CodCliente) JOIN empleados e ON c.codRepresentante=e.codEmpleado
WHERE (lp.cantidad*lp.precioVenta)>150;

##cinco
SELECT *
FROM pedidos;

##seis
SELECT numLinea, producto
FROM lineaspedido
WHERE producto=410001;

##siete
SELECT producto,COUNT(*), SUM(cantidad*precioVenta) TOTAL
FROM lineaspedido
GROUP BY proucto
HAVING TOTAL>5000;

## siete ejercicio de clase
SELECT e.codEmpleado, e.nombre, e.sueldo, e.codJefe, j.codEmpleado, j.sueldo
FROM empleados e JOIN empleados j ON e.codJefe=j.codEmpleado
WHERE j.sueldo<e.sueldo;

##ocho
SELECT DISTINCT (codrepresentante),nombre, codPedido, numLinea, (cantidad*precioVenta)
FROM lineaspedido JOIN pedidos USING (codPedido) JOIN empleados ON codRepresentante=codEmpleado
WHERE (cantidad*precioVenta)>5000 OR objetivo<200000
GROUP BY codrepresentante
ORDER BY 'pedidos','codRepresentante' ASC;

##ocho 2.0
SELECT *
FROM empleados e
WHERE fecContrato = (SELECT MIN (fechaPedido) FROM pedidos 
WHERE e.codEmpleado=codrepresentante);

## ocho ejercicio clase
SELECT *
FROM lienaspedido
WHERE (cantidad*precioVenta)>5000;

## ejemplos 

SELECT MAX(sueldo)
FROM empleados;

SELECT *
FROM empleados
WHERE sueldo IN(SELECT MAX(sueldo) FROM empleados);

SELECT *
FROM empleados
WHERE sueldo=(SELECT MAX(sueldo) FROM empleados);

SELECT e.nombre, e.fecNacimiento, e.oficina, (SELECT MAX(sueldo) FROM empleados)
FROM empleados e;

SELECT e.nombre, e.fecNacimiento, e.oficina,(SELECT region FROM oficinas WHERE
CodOficina=e.oficina )
FROM empleados e;

SELECT e.nombre, e.fecnacimiento, e.oficina, (SELECT region FROM oficinas WHERE
CodOficina=e.oficina )
FROM empleados e JOIN oficinas o ON e.oficina=o.codOficina; 


