CREATE DEFINER=`root`@`localhost` PROCEDURE `Bol01Ej04`(mes int(2))
BEGIN
	select p.productName, sum(od.quantity)
    from products p join orderdetails od using(productId)
    join orders o using (orderId)
    where month(o.orderdate) = mes
    group by p.productId;
END