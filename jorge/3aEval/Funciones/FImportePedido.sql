CREATE DEFINER=`root`@`localhost` FUNCTION `FImportePedido`(codCliente varchar(5)) RETURNS double
BEGIN
	declare total double;
	select sum(od.quantity * od.unitprice) into total
    from orders o join orderdetails od using(orderID)
    where o.customerid = codCliente;
RETURN total;
END