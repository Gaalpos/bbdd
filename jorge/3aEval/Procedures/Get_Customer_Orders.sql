CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Customer_Orders`(in Codigo_Cliente char(5))
BEGIN
	select * from orders where customerId = Codigo_Cliente;
END