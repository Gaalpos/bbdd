CREATE DEFINER=`root`@`localhost` PROCEDURE `ExplicacionCursor03`()
BEGIN
-- crear una tabla y rellenarla, mediante un cursor, con el total de ventas por categoria
	declare contador int default 0;
    
    declare totalcat double;
    declare codCat int(11);
    declare nombreCat varchar(15);
    
    -- right join para que tambien salgan las categorias en las que no ha habido ninguna venta
    declare cursor1 cursor for 
		select categoryId, categoryName, sum(od.quantity * od.unitPrice)
        from orderdetails od join products p using(productId) right join categories c using(categoryID)
        group by categoryId;
        
	declare exit handler for not found set contador = 0;
    
    drop table if exists CategorySales;
    create table CategorySales (
		categoryID int(11) primary key references Categories(CategoryID),
        categoryName varchar(15),
        totalSales double
    );
    
    open cursor1;
    Etiqueta : loop
		fetch cursor1 into codCat, nombreCat, totalcat;
        insert into CategorySales values(codCat, nombreCat, totalCat);
        if contador = 1 then leave Etiqueta;
        end if;
	end loop Etiqueta;
    close cursor1;
END