create database aaProcedimientos;
use aaProcedimientos;

delimiter $
create function suma(num1 int, num2 int) returns int
deterministic 
begin
declare resultado int;
set resultado = num1 +num2;
return num1+num2;
end $
delimiter ;

select now(),suma(89,25);

delimiter $
create procedure prPrimero()
begin
	select "Estamos en clase de BBDD";
end $
delimiter ;

## ejecutar procedimiento
call prPrimero();
select suma(78,90);

delimiter $
create procedure prNombre(in nb varchar(29))
begin
select concat("Buenos dias",nb);
end $
delimiter ;

## procedimiento parametros de salida
delimiter $
create procedure prSuma(in num1 int, num2 int, out resultado int)
begin
set resultado = num1+num2;
end $
delimiter ;

call prSuma(152,227, @resul);
select @resul;

## Procedimiento parametros de entrada salida
## intercambio de los valores de los parametros
delimiter $
create procedure prIntercambio(inout num1 int, inout num2 int)
begin
declare aux int;
select concat("Antes del camnio", num1," ", num2);
set aux = num1;
set num1=num2;
set num2=aux;
select concat("Despues del cambio", num1," ", num2);
end $
delimiter ;

set @var1 = 78;
set @var2=122;

select @var1, @var2;

call prIntercambio (@var1, @var2);
