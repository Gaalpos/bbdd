CREATE DEFINER=`root`@`localhost` FUNCTION `Factorial`(numero integer) RETURNS int(11)
BEGIN
	declare factorial integer;
	declare contador integer;
    set factorial = 1;
    set contador = 1;
    
    repeat
		set factorial = factorial * contador;
        set contador = contador + 1;
	until contador > numero
    end repeat;
RETURN factorial;
END