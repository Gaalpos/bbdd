set @total = 0;
call northwind.StockCategoria(1, @total);
select @total;

set @total = 0;
call ImportePedido('VINET', @total);
select @total;

set @cadSalida = "";
call TresMayusBis("mis alumnos son muy participativos", @cadSalida);
select @cadSalida;

set @hipotenusa = 0.0;
call Pitagoras(3, 4, @hipotenusa);
select @hipotenusa;

set @total = 0;
call Puntuacion('001-007', @total);
select @total;

call northwind.EjemploCursor();
select * from pedidosclientes;

set @valor = 0;
call ExplicacionCursor01(@valor);
select @valor;

call northwind.ExplicacionCursor03();
SELECT * FROM northwind.categorysales;