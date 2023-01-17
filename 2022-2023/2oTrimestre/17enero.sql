select max(sueldo) 
from empleados;

select *
from empleados
where sueldo =(select max(sueldo) from empleados);


select *
from empleados
where sueldo in (1000,2000,3000,40000);  # where sueldo = 1000 or sueldo= 2000 or sueldo = 3000 or sueldo = 4000;


# consulta sin sentido
select nombre, e.fecNacimiento, e.oficina, (select max(sueldo) from empleados)
from empleados e;