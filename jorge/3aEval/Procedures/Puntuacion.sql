CREATE DEFINER=`root`@`localhost` PROCEDURE `Puntuacion`(resultado varchar(7), out total int)
BEGIN
	select (substring(resultado, 1, 3) + substring(resultado, 5)) into total;
END