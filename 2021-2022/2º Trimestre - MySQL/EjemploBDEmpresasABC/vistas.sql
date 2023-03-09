create view viEmpleadosOficinas03 (codOficina, ciudad, codEmpleado, nombre, fecContrato, sueldo,
comision, retencionesIRPF, retencionesSS) as 
select  codOficina, ciudad, codEmpleado, nombre, fecContrato, sueldo,
comision, retencionesIRPF, retencionesSS 
from Oficinas join empleados on codOficina = oficina;

create view viEmpleadosOficinas04 (ofi, ciu, codEm, nom, fecCon, suel,
comi, rIRPF, rSS) as 
select  codOficina, ciudad, codEmpleado, nombre, fecContrato, sueldo,
comision, retencionesIRPF, retencionesSS 
from Oficinas join empleados on codOficina = oficina;

select ofi, ciu, nom, suel, comi, suel+comi
from viEmpleadosOficinas03
where comi is not null;


create view viListaPEdidos (pedido, fecha, cliente, vendedor, importe,iva,total)
as select codPedido, fechaPedido, clientes.nombre, empleados.nombre,
SUM(cantidad * precioVenta), sum(cantidad*precioVenta*0.21),
sum(cantidad*precioVenta*1.21)
from pedidos join lineaspedido using(codPedido)
join Clientes using (codCLiente)
join Empleados on codEmpleado = Pedidos.CodRepresentante
group by codPedido;

select *
from viListapedidos;