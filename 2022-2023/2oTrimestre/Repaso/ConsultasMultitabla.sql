# Ejercicios. Consultas multitabla

/*
1) Listar las oficinas de Galicia indicando para cada una de ellas su número, ciudad, códigos y
nombres de sus empleados. Hacer una versión en la que aparecen sólo las que tienen empleados,
y hacer otra en las que aparezcan las oficinas de Galicia que no tienen empleados.
*/

select codOficina, ciudad, codEmpleado, nombre 
from Oficinas join empleados
order by codOficina, codEmpleado;



/*
2) Listar los pedidos mostrando su número, fecha del pedido, nombre del cliente, y el límite de
crédito del cliente correspondiente (todos los pedidos tienen cliente y representante).
*/


/*
3) Listar los datos de cada uno de los empleados, la ciudad y región en donde trabaja.
*/


/*
4) Listar las oficinas con objetivo superior a 3.500€ indicando para cada una de ellas el nombre de
su director.
*/



/*
5) Listar las líneas de pedido superiores a 150 €, incluyendo el nombre del empleado que tomó el
pedido y el nombre del cliente que lo solicitó.
*/



/*
6) Hallar los empleados que realizaron su primer pedido el mismo día en que fueron contratados.
*/

/*
7) Listar los empleados con un sueldo superior al de su jefe; para cada empleado sacar sus datos y el
número, nombre y sueldo de su jefe.
*/

/*
8) Listar los códigos y nombre de los empleados que tienen una línea de pedido superior a 5.000 € o
que tengan un objetivo inferior a 200.000 €. (El empleado deberá mostrarse una vez)


/*
9) Listar las 5 líneas de pedido con mayor importe indicando el nombre del cliente del producto y
del representante.
*/


/*
10) Listar las oficinas que no tienen director.

/*
11) Seleccionar los clientes que no han realizado ningún pedido.
*/


/*
12) Seleccionar los productos que no han sido vendidos.\
*/

/*
13) Seleccionar los representantes que no han realizado ninguna venta, indicando el nombre del
empleado.
*/