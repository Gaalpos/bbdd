# ejemplo de cursor con la tabla de oficinas
# utilizando cursores vamos a insertar las oficinas de Galicia y Asturias en la tabla Oficinas01
# y el resto en la tabla Oficinas02

# 1. crear las tablas
create table if not exists Oficinas01(
codOf CHAR(3),
ciu varchar(30),
ventas double);

create table if not exists Oficinas02(
codOf CHAR(3),
ciu varchar(30),
ventas double);

select codoficina, ciudad, region, ventas from oficinas;

#2. crear procedimiento
# primero: declarar las varibles
# handler for para manejar errores
# while para recorrer el fetch hasta el final; sin el bucle, sólo hace 1
#este es con el error
delimiter $
drop procedure if exists prOficinas$
create procedure prOficinas01 ()
begin
declare cod CHAR(3);
declare ciu VARCHAR(30);
declare reg VARCHAR(30);
declare ven double;
declare ultimaFila int DEFAULT 0;
declare cuOficinas CURSOR FOR SELECT codoficina, ciudad, region, ventas from oficinas;
declare continue HANDLER FOR not FOUND set ultimaFila = 1;
open cuOficinas;
while ultimaFila=0 do
	fetch cuOficinas into cod, ciu, reg, ven;
	if reg = 'Galicia' or  reg= 'Asturias' then
		insert into Oficinas01 values (cod, ciu, ven);
	ELSE
		insert into Oficinas02 values (cod, ciu, ven);
	end if;
end WHILE;
close cuOficinas;
end $
delimiter ;

call prOficinas();

# ojo: el fetch se abre en el primero pero empieza a leer en el segundo
# el cursor se mueve cuando el fetch se mueve
# en la última pasada, el not found salta y el último registro se procesa dos veces (chequear siempre los códigos)

# 2 soluciones
# solución 1 -> prOficinas (con el if de ultimaFila) -> solución más fácil de entender
#solución 2 -> prOficinas01 (fetch despues del bucle)



#solución 1
delimiter $
drop procedure if exists prOficinas01$
create procedure prOficinas ()
begin
declare cod CHAR(3);
declare ciu VARCHAR(30);
declare reg VARCHAR(30);
declare ven double;
declare ultimaFila int DEFAULT 0;
declare cuOficinas CURSOR FOR SELECT codoficina, ciudad, region, ventas from oficinas;
declare continue HANDLER FOR not FOUND set ultimaFila = 1;
open cuOficinas;
while ultimaFila=0 do
	fetch cuOficinas into cod, ciu, reg, ven;
    if ultimaFila=0 then
		if reg = 'Galicia' or  reg= 'Asturias' then
			insert into Oficinas01 values (cod, ciu, ven);
		ELSE
			insert into Oficinas02 values (cod, ciu, ven);
		end if;
	end if;
end WHILE;
close cuOficinas;
end $
delimiter ;

call prOficina01();


delimiter $
drop procedure if exists prOficinas02$
create procedure prOficinas01 ()
begin
declare cod CHAR(3);
declare ciu VARCHAR(30);
declare reg VARCHAR(30);
declare ven double;
declare ultimaFila int DEFAULT 0;
declare cuOficinas CURSOR FOR SELECT codoficina, ciudad, region, ventas from oficinas;
declare continue HANDLER FOR not FOUND set ultimaFila = 1;
open cuOficinas;
while ultimaFila=0 do
	if reg = 'Galicia' or  reg= 'Asturias' then
		insert into Oficinas01 values (cod, ciu, ven);
	ELSE
		insert into Oficinas02 values (cod, ciu, ven);
	end if;
fetch cuOficinas into cod, ciu, reg, ven;
end WHILE;
close cuOficinas;
end $
delimiter ;

call prOficinas02;


/*
16o Crear un procedimiento, prBajarSueldoEscala01, que a cada empleado le baje el sueldo
según el grupo al que pertenezca. Gerente: 8%, Representante: 5%, Administrativo: 3% y
al resto el 10%. (Se utilizarán cursores)
*/
update empleados set sueldo = sueldo - sueldo*0.08 where categoria = 'Gerente';
#hacer update pero utilizando cursores

delimiter $
drop PROCEDURE if exists PrBajarSueldoEsc$
create PROCEDURE prBajarSueldoEsc()
begin
	declare cod CHAR(5);
	declare cat VARCHAR(40);
	declare ultimaFila BOOL DEFAULT 0; #el default es para inicializar
	
    declare cuBajarSueldo CURSOR FOR SELECT codEmpleado, categoria from Empleados;
    declare continue HANDLER FOR not FOUND set ultimaFila=1;
    open cuBajarSueldo;
    while ultimaFila=0 do
		fetch cuBajarSueldo INTO cod, cat;
        if ultimaFila =0 then
			if cat = 'Gerente' then
				update empleados set sueldo = sueldo - sueldo *0.08 where codEmpleado = cod;
			ELSEIF cat = 'Representante' then
				update empleados set sueldo = sueldo - sueldo *0.05 where codEmpleado = cod;
			ELSEIF cat = 'Administrativo' then
				update empleados set sueldo = sueldo - sueldo *0.03 where codEmpleado = cod;
			ELSE
				update empleados set sueldo = sueldo - sueldo *0.10 where codEmpleado = cod;
			END IF;
		end if;
	end while;
    SELECT 'Sueldos Actualizados';
    CLOSE cuBajarSueldo;
end $
delimiter ;
