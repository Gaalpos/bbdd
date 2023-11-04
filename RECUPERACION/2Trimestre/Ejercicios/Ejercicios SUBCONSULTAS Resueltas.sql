#EJERCICIO 8-9
SELECT o.codOficina,o.ciudad,o.objetivo
FROM oficinas o
WHERE o.objetivo > (SELECT SUM(objetivo) FROM empleados WHERE Oficina=o.codOficina);

#EJERCICIO 10
SELECT COUNT(p.codPedido)
FROM pedidos p 
WHERE (SELECT SUM(precioVenta*cantidad) FROM lineaspedido WHERE codPedido=p.codPedido)>1800;

SELECT COUNT(*) FROM (
SELECT p.codPedido,SUM(lp.cantidad*lp.precioVenta)
FROM pedidos p JOIN lineaspedido lp USING(codPedido)
GROUP BY p.codPedido
HAVING SUM(lp.cantidad*lp.precioVenta)>1800) a;

#Ejercicio 11

SELECT codOficina,objetivo
FROM oficinas o
WHERE o.objetivo<(SELECT SUM(lp.cantidad*lp.precioVenta) FROM empleados e JOIN pedidos p ON p.CodRepresentante=e.codEmpleado JOIN lineaspedido lp USING(codPedido) WHERE e.oficina=o.codOficina);

SELECT e.oficina,SUM(lp.cantidad*lp.precioVenta),o.objetivo
FROM oficinas o JOIN empleados e ON e.oficina=o.codOficina JOIN pedidos p ON e.codEmpleado=p.codRepresentante JOIN lineaspedido lp USING(codPedido)
GROUP BY e.oficina
HAVING SUM(lp.cantidad*lp.precioVenta)>o.objetivo;

#Ejercicio 12

SELECT  e.oficina,SUM(lp.cantidad*lp.precioVenta)
FROM empleados e JOIN pedidos p ON e.codEmpleado=p.codRepresentante JOIN lineaspedido lp USING(codPedido)
GROUP BY e.oficina
HAVING SUM(lp.cantidad*lp.precioVenta)>(SELECT objetivo FROM oficinas WHERE codOficina=e.oficina)/2;

#Ejercicio13

SELECT p.codPedido PEDIDO,SUM(cantidad*precioVenta) TOTAL
FROM pedidos p JOIN lineaspedido USING(CodPedido)
WHERE codPedido<>21
GROUP BY p.codPedido
HAVING SUM(cantidad*precioVenta)>30000;

#Ejercicio14

SELECT o.codOficina
FROM oficinas o
WHERE NOT EXISTS (SELECT * FROM directores WHERE codOficina=o.codOficina);

SELECT o.codOficina,d.idDirector
FROM oficinas o LEFT JOIN directores d USING(codOficina)
WHERE idDirector IS NULL;

#Ejercicio 15

SELECT c.codCliente,c.nombre
FROM clientes c
WHERE NOT EXISTS (SELECT * FROM pedidos WHERE codCliente=c.codCliente);

SELECT c.codCliente,c.nombre,p.codPedido
FROM pedidos p RIGHT JOIN clientes c USING(codCliente)
WHERE p.codPedido IS NULL;

#Ejercicio16

SELECT p.idProducto,p.descripcion,p.existencias
FROM productos p
WHERE (SELECT COUNT(*) FROM lineaspedido WHERE Producto=p.idProducto)=0;

SELECT p.idProducto,p.descripcion
FROM productos p LEFT JOIN lineaspedido lp ON p.idProducto=lp.producto
WHERE lp.codPedido IS NULL;

#Ejercicio 17

SELECT origen.codigo,origen.nombre
FROM (SELECT e.codEmpleado AS codigo,e.nombre AS nombre,p.codPedido AS pedido
FROM empleados e LEFT JOIN pedidos p ON p.codRepresentante=e.codEmpleado) AS origen
WHERE origen.pedido IS NULL;

SELECT * FROM (SELECT DISTINCT e.codEmpleado,e.nombre
FROM empleados e LEFT JOIN pedidos p ON e.codEmpleado=p.codRepresentante
WHERE p.codPedido IS NOT NULL) A ;



