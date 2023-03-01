3.
SELECT * FROM empleados WHERE oficina IN (SELECT codOficina FROM directores WHER
E codDirector&lt;&gt;108);
4.
SOLUCIÓN TENIENDO EN CUENTA EL TOTAL DE TODOS LOS PEDIDOS DEL MISMO
PROCUTO
SELECT idProducto,idFabricante,descripcion FROM productos WHERE idProd
ucto IN (SELECT Producto FROM lineaspedido GROUP BY producto HAVING SU
M(cantidad * precioVenta)&lt;500);
SOLUCIÓN TENIENDO EN CUENTA QUE EL PRODUCTO NO APAREZCA EN NINGUNA
LÍNEA DE MÁS DE 500 EUROS
SELECT idFabricante,idProducto,descripcion FROM productos WHERE idProd
ucto NOT IN (SELECT DISTINCT producto FROM lineaspedido WHERE (cantida
d*PrecioVenta) &gt;500);

5. SELECT codCliente,nombre
FROM clientes
WHERE codRepresentante=(SELECT codEmpleado
FROM empleados
WHERE nombre=&quot;García Gómez, Luis Antonio&quot;) AND codCliente IN (SELECT
DISTINCT p.codCliente FROM pedidos p JOIN lineaspedido lp ON
p.codPedido=lp.codPedido GROUP BY p.codCliente,p.codPedido HAVING
SUM(cantidad*precioVenta)&gt;5000);

6. EL PROFESOR HA DECIDIDO HACERLO SIN SUBCONSULTAS
SELECT e.codEmpleado,SUM(lp.cantidad*lp.precioVenta) AS &quot;Total
vendedor&quot;,ROUND((o.objetivo*0.55),2) AS 55OBJETIVO FROM empleados e JO
IN pedidos p ON e.codEmpleado=p.codRepresentante JOIN lineaspedido lp 
USING(codPedido) JOIN oficinas o ON e.oficina=o.codOficina GROUP BY e.
codEmpleado HAVING SUM(lp.cantidad*lp.precioVenta)&gt;55OBJETIVO;

7.LISTAR LOS EMPLEADOS QUE TIENEN UN SUELDO MAYOR QUE EL 50% DEL
OBJETIVO DE LA OFICINA EN LA QUE TRABAJAN

SOLUCIÓN SIN SUBCONSULTAS
SELECT e.codEmpleado,e.sueldo,(o.objetivo*0.5) AS mitad_objetivo FROM 
empleados e JOIN oficinas o ON e.oficina=o.codOficina WHERE o.objetivo
 IS NOT NULL AND e.sueldo&gt;(o.objetivo*0.5);

SELECT tablaObjetivos.empleado,tablaObjetivos.salario,tablaObjetivos.m
itad_objetivo FROM (SELECT e.codEmpleado AS empleado,e.sueldo AS salar
io,(o.objetivo*0.5) AS mitad_objetivo FROM empleados e JOIN oficinas o

 ON e.oficina=o.codOficina WHERE o.objetivo IS NOT NULL) tablaObjetivo
s WHERE tablaObjetivos.salario&gt;tablaObjetivos.mitad_objetivo;
7. (EL DE VERDAD)
SELECT CodOficina,ciudad FROM oficinas WHERE (objetivo*0.5) &lt; (SELECT 
MIN(sueldo) FROM empleados WHERE empleados.oficina = oficinas.CodOfici
na);