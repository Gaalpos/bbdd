CREATE DEFINER=`root`@`localhost` PROCEDURE `TresMayus`(cadea varchar(100))
BEGIN
	select upper(substring(cadena, 1, 3));
END