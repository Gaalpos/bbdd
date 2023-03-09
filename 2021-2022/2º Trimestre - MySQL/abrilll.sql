use bdempresasabc;

insert into clientes (codCliente,nombre,codRepresentante,limiteCredito) values
(9898,"Maria Perez",106,5000);


delimiter $
drop procedure prInsertarClientes$
create procedure prInsertarClientes (cod char(5),nb varchar(50),rep char(5),li double)
begin
	insert into Clientes (codCliente,nombre,codRepresentante,limiteCredito)values
	(cod,nb,rep,li);
	select * from Clientes;
end $
delimiter ;

call prInsertarClientes 
    
delimiter $
drop procedure prInsertarClientes01$
create procedure prInsertarClientes01 (cod char(5),nb varchar(50),rep char(5),li double out Estado char(20))
declare continue handler for 1062 set estado = "Clave duplicada"
insert into Clientes (codCliente,nombre,codRepresentante,limiteCredito)values
(cod,nb,rep,li);
select * from Clientes
