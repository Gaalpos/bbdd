## SQR()
## ABS()
## MOD()

## AVG() - La media de los valores
## COUNT() - El número de filas
## MAX() - El valor más grande
## MIN() - El valor más pequeño
## SUM() - La suma de los valores
## UCASE() - Convierte un campo a mayúsculas
## LCASE() - Convierte un campo a minúsculas

## CONCAT ( string_value1, string_value2)

 

## YEAR MONTH MONTHNAME DAY CURDATE
	SELECT YEAR(curdate()), MONTH(curdate()), MONTHNAME(curdate()), DAY(curdate());

## HOUR MINUTE SECOND NOW
	SELECT HOUR(now()), MINUTE(now()), SECOND(now());

##LEFT y RIGHT
	SELECT LEFT("FULANITO", 2);
	SELECT RIGHT("FULANITO", 3);
    
	SELECT nombre, LEFT(nombre, LOCATE(' ', nombre)) FROM Clientes;
	SELECT nombre, RIGHT(nombre, LOCATE(' ', nombre)) FROM Clientes;
    
## UPPER LOWER Convertir a mayusculas y minusculas
	SELECT nombre, UPPER(nombre), LOWER(nombre) FROM Clientes;   

##IF NULL
	select codEmpleado, nombre, sueldo, ifnull(comision, 0), comision, sueldo + ifnull(comision, 0),
	(sueldo + ifnull(comision, 0)) * retencionesIRPF as IRPF
	from Empleados;

## FORMAT Formato a numeros
	SELECT sqrt(85), FORMAT(sqrt(85), 2), FORMAT(sqrt(85), 0);

## Obtener total sueldos de la empresa
	select sum(sueldo), max(sueldo), min(sueldo), avg(sueldo)
	from empleados;
    
	## Obtener total de sueldos por categoria		
	select categoria, sum(sueldo), max(sueldo), min(sueldo), avg(sueldo)
	from empleados
	group by categoria;

## Mostrar el número de empleados de la empresa
	select count(*), count(codEmpleado), count(comision)
	from empleados;

	## Mostrar numero por categoria
	select categoria, count(*), count(codEmpleado), count(comision)
	from empleados
	group by categoria;

##Funcion adddate()
	SELECT adddate(curdate(), INTERVAL 3 YEAR), adddate(curdate(), INTERVAL 3 MONTH),
	adddate(curdate(),INTERVAL 3 DAY),
	adddate(now(), INTERVAL 3 HOUR);
    
    SELECT length(nombre) FROM Clientes;

## CONCAT
	SELECT CONCAT(nombre, ' ', codCliente, ' ', limiteCredito) FROM Clientes;

## LOCATE Devuelve la posicion del string buscado
	SELECT nombre, LOCATE(' ', nombre) FROM Clientes;

## SUBSTRING
	SELECT nombre, SUBSTRING(nombre, LOCATE(' ', nombre), LENGTH(nombre)) FROM Clientes;

## SUBSTRING_INDEX
	SELECT nombre, SUBSTRING_INDEX(nombre, ' ', 1),
	SUBSTRING_INDEX(nombre, ' ', 2),
	SUBSTRING_INDEX(nombre, ' ', -1),
	SUBSTRING_INDEX(nombre, ' ', -2)
	FROM Clientes;
