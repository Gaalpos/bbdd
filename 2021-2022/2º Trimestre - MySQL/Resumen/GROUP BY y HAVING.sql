## GROUP BY
	SELECT categoria, sum(sueldo), max(sueldo), min(sueldo), avg(sueldo)
	FROM empleados
	GROUP BY categoria;
    
## HAVING
	## Indicar cuantos empleados trabajan en cada oficina, que tienen mas de cuatro empleados
	SELECT Oficina, ciudad, count(codEmpleado), count(*)
	FROM empleados JOIN oficinas ON codOficina = oficina
	GROUP BY Oficina
	HAVING COUNT(codEmpleado) > 4
	ORDER BY ciudad;