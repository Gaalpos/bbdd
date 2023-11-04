CREATE DEFINER=`root`@`localhost` PROCEDURE `TresMayusBis`(cadena varchar(100), out final varchar(3))
BEGIN
	select upper(substring(cadena, 1, 3)) into final;
END