##Obtener el código, nombre y la fecha del primer pedido de cada empleado
Select CodEmpleado, nombre,
	(Select Min(fechapedido) From Pedidos Where codRepresentante = codEmpleado)
From Empleados;

## Obtener la fecha del primer pedido de cada empleado
Select codRepresentante, Min(fechapedido)
From pedidos
Group by codRepresentante;


Select codEmpleado,nombre, Min(Fechapedido)
From Pedidos Right Join Empleados on codRepresentante = CodEmpleado
Group by codEmpleado,nombre;


# Obtener el nombre del representante del cliente Alberto Juanes Álvarez

## subconsulta necesito obtener el codigo del representante del cliente 107
Select codRepresentante From Clientes
Where nombre = 'Alberto Juanes Álvarez';

## Paso 2
Select codEmpleado, nombre
From empleados
Where codEmpleado = 107;
## en una unica consulta con subconsultas
Select codEmpleado,nombre
From Empleados
Where codEmpleado = 
(Select codRepresentante From Clientes Where nombre = 'Alberto Juanes Álvarez');


##Obtener el código , nombre y la fecha del rpimer y ultimo pedido de cada empleado
Select codEmpleado,nombre,
	(Select Min(FechaPedido) From Pedidos Where codRepresentante = codEmpleado),
    (Select Max(fechapedido) From Pedidos Where codRepresentante = codEmpleado)
From Empleados;

## Subconsultas en las clausulas where o having

## Listar los nombres de los clientes que tiene asignado el representante
## García Gómez, Luis Antonio (suponiendo que no puede haber representantes con el
## mismo nombre)

## principal será sobre clientes
## subconsulta sobre empleados

##paso 1 106
Select codEmpleado From Empleados
Where nombre = 'García Gómez, Luis Antonio';

##paso 2 
Select codCliente, nombre, codRepresentante
From Clientes
Where codRepresentante = 106;

## subconsulta
Select codCliente, nombre, codRepresentante
From Clientes
Where codRepresentante = (Select codEmpleado From Empleados
Where nombre = 'García Gómez, Luis Antonio');

## Listar el codigo y el nombre de los empleados cuya fecha de contrato
## sea igual a la primera fecha de todos los pedidos de la empresa

Select codEmpleado,nombre
From Empleados
Where fecContrato;
##Subconsulta
# paso 1 2020-09-05
Select Min(FechaPedido) From pedidos;

##paso 2
Select codEmpleado,nombre,fecContrato
From Empleados
Where fecContrato = '2020-09-05';

## de resultados
Update Empleados set fecContrato = '2020-09-05' where CodEmpleado = '104'
Or codEmpleado = '110';

Select codEmpleado, nombre, fecContrato
From Empleados
Where fecContrato = (Select min (FechaPedido) From Pedidos);

## Listar los clientes cuyo agente asociado tiene la categoria de Representante 

## Principal Clientes
## Subconsulta Empleados

## paso1
Select codEmpleado From Empleados Where categoria = 'Representante';

## paso2
Select codCliente, nombre, codRepresentante
From Clientes
Where codRepresentante In
	(Select codEmpleado From Empleados Where categoria = 'Representante');

## Listar las oficinas cuyo objetivo sea superior al 75% de la suma de los salarios de
## sus empleados

## Principal Oficinas
## Subconsulta Empleados

## paso 1
Select Sum(sueldo) * 0.75
From Empleados ;

## paso 2
Select codOficina, ciudad, region, objetivo
From Oficinas
Where objetivo > (Select Sum(sueldo) * 0,75 From Empleados where codOficina = Oficina);

## Seleccionar que empleado fue contratodo primero

Select CodEmpleado, nombre
From Empleados
Where fecContrato = (select min (fecContrato) From Empleados);

##Seleccionar los pedidos del representante 106 superiores a la media alta

## Principal Pedidos
## Subconsulta lineasPedido

## paso 1 Subconsulta
Select codPedido, fechaPedido, Sum(cantidad * PrecioVenta)
From Pedidos Join LineasPedido Using (CodPedido)
Where codRepresentante = "106"
Group by codPedido
Having Sum(cantidad * precioVenta) >
(Select AVG(cantidad * precioVenta) From LineasPedido
	Where codRepresentante = "106" Group by codPedido);
##Seleccionar los pedidos superiores a la media de los pedidos del    
## representante 106
    
##Principal Pedidos
##Subconsulta lineaspedido

## subconsulta
Select AVG(cantidad * PrecioVenta)
From LineasPedido Join Pedidos Using (codPedido)
Where codRepresentante = "106";

## Consulta
Select codPedido, fechaPedido, Sum(cantidad * PrecioVenta)
From Pedidos Join LineasPedido Using (Codpedido)
Group by CodPedido
Having sum(cantidad * precioVenta) > 
(Select AVG(cantidad * PrecioVenta)
From LineasPedido Join Pedidos Using (codPedido)
Where codRepresentante = "106");