## Vistas
	CREATE VIEW viEmpleados01
	AS SELECT nombre, sueldo
	FROM Empleados;

	SELECT * FROM viEmpleados01;

	CREATE VIEW viEmpleadosOficinas (codOficina, ciudad, codEmpleado, nombre, fecContrato, sueldo, comision, retencionesIRPF,
	retencionesSS)
	AS SELECT codOficina, ciudad, codEmpleado, nombre, fecContrato, sueldo, comision, retencionesIRPF, retencionesSS
	FROM Oficinas JOIN Empleados ON codOficina = oficina;

	SELECT *
	FROM viEmpleadosOficinas;
    