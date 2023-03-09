use bdempresasabc;

delimiter $
drop function fullnumeros $
create function fullnumeros(num int) returns varchar(50)
begin
	declare texto varchar(50);
    if mod (num,2) =0 then
		set texto = "El numero es par";
	else
		set texto "El numero es impar";
        end if;
delimiter ;

select fullnumeros(26), fullnumeros(37);


## crear procedimientos que actualice datosd de los sueldos de los empleado
## segun su categoria
## represejtantes 500
## administrativs 800
## resto 1000

drop procedure prActualizarSueldos;
delimiter $
create procedure prActualizarSueldos(cat varchar(40))
begin
if categoria ="Representante" then
	update Empleados set sueldo = sueldo+ 500 where categoria = cat;
elseif Categoria = "Administrativo"
	then update Empleados set sueldo = sueldo+800 where Categoria = cat;
else
	update empleados set sueldo = sueldo +1000
    where Categoria not in ("Representante", "Administrativo");
    end if ;
    end $
    delimiter ;
    
call prActualizarSueldos("Representante");

drop function prNotas
delimiter $
create function prNotas(nota int) returns varchar(20)
begin
declare calificacion varchar(20);
if nota <3 then
	set calificacion = "MD";
    elseif nota <5 then
		set calificacion "IN";
	elseif nota <7 then
		set calificacion "suf";
	elseif nota <9 then
		set calificacion "npt";
	else 
		set calificacion = "sob";
        end if ;
     
        delimiter 
	
    select funotas(1),prNotas(8), prNotas(5);
    
    drop procedure prAumentarPrecios
    selimiter $
    begin
    case opcion
		when 1 then update Productos set precio =precio*1.02;
		when 2 then update Productos set precio =precio*1.05;
		when 3 then update Productos set precio =precio*1.07;
        else update Productos set PrecioCompra = precioCompra*1.1;
	end case;
    end $
    delimiter;
    
    call prAumentarPrecios

    
	