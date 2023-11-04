CREATE DEFINER=`root`@`localhost` PROCEDURE `EjemploBucle01`(numRegistros integer)
BEGIN
	declare contador int;
    set contador = 0;
    bucle : repeat
		select * from products limit contador, 1;
        set contador = contador + 1;
        until contador >= numRegistros
	end repeat bucle;
END