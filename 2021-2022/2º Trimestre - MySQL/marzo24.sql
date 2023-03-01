use aprocedimientos;

create table numeros(
numero int);

delimiter $
drop procedure if exists prInsertarNumeros;
create procedure prInsertarNumeros (in limite int)
begin
	declare contador int default 1;
    delete from numeros;
    repeat
		insert into numeros values (contador);
		set contador = contador + 1;
		until contador > limite
    end repeat;
    select*from numeros;
    end $
    delimiter $;
    
    call prInsertarNumeros(-5);
    

select * from aaprocedimientos.numeros;

drop function if exists fuFactorial;

delimiter $
create function fuFactorial (numero int) returns int
begin
	declare contador int default 1;
    declare factorial int default 1;
    repeat
		set factorial = factorial * contador;
		set contador = contador+1;
    until contador > numero end repeat;
    return factorial;
    end $;
    delimiter ;
     
select fuFactorial(5);
    