######## 
# DIFERENCIA DE TIEMPO
# datediff  >> devuelve la diferencia en dias
select nombre, datediff( curdate(), fecContrato)
from empleados;
 
# timestampdiff >> devuelve la diferencia en la unidad indicada (year, week, day, etc)
select nombre, timestampdiff(week, fecContrato, curdate())
from empleados;

#########
# AÑOS
# tengo que coger el año actual y restarle los años que sean 

select *
from pedidos
where YEAR(CURDATE()) -1 = YEAR(FechaPedido);

#########
# EDAD

# timestampdiff devuelve la edad exacta
select timestampdiff(year, fecNacimiento, curdate()) as Edad
from empleados;

# Esta forma devuelve la edad, pero puede ser inexacta, ya que cuenta un año de mas aunque aun no hayamos llegado a dicho dia
select year(curdate())-year(fecNacimiento) as Edad
from empleados;

# (suponiendo que este año ya ha cumplido años). >> si  nos  dicen que ya ha cumplido añs debemos usar year, si  es exacta datediff

#########
# ORDEN

# Order by ordena de forma predeterminada de forma ASC (ascendente) (1, 67, 99). añadir DESC para que empiece de mayor a menor (99, 67, 1)
select *
from lineaspedido
order by codPedido;

#########
# SELECCION MULTIPLES VALORES

# Para seleccionar varios valores podemos IN de la siguiente forma
select *
from clientes
where codRepresentante in ('102', '104', '109') ;
#########

# COMODIN
select *
from  productos
where idProducto like '%x';

#########
# IFNULL

# ifnull (valor , 0) >>  asigna valor 0 cuando el valor sea nulo

#########
# SUELDO ACUMULADO

#mont
select nombre, (sueldo + ifnull(comision,0) * month(curdate()))  as SueldoAcumulado
from empleados;

#########

# 3 PRIMERAS LETRAS
# substring(ProductName,1,3)
