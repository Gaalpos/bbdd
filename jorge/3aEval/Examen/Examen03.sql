CREATE DEFINER=`root`@`localhost` PROCEDURE `Examen03`()
BEGIN
	declare contador int default 0;
    
    declare CNombre varchar(40);
    declare CPrecio double;

	declare cu cursor for
		select ProductName, UnitPrice
        from products;
	
	declare exit handler for not found set contador = 0;

	open cu;
    Etiqueta : loop
		fetch cu into CNombre, CPrecio;
        select CNombre, CPrecio;
		if contador = 1 then leave Etiqueta;
        end if;
	end loop Etiqueta;
    close cu;
    
END