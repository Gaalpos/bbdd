## Procedimientos -> No tienen valor de retorno
## Funciones -> Tienen valor de retorno

CREATE DATABASE procedimientos;
USE procedimientos;

delimiter $
DROP FUNCTION suma;
CREATE FUNCTION suma(num1 INT, num2 INT) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE resultado INT;
	SET resultado = num1 + num2;
	RETURN resultado;
END $
delimiter ;

SELECT NOW(), suma(89,25);

## Procedimiento sin parametros
delimiter $
CREATE PROCEDURE prPrimero()
BEGIN
	SELECT "Estamos en clase de BBDD";
END $
delimiter ;

## Ejecutar procedimiento
CALL prPrimero();

SELECT suma(78, 52);

delimiter $
CREATE PROCEDURE prNombre(IN nb VARCHAR(20))
BEGIN
	SELECT CONCAT('Buenos dias', nb);
END $
delimiter ;

CALL prNombre('Adrian');

##Procedimiento parametros de salida
delimiter $
CREATE PROCEDURE prSuma(IN num1 INT, num2 INT, OUT resultado INT)
BEGIN
	SET resultado= num1 +num2;
END $
delimiter ;

CALL prSuma(145, 256, @resul);
SELECT @resul;

## Procedimiento parametros de entrada salida
## Intercambio de los valores de los parametros
delimiter $
CREATE PROCEDURE prIntercambio(INOUT num1 INT, INOUT num2 INT)
BEGIN
	DECLARE aux INT;
    SELECT CONCAT("Antes del cambio: ", num1, ' ', num2);
    SET aux = num1;
	SET num1 = num2;
    SET num2 = aux;
    SELECT CONCAT("Despues del cambio: ", num1, ' ', num2);
END $
delimiter ;

SET @var1 = 78;
SET @var2 = 132;

SELECT @var1, @var2;

SELECT * FROM Empleados WHERE categoria = 'Representante';

delimiter $
CREATE PROCEDURE prCategoria (IN categ VARCHAR(40))
BEGIN
	SELECT * FROM Empleados WHERE categoria = categ;
END $
delimiter ;

CALL prCategoria('Administrativo');
CALL prCategoria('Representante');