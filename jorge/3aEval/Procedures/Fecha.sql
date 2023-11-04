CREATE DEFINER=`root`@`localhost` PROCEDURE `Fecha`()
BEGIN
	select curdate(), rand();
END