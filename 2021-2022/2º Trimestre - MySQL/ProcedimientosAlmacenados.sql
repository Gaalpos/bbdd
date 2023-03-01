use aaProcedimientos;

/* 1º Crear un procedimiento que muestre en mayúsculas las tres primeras letras de una
 cadena pasada como parámetro. */

delimiter $

create procedure tresMayus( in palabra varchar(50), out resultado char(3))
begin
set resultado = upper(left(palabra, 3));
select resultado;
end $

delimiter ;

call tresMayus('mvp jefe', @valor);
select @valor;

/* 2º Crear una función que devuelva el valor de la hipotenusa de un triángulo a partir de los
valores de sus lados. */

delimiter $
create function fuHipotenusa(num1 float, num2 float) returns float
deterministic
begin
declare hipo float;
set hipo = sqrt((num1*num1)+(num2*num2));
return hipo;
end $
delimiter ;

select fuHipotenusa(3,4);

/* 3º Crear una función que calcule el total de puntos en un partido tomando como entrada el
resultado en formato ‘xxx-xxx’. */

drop function if exists fuSumResultado;

delimiter $
create function fuSumResultado(resultado char(10)) returns int
deterministic
begin
declare res1, res2, suma int;
set res1 = substring_index(resultado,'-',1);
set res2 = substring_index(resultado,'-',-1);
set suma = res1 + res2;
return suma;
end $
delimiter ;

select fuSumResultado('68-56');

/* 4º Usar las estructuras condicionales para mostrar el día de la semana según un valor
numérico, 1 para domingo, 2 lunes, etc. */

delimiter $
create procedure prDiasSemana(in dia int, out result char(15))
begin
if dia = 1 then 
set result = 'Domingo';
elseif dia = 2 then
set result = 'Lunes';
elseif dia = 3 then
set result = 'Martes';
elseif dia = 4 then
set result = 'Miércoles';
elseif dia = 5 then
set result = 'Jueves';
elseif dia = 6 then
set result = 'Viernes';
elseif dia = 7 then
set result = 'Sábado';
else
set result = 'Valor incorrecto';
end if;
end $
delimiter ;

call prDiasSemana(3,@result);
select @result

delimiter $
create function prCaseSemana( dia int) returns char(15)
deterministic
begin
declare result char(15);
case dia
when 1 then set result = 'Domingo';
when 2 then set result = 'Lunes';
when 3 then set result = 'Martes';
when 4 then set result = 'Miércoles';
when 5 then set result = 'Jueves';
when 6 then set result = 'Viernes';
when 7 then set result = 'Sabado';
end case;
return result;
end $
delimiter ;

select prCaseSemana(2);


/* 5º Crear una función que devuelva el mayor de 3 números pasados como parámetros. */

delimiter $
create function fuMayor(num1 int, num2 int, num3 int) returns int
deterministic
begin
declare mayor int;
set mayor = num1;
if num2 > num1 then 
	if num3 > num2 then 
    set mayor = num3;
    else set mayor = num2;
    end if;
end if;
return mayor;
end $
delimiter ;

select fuMayor(3,5,8);

/* 6º Crear un procedimiento que nos diga si una palabra pasada como parámetro es
palíndroma. */

delimiter $
create procedure prPalindroma(in palabra Varchar(50), out result boolean)
begin
end $
delimiter ;

/* 7º Crear un procedimiento que muestre la suma de los n números enteros, siendo n un
parámetro de entrada. */

delimiter $
create procedure prSuma(in n int)
begin
declare sum int default 1;
declare contador int default 1;
while contador <= n do
set sum = sum + contador;
set contador = contador + 1;

