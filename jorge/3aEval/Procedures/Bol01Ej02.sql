CREATE DEFINER=`root`@`localhost` PROCEDURE `Bol01Ej02`()
BEGIN
	select * from customers where city = 'london';
END