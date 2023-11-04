CREATE DEFINER=`root`@`localhost` PROCEDURE `StockCategoria`(categoria int, out total int)
BEGIN
	select sum(UnitsinStock) from products where categoryID = categoria
    into total;
END