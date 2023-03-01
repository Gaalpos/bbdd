use bdempresasabc;

drop trigger trNumeros;

## Ejemplo Triggers
create table numeros(
num int);

create table Cuadrados(
num int);

## Crear un trigger que cada vez que insertemos un valor en la 
## tabla numeros inserte su cuadrado en la tabla cuadrado


insert into Numeros(num) values (2),(5);
## insert into Cuadrados(num) values (4),(25);

create trigger trNumeros after insert on Numeros for each row
	insert into Cuadrados (num) values (new.num*new.num);
    
    
insert into Numeros(num) values (2),(5);

select * from numeros;
select * from cuadrados;

delete from numeros;
delete from cuadrados;


select * from bdempresasabc.oficinas01 where ventas > 4000;
## ver el documento de lunes25 para crear las tablas

create trigger trOficinas01 after delete on Oficinas01 for each row
delete from Oficinas02 where left(ciu,2)= left(old.ciu,1);

delete from Oficinas01 where left(ciu,1)="V";


## un  trigger qur cada vez que insertemos una lina de pedido
## actualice existencias del producto
## producto aci 410001 existencias antiguas 400

insert into LineasPedido (codPedido,numLinea, fabricante, producto, cantidad,precioVenta)
	values
    (32,10,"aci","410001",100,520);
    
    ## update Productos set existencias = existencias -100;
    
create trigger trLineasPedido after insert on LineasPedido for each row
	update Productos set existencias = existencias - new.cantidad where 
    idFabricante = new.fabricante and idProducto=new.producto;
    
## un  trigger qur actualice la cantidad de un pedido por lo que
##  tenemos que actualizar las existencias del producto
## producto aci 410001 existencias antiguas 300

update trLineasPedido1 set cantidad = 200 where codPedido = 32 and numlineas =10;
update productos set existencias= existencias + 100=200;

create trigger trActualizarLP after update on LineasPedido for each row
	update productos set existencias = existencias + old.cantidad - new.cantidad;