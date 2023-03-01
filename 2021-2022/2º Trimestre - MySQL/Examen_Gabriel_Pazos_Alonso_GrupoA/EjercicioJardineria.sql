USE BDJardineria;

## 4
create view FechaEntrega  (codPedido,codCliente,fechaEsperada,fechaEntrega)
as select pedido.codPedido, pedido.codCliente,pedido.fechaEsperada,pedido.fechaEntrega
from pedido
where (extract(day from pedido.fechaEsperada)-2)= extract(day from pedido.fechaEntrega) and (extract(month from pedido.fechaEntrega)= extract(month from pedido.fechaEsperada));

SELECT * FROM FechaEntrega;


## 6
select cliente.nombreCliente
from cliente
left join pago on pago.codCliente=cliente.codCliente
left join pedido on pedido.codCliente=cliente.codCliente
where pedido.codCliente is null and pago.codCliente is null
order by nombrecliente;

## 7
select * 
from oficina
join empleado on (oficina.codOficina=empleado.codOficina)
join cliente on (cliente.codEmpleadoRep=empleado.codEmpleado)
join pedido on (cliente.codCliente=pedido.codCliente)
join detallepedido on (detallepedido.codPedido=pedido.codPedido)
join producto on (detallepedido.codProducto=producto.codProducto)
join gamaproducto on (producto.gama=gamaproducto.gama)
where gamaproducto.gama like 'Frutales' and (cliente.codEmpleadoRep <> all (select codEmpleado from empleado
join oficina on (oficina.codoficina=empleado.codOficina)));

## 8
select sum(cantidad*precioUnidad) as imponible,
sum(cantidad*precioUnidad)*0.21 as IVA,
sum(cantidad*precioUnidad)*1.21 as total
from detallepedido;



