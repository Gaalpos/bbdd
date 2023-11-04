CREATE DEFINER=`root`@`localhost` PROCEDURE `Examen04`()
BEGIN
	/*Recorrer los pedidos.
	Calcular el total de ventas por mes del año actual.
	Devolver el mes y el total*/
   
	select year(o.OrderDate) as 'Año', month(o.orderdate) as 'Mes', round(sum(UnitPrice * Quantity), 2) as 'Total del mes'
	from orders o join orderdetails od using(Orderid)
    where year(o.orderdate) = year(curdate())
	group by month(o.OrderDate), year(o.orderdate);
    
END