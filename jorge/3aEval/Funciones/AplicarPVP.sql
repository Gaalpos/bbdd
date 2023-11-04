CREATE DEFINER=`root`@`localhost` FUNCTION `AplicarPVP`(importeOriginal double, impuesto double) RETURNS double
BEGIN
	declare pvp double;
    set pvp = importeOriginal * (1 + (impuesto/100) );
RETURN pvp;
END