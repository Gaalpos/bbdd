CREATE DEFINER=`root`@`localhost` PROCEDURE `Examen06`()
BEGIN
	declare contador int default 0;
    
    declare CID int;
    declare CPrecio double;
    
	declare cu cursor for
		select ProductId, UnitPrice
        from products;
        
	declare exit handler for not found set contador = 0;
    
    open cu;
    Etiqueta : loop
		fetch cu into CID, CPrecio;
        update products set UnitPrice = (UnitPrice * 1.1);
        if contador = 1 then leave Etiqueta;
        end if;
	end loop Etiqueta;
    close cu;
    
END