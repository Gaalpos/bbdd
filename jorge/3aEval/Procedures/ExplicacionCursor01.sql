CREATE DEFINER=`root`@`localhost` PROCEDURE `ExplicacionCursor01`(out resultado double)
BEGIN
	-- El cursor sirve para traer lor resultados de una consulta
    -- El handler sirve para cerrar el bucle cuando no haya mas datos
    -- select max(quantity * unitprice) into resultado from orderDetails
    declare cursor1 cursor for select max(quantity * unitprice) from orderDetails;
    
    open cursor1;
    fetch cursor1 into resultado;
    close cursor1;
END