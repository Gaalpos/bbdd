select nombre, sueldo
 from empleados;
 
 create view viEmpleados01
 as
 select nombre, sueldo
 from empleados;
 
 select * from viempleados01;
 
 select nombre from viempleados01 where nombre like "A%";
 
 create view viEmpleados02(n,s)
 as
 select nombre, sueldo 
 from empleados;
 
  select n from viempleados01 where n like "A%";