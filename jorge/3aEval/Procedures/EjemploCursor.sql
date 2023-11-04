CREATE DEFINER=`root`@`localhost` PROCEDURE `EjemploCursor`()
BEGIN
	declare PCodCliente char(5);
    declare PNombre varchar(30);
	declare PTotalImporte double default 0;
    declare PContador INT DEFAULT 0;
	declare UltimaFila BOOL DEFAULT 0;
	declare CuClientes cursor for select CustomerId, CompanyName from customers;
    declare continue handler for not found set UltimaFila = 1;
    
    drop table if exists pedidosclientes;
	create table pedidosclientes(
	Id int primary key auto_increment,
	CodCliente char(5),
	Nombre varchar(50),
	NumeroPedidos int,
	TotalImporte double);
    
    open CuClientes;
    
    while (UltimaFila = 0) do
		if (UltimaFila = 0) then
			fetch CuClientes into PCodCliente, PNombre;
            select count(distinct orders.orderID), sum(quantity * unitPrice) into PContador, PTotalImporte
				from orders join orderdetails using (orderId) where customerID = PCodCliente; 
			insert into PedidosClientes (CodCliente, Nombre, NumeroPedidos, TotalImporte)
				values (PCodCliente, PNombre, PContador, PTotalImporte);
		end if;
	end while;
    
    close CuClientes;
END