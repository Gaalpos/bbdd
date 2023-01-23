select max(sueldo) 
from empleados;

select *
from empleados
where sueldo =(select max(sueldo) from empleados);


select *
from empleados
where sueldo in (1000,2000,3000,4000);  # where sueldo = 1000 or sueldo= 2000 or sueldo = 3000 or sueldo = 4000;


# consulta sin sentido
select nombre, e.fecNacimiento, e.oficina, (select region from oficinas where codOficina=e.oficina)
from empleados e;   

select nombre, e.fecNacimiento, e.oficina, o.region
from empleados e left join oficinas o on  e.oficina=o.codOficina;
# EL LEFT JOIN SE BASA EN DONDE ESTAN LAS TABLAS EN BASE AL JOIN QUE SE ESCRIBE.
# EN ESTE CASO LEFT JOIN MUESTRA LOS EMPLEADOS QUE NO TIENEN OFICINA ASIGNADA



select nombre
from clientes
where codRepresentante =(select codEmpleado from empleados where nombre="Garcia Gómez, Luis Antonio");

# ==

select *
from empleados e  join clientes c on e.codEmpleado=c.codRepresentante
where e.nombre="Garcia Gómez, Luis Antonio";








