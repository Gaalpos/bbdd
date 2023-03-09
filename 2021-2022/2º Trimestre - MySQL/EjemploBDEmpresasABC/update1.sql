select * from bdempresasabc.pedidos
where codRepresentante=106
order by fechaPedido;
update empleados set feccontrato= "2020-11-10" where codempleado =106;


##CORRER ESTO CUANDO NO DEJE HACER UPDATE
set SQL_SAFE_UPDATES=0;