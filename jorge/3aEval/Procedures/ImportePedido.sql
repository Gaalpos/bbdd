CREATE DEFINER=`root`@`localhost` PROCEDURE `ImportePedido`(codCliente varchar(5), out totalPedido double)
BEGIN
	select sum(od.quantity * od.unitprice) into totalPedido
    from orders o join orderdetails od using(orderID)
    where o.customerid = codCliente;
END