## SELECT
	SELECT *
	FROM TablaA;
	SELECT columna1, columna2, columna3, columna4
	FROM TablaA;

## CAMPOS CALCULADOS Y ALIAS
	SELECT columna1, columna2 'Alias1', columna2 * columna3 AS 'Alias2'
	FROM TablaA;

## ORDER BY, ASC DESC
	SELECT *
	FROM TablaA
	ORDER BY columna1 DESC;

	## Ordenar por columna 4
		SELECT *
		FROM TablaA
		ORDER BY 4 ASC;

##LIMIT Listar desde el 4, dos filas
	SELECT *
	FROM TablaA
	LIMIT 4, 2;

## ALL, DISTINCT
	SELECT DISTINCT columna3
	FROM TablaA;

## WHERE
	SELECT *
	FROM TablaA
	WHERE columna1 = 'abc';

## BETWEEN, NOT BETWEEN
	SELECT *
	FROM TablaA
	WHERE columna4 BETWEEN 150 AND 300;

##Nombre cualificado en el SELECT
	SELECT TablaA.columna1, TablaA.columna2
	FROM TablaA;

## Alias para las tabalas en el FROM
	SELECT A.columna1, A.columna2
	FROM TablaA A;

## IN, NOT IN
	SELECT *
	FROM TablaA
	WHERE columna1 IN ('abc', 'efg');

## SELECT de otra base de datos
	SELECT *
	FROM bdempresasabc.empleados;

##IS NULL, IS NOT NULL
	SELECT *
	FROM TablaA
	WHERE columna1 IS NULL;

	## Operaciones con NULL
		SELECT 8+ NULL, 8+12;
		SELECT NULL = NULL, 45=45, 'hola' = 'hola', 45=87;
		SELECT NULL <=> NULL;

##LIKE, NOT LIKE y %
	SELECT *
	FROM TablaA
	WHERE columna2 LIKE "Fu%";

	SELECT *
	FROM TablaA
	WHERE columna2 NOT LIKE "Fu%";

##Listar Fulanito, Menganito y Menganita con % y _
	SELECT *
	FROM TablaA
	WHERE columna2 LIKE '%anit_';

## Expresiones regulares. Listar los empleados cuyo nombre completo comience por las letras entre la L y la P
	SELECT nombre, sueldo, oficina
	FROM empleados
	WHERE nombre REGEXP '^[L-P]';

	SELECT nombre, sueldo, oficina
	FROM empleados
	WHERE nombre RLIKE '^[L-P]';

	SELECT nombre, sueldo, oficina
	FROM empleados
	WHERE nombre NOT REGEXP '^[L-P]';

	SELECT nombre, sueldo, oficina
	FROM empleados
	WHERE nombre NOT RLIKE '^[L-P]';