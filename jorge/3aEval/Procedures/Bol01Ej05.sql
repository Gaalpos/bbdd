CREATE DEFINER=`root`@`localhost` PROCEDURE `Bol01Ej05`(id int)
BEGIN
	select concat(e.firstName, " ", e.lastname) Empleado, p.productName Producto, sum(od.quantity) Total
    from products p join orderdetails od using(productId)
    join orders o using (orderId) join employees e using(employeeId)
    where e.employeeId = id
    group by od.productId;
END