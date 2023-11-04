CREATE DEFINER=`root`@`localhost` FUNCTION `Pedidos_Cliente`(Codigo_Cliente varchar(5)) RETURNS int(11)
BEGIN
	declare total integer;
    select count(OrderID) into total
    from orders
    where CustomerID = Codigo_Cliente;
RETURN total;
END