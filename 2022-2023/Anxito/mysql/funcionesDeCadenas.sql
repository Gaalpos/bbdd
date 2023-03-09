	SELECT CONCAT(' @ ',nombre," es un ",categoria," aunque es un pringado" ) Empleado
    FROM empleados;
    
    SELECT LENGTH(nombre) AS "Longitud nombre"
    FROM Empleados;
    
    SELECT  LOWER(LOCATE(nombre," ",categoria))
    FROM empleados;
    
    SELECT  LOWER(LOCATE(LEFT(nombre,5)," ",RIGHT(categoria)))
    FROM empleados;
    
    SELECT nombre,LENGTH(nombre) AS longitud
    FROM empleados
    WHERE LENGTH(nombre)<=22;
    
    SELECT CONCAT(LOWER(SUBSTRING(nombre,1,1)), UPPER(SUBSTRING(nombre,2,LENGTH(nombre)-1)))
    FROM empleados;
    
    SELECT nombre,sueldo,(sueldo*1.2),(((sueldo*1.2)/sueldo)*100)-100
    FROM epleados;
    
    SELECT MONTHNAME(NOW())
    FROM DUAL;
    
	SELECT WEEK('1998-02-20'), WEEK('1998-02-20',0), WEEK('1998-02-20',1), 
	WEEK('1998-12-31',1),YEAR('2000-01-01'), WEEK('2000-01-01',0);
    
    
    
    
    
    
    