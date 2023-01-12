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
SELECT e.nombre AS Pedido, e.nombre AS "Nombre empleado", c.nombre AS "Nombre cliente", (lp.cantidad*lp.precioVenta) AS "Total línea"
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
HAVING TOTAL>5000
