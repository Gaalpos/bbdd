CREATE DEFINER=`root`@`localhost` PROCEDURE `Examen02`(id varchar(5))
BEGIN
	select Contactname from customers where CustomerID = id;
END