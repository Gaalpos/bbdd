/*
1o) Crear un procedimiento que busque la categoría de un empleado y después liste
todos los empleados de esa categoría.*/
delimiter $
 drop procedure if exists prCategoria01$
 create procedure prCategoria01(in cod char(5))
 begin
	declare cat varchar(40);
    select categoria into cat from empleados where codEmpleado= cod;
	select cat;
    select * from empleados where categoria = cat;
end $
delimiter ;

call prCategoria01(101);
call prCategoria01(106);

/*
2o) Crear una tabla EmpleadosCategoria con las siguientes columnas: nombre,
categoria, ventas.
Nombre es el nombre del empleado
Categoria la categoría del empleado
Ventas es el importe total vendido por el empleado
Crear un procedimiento al que le enviamos como parámetro la categoría de un
empleado. Utilizando cursores se deberá insertar en la tabla EmpleadosCategoria
todos los empleados de dicha categoría con sus ventas.*/

create table if not exists EmpleadosCategoria(
nombre varchar (30),
categoria varchar (40),
ventas double,
mes int);

select nombre, categoria, sum(cantidad*precioventa),month(fechaPedido)
from empleados join pedidos on codRepresentante = codEMpleado
join lineaspedido on pedidos.codPedido = lineaspedido.codPedido
group by nombre, month(fechaPedido);

delimiter $
drop procedure if exists prInsertarVentas$
create procedure prInsertarVentas(cat varchar(40),mes int)
begin
	declare nb varchar(30);
	declare suma double;
	declare cate varchar(40);    
    declare me int;
    declare ultimaFila bool default 1;
    declare cursor01 cursor for select nombre, categoria,sum(cantidad*precioVenta),month(fechaPedido)
		from empleados join pedidos on codRepresentante = codEmpleado
        join lineaspedido on pedidos.codPedido = lienaspedido.codPedido
        group by nombre, month(fechaPedido);
    declare continue handler for not found set ultimafila=0;
    
	open cursor01;
    fetch cursor01 into nb, cate, suma,me;
    while ultimafila=1 do
		if cate = cat and mes = me then
			insert into empleadoscategoria values (nb,cate,suma,me);
		end if;
        fetch cursor01 into nb,cate,suma,me;
	end while;
    close cursor01;
end$
delimiter ;

call prInsertarVentas("Representante",2);
select * from empleadoscategoria;


delimiter $
drop procedure if exists prInsertarVentas01$
create procedure prInsertarVentas01(cat varchar(40),mes int)
begin
	declare nb varchar(30);
	declare suma double;
	declare cate varchar(40);    
    declare me int;
    declare ultimaFila bool default 1;
    declare cursor01 cursor for select nombre, categoria,sum(cantidad*precioVenta),month(fechaPedido)
		from empleados join pedidos on codRepresentante = codEmpleado
        join lineaspedido on pedidos.codPedido = lienaspedido.codPedido
        group by nombre, month(fechaPedido);
    declare continue handler for not found set ultimafila=0;
    
	open cursor01;
    fetch cursor01 into nb, cate, suma,me;
    while ultimafila=1 do
		if cate = cat and mes = me then
			insert into empleadoscategoria values (nb,cate,suma,me);
		end if;
        
	end while;
    close cursor01;
end$
delimiter ;

/*
16o Crear un procedimiento, prBajarSueldoEscala01, que a cada empleado le baje el sueldo
según el grupo al que pertenezca. Gerente: 8%, Representante: 5%, Administrativo: 3% y
al resto el 10%. sin usar cursores
*/
delimiter $
drop procedure prBajarSueldoEscala02$
create procedure prBajarSueldoEscala01()
begin
	declare categ varchar(40);
    declare cod char(5);
    declare ultimaFila 
    
    
    
end $