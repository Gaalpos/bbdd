CREATE DEFINER=`root`@`localhost` PROCEDURE `Pitagoras`(c1 double, c2 double, out hipo double)
BEGIN
	select sqrt(power(c1, 2) + power(c2, 2)) into hipo;
END