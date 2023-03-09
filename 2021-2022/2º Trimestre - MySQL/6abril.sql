## si el limite de credito es menor o igual


delimiter $
drop procedure prCursor01 $
create procedure prCursor01()
begin
 declare nb varchar(50);
  declare lc double;
 declare lc double;
declare CuClientes cursor for select nombre, limiteCredito from clientes;
 open CuClientes;
 fetch CuClientes into nb, lc;
 fetch CuClientes into nb, lc;
 close CuClientes;
end$
delimiter ;

## si el limite de credito es menor o igual que 5000 qie se inserte en cli0 y es caso contrario en cli02
drop procedure prCursos01;
delimiter $
create procedure prCursos01()
begin
	declare nb varchar(50);
    declare lc double;
    declare UltimaFila bool default 0;
    declare CuClientes cursor for select nombre,limiteCredito from Clientes;
    declare continue handler for not found set UltimaFila=1;
    open CuClientes;
		while UltimaFila = 0 do
			fetch cuClientes into nb,lc;
			select nb,lc;
		end while;
	close CuClientes;
end$
delimiter ;



drop procedure prCursos02;
delimiter $
create procedure prCursos02()
begin
	declare nb varchar(50);
    declare lc double;
    declare UltimaFila bool default 0;
    declare CuClientes cursor for select nombre,limiteCredito from Clientes;
    declare continue handler for not found set UltimaFila=1;
    
    open CuClientes;
		while UltimaFila = 0 do
			fetch cuClientes into nb,lc;
            if UltimaFila = 0 then
				select nb,lc;
            end if;
		end while;
	close CuClientes;
end$
delimiter ;

drop procedure prCursos03;
delimiter $
create procedure prCursos03()
begin
	declare nb varchar(50);
    declare lc double;
    declare UltimaFila bool default 0;
    declare CuClientes cursor for select nombre,limiteCredito from Clientes;
    declare continue handler for not found set UltimaFila=1;
    
    open CuClientes;
    fetch cuClientes into nb,lc;
		while UltimaFila = 0 do
			if lc <= 500 then
					insert into clie01(nombre,limite) values(lb,lc);
                else
					insert into cli02(nombre,limite) values (nb,lc);
				end if;
		fetch cuClientes into nb, lc;
		end while;
	close CuClientes;
end $
delimiter ;


create table cli01(
nombre varchar(50),
limite double);

create table cli02(
nombre varchar(50),
limite double);


call prCursos01();
    