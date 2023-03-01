use bdempresasabc;

delimiter $
create procedure prCategoria (in categ varchar(49))
begin
select * from Empleados where categoria =categ;
end $
delimiter ;

call prCategoria("Representante")
