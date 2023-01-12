SELECT o.ciudad, COUNT(e.codEmpleado) AS "Num empleados"
FROM empleados e RIGHT JOIN oficina o ON e.oficina=o.codOficina
WHERE o.region='Galicia'
GROUP BY o.codOficina