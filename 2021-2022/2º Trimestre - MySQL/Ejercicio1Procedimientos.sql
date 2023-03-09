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
call prEmpleadoAnho(1980);



/*
14 Crear un procedimiento pr ClientesMasPedidos que muestre el cliente
que más pedidos ha hecho en un mes que se introduce como parametro
*/
select nombre, count(codPedido)
from Clientes join pedidos using(codCliente)
group by nombre;

select nombre, count(codPedido)
from Clientes join pedidos using(codCliente)
where month(fechaPedido) =3
group by nombre
order by count(codPedido) desc
limit 1;

delimiter $
drop procedure if exists PrClientesMasPedidos$
create procedure PrClientesMasPedidos (in mes int)
begin
	select nombre, count(codPedido)
	from Clientes join pedidos using(codCliente)
	where month(fechaPedido) =mes
	group by nombre
	order by count(codPedido) desc
	limit 1;
end $
delimiter ;

call PrClientesMasPedidos(1);

/*
15- Por la crisis económica se tiene que proceder a bajar el sueldo a todos los empleados en
un 5%. Implementar un procedimiento, PrBajarSueldo01, que simule como se haría esa
disminución del sueldo.
*/
update empleados set sueldo = sueldo - sueldo*5/100;

delimiter $
drop procedure if exists PrBajarSueldos;
create procedure PrBajarSueldos (in porcentaje int)
begin
	declare contador int default 1;
    while contador < 3 do
	update empleados set sueldo = sueldo - sueldo*porcentajes/100;
	select * from empleados;
    set contador = contador +1;
    end while;
end $
delimiter ;

call PrBajarSueldos(2);

/*
16 Crear un procedimiento, prBajarSueldoEscala01, que a cada empleado le baje el sueldo
según el grupo al que pertenezca. Gerente: 8%, Representante: 5%, Administrativo: 3% y
al resto el 10%. (Se utilizarán cursores)
*/
update empleados set sueldo = sueldo -sueldo*8/100 where categoria = "gerente";

delimiter $
drop procedure prBajarSueldoEscala01 $
create procedure prBajarSueldoEscala01(porG int, porR int, porA int,porC int)
begin
	update empleados set sueldo = sueldo -sueldo*porG/100 where categoria = "gerente";
    update empleados set sueldo = sueldo -sueldo*porR/100 where categoria = "Representante";
    update empleados set sueldo = sueldo -sueldo*porA/100 where categoria = "Administrativo";
    update empleados set sueldo = sueldo -sueldo*porC/100 where categoria not in ("Gerente","Representante", "Administrativo");
end $
delimiter $
	