## 5 Crear una función que devuelva el mayor de 3 números pasados como parámetros.

drop function if exists fuTresNumeros;
delimiter $
create function fuTresNumeros (n1 int, n2 int, n3 int) returns int
deterministic
begin
declare mayor int default 0;
	if n1 > n2 and n1 > n3 then
		set mayor =n1;
	elseif n2 > n3 then
		set mayor = n2;
	else 
		set mayor = n3;
	end if;
    return mayor;
    end $
    
    select fuTresNumeros (15, 6 ,9), fuTresNumeros(33,92,21);


## 6 Crear un procedimiento que nos diga si una palabra pasada como parámetro es
## palíndroma.
select "dabale arroz a la zorra el abad", reverse ("dabale arroz a la zorra el abad");
delimiter $
drop procedure if exists PRPalindroma$
create procedure PRPalindroma(in frase varchar(59), out result varchar(59))
begin
	if frase = reverse (frase) then
		set result = concat(frase, "Es palindroma");
	else
		set result = concat(frase, "no es palindroma");
	end if;
    end $
    delimiter ;
    
call prPalindroma ("dabale arroz a la zorra el abad", @resultado);
select @resultado;

## 7 Crear un procedimiento que muestre la suma de los n números enteros, siendo n un
## parámetro de entrada.

delimiter $
drop procedure if exists prSumaNumeros$
create procedure prSumaNumeros (in num int, out suma int)
begin
	declare contador int default 1;
    set suma =0;
    while contador <=num do
		set suma = suma+contador;
        set contador = contador +1;
	end while;
    select contador,suma;
end $
delimiter ;

call prSumaNumeros (5,@suma);

## 8 Crear una función FuSuma que calcule la suma de los primeros n números enteros, siendo
## n un parámetro de entrada.

delimiter $
drop function if exists fuSumaNumeros $
create function fuSumaNumeros(num int) returns int
deterministic
begin
	declare contador int ;
	declare suma int default 0;
    set contador = 1;
	while contador <= num do
		set suma = suma + contador;
        set contador = contador + 1;
	end while ;
    return suma;
end $
delimiter ;
select fuSumaNumeros (9);

##9 Crear una función FuPrimos que nos diga si un número es primo o no devolviendo 1 ó 0.
delimiter $
drop function if exists fuPrimos$
create function fuPrimos(numero int) returns char
deterministic
begin
	declare SW bool default "s";
    declare divisor int default 2;
    
    while divisor < numero and SW = "S" do
		if numero % divisor = 0 then 
        set SW = "N";
	end if;
    set divisor = divisor + 1;
    end while;
    return SW;
end $
delimiter ;

select fuPrimos(5),fuPrimos(2);

## 10o Usar la función FuSumaPrimos anterior para crear otra que calcule la suma de los
## primeros m números primos empezando en el 1.
## s --> es primo

delimiter $
drop function if exists fuSumaPrimos$
create function fuSumaPrimos(numero int) returns int
deterministic
begin
	declare suma int default 0;
    declare contador int default 2;
    while contador <= numero do
		if fuPrimos(contaodr) = "S" then
			set suma = suma + contador;
		end if;
        set contador = contador +1;
	end while ;
    return suma;
    end $
    delimiter ;
    
    select fuSumaPrimos(6);
    
    
## En la base de datos EmpresasABC codificar los siguientes procedimientos
## 13 Crear un procedimiento que nos diga los empleados contratados en un determinado año.
delimiter $
select * from Empleados where year(fecContrato) = 1980;
drop procedure if exists prEmpleadoAnho$
create procedure prEmpleadoAnho(in anho int)
begin 
	select * from Empleados where year(fecContrato) = anho;
end $
delimiter ;

call prEmpleadoAnho(1990);