select c.codCliente, c.nombre
where not exists (select * from pedidos where codCliente=c.codCliente);

select c.codCliente, c.nombre, p.codPedido
from pedidos p right join clientes c using(codCliente);