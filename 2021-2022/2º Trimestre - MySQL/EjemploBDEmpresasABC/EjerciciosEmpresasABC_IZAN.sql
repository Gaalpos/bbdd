use bdempresasabc;

##1
select idfabricante, idproducto, descripcion, preciocompra, 21/100 as iva, 
(preciocompra * 21/100 + preciocompra) as precioFinal
from productos;

##2
select codPedido, fabricante, producto, cantidad, precioVenta, 
(precioVenta * cantidad) as importe
from lineaspedido;

##3
select nombre,  datediff(curdate(),fecContrato), if(right(fecNacimiento,5) > right(curdate(), 5), 0, 1) as edad,
(year(curdate()) - year(fecNacimiento)) as edad
from empleados;

##4
select *
from clientes
order by codRepresentante;

##5
select *
from oficinas
order by region, ciudad, codOficina;

##6
select *
from pedidos
order by fechaPedido;

##7
select *
from lineaspedido
order by precioVenta*cantidad desc
limit 8;

##8
select distinct *
from lineaspedido
order by precioVenta
limit 5;

##9
select *
from pedidos
where month(fechaPedido) = 3 and year(fechaPedido) = year(curdate())-1;

##10
select *
from pedidos
where month(fechaPedido) = if(month(curdate())-1 = 0, 12, month(curdate())-1)
and year(fechapedido) = if(month(curdate())-1 = 0, year(curdate())-1,
year(curdate()));

##11
select codEmpleado, nombre, oficina
from empleados
where oficina is not null;

##12
select codEmpleado, nombre, oficina
from empleados
where oficina is null;

##13
select *
from oficinas
where region in ('Euzkadi', 'Galicia')
order by region desc;

##14
select *
from clientes
where nombre like'Julia %';

##15
select *
from productos
where idProducto like '%x';

##16
select nombre, fecNacimiento, year(curdate()) - year(fecNacimiento) as edad,
year(curdate()) - year(fecNacimiento) - if(right(fecNacimiento,5) > right(curdate(),5),1,0) as edad1
from empleados 
where year(curdate()) - year(fecNacimiento) between 40 and 60; 

##17
select *
from clientes
where codRepresentante in (102,104,109);

##18
select *
from productos
order by idFabricante, precioCompra desc;

##19
select nombre, fecContrato, round(datediff(curdate(),fecContrato)/365)
from empleados 
where datediff(curdate(),fecContrato)/365 >= 25;

##20
select *
from oficinas
where objetivo is null or objetivo = 0;

##21
select nombre, (sueldo + ifnull (comision,0)) * month(curdate()) as acumulado, objetivo,
objetivo - (sueldo + ifnull (comision,0)) * month(curdate()) as falta
from empleados
where (sueldo + ifnull (comision,0)) * month(curdate()) < objetivo;

##22
select nombre, sueldo, ifnull(comision,0), sueldo + ifnull(comision,0) as 'Sueldo bruto',
(sueldo + ifnull(comision,0)) * retencionesIRPF IRPF,
format((sueldo + ifnull(comision,0)) * retencionesSS,2) SS,
(sueldo + ifnull(comision,0)) - (sueldo + ifnull(comision,0)) * retencionesIRPF - format((sueldo + ifnull(comision,0)) * retencionesSS,2) as 'sueldo neto'
from empleados;

## Consultas multitabla

## 1
### Producto cartesiano
select empleados.*, ciudad, region
from empleados, oficinas
where oficina = codoficina;

### Composicion interna
select empleados.*, ciudad, region
from oficinas join empleados on codOficina = oficina;

### composicion externa, listar todas las listas y los datos de los empleados cuando los tengo
select empleados.*, ciudad, region
from oficinas left join empleados on codoficina = oficina;

### mismo resultado

select empleados.*, ciudad, region
from empleados right join oficinas on codoficina = oficina;



## 2
### Producto cartesiano
select codPedido, fechaPedido, clientes.nombre, clientes.codCliente as cliente, limiteCredito,
empleados.nombre as representante
from pedidos, clientes, empleados
where pedidos.codCliente = clientes.codCliente and codEmpleado = pedidos.codrepresentante;

### Composicion interna
select codPedido, fechaPedido, clientes.nombre, clientes.codCliente as cliente, limiteCredito,
empleados.nombre as representante
from pedidos join clientes using(codcliente) join empleados on codEmpleado = pedidos.codRepresentante;

##3



## Hasta aqui ejercicios 

select nombre, sueldo from empleados
where oficina = "";

select nombre, sueldo, oficina
from empleados
where oficina in (12,13,30,31);

select nombre, sueldo, oficina
from empleados
where oficina is null;

select nombre, sueldo, oficina
from empleados
where nombre like 'L%';

select nombre, sueldo, oficina
from empleados
where nombre like '%, A%';

select nombre, sueldo, oficina
from empleados
where nombre regexp '^[L-P]';

select codPedido, fechaPedido
from pedidos;

## producto cartesiano
select codPedido, fechaPedido, pedidos.codCliente, clientes.codCliente,nombre
from pedidos, clientes
where pedidos.codcliente = clientes.codcliente
order by codPedido;

##composicion
select codpedido, fechapedido, pedidos.codcliente, clientes.codcliente, nombre
from pedidos inner join clientes on pedidos.codcliente = clientes.codcliente;

select codpedido, fechapedido, pedidos.codcliente, clientes.codcliente, nombre
from pedidos inner join clientes using(codCliente)
where year(fechaPedido) = year(curdate());

select distinct codDirector, codempleado, nombre
from directores join empleados on codDirector = codempleado;

