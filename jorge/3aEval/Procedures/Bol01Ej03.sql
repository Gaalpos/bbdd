CREATE DEFINER=`root`@`localhost` PROCEDURE `Bol01Ej03`(id int(5))
BEGIN
	select count(productId) from orderdetails where orderID = id;
END