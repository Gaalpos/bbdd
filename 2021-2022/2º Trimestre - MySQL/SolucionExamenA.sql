/* Crear Tablas*/
CREATE DATABASE IF NOT EXISTS ExamenBeatrizOlalde;
USE ExamenBeatrizOlalde;
CREATE TABLE IF NOT EXISTS Proyecto(
prCodigo INT PRIMary key,
prTitulo VARCHAR(50) NOT NULL,
prFecInicio DATE NOT NULL,
prFecFinal DATE NOT NULL,
prResponsable VARCHAR(50) NOT NULL,
prCodSede INT NOT NULL)Engine = InnoDB;

CREATE TABLE IF NOT EXISTS Empleado(
emCodigo CHAR(5) PRIMARY KEY,
emNombre VARCHAR(50) NOT NULL,
emFecNacimiento DATE NOT NULL,
emCategoria VARCHAR(20) NOT NULL,
emContrato DATE,
emCodProyecto INT NOT NULL,
emSueldo INT NOT NULL,
emRetencionesIRPF DECIMAL(4,2),
emRetencionesSS DECIMAL(4,2),
emNacionalidad VARCHAR(20) NOT NULL)Engine = InnoDB; 

ALTER TABLE Proyecto ADD COLUMN prPresupuesto INT NOT NULL;
ALTER TABLE empleado ADD FOREIGN KEY (emCodProyecto) REFERENCES Proyecto (prCodigo);
ALTER TABLE empleado MODIFY COLUMN emContrato DATE NOT NULL;
ALTER TABLE empleado MODIFY COLUMN emSueldo  DECIMAL(8,2) NOT NULL;
ALTER TABLE empleado CHANGE COLUMN emContrato emFechaContrtato DATE;
ALTER TABLE empleado DROP COLUMN emNacionalidad;
/*
2º
*/
START TRANSACTION;
INSERT INTO Proyecto (prCodigo, prTitulo, prFecInicio, prFecFinal, prResponsable, prCodSEde, prPresupuesto)
VALUES (999, 'A', CURDATE(), ADDDATE(CURDATE(), INTERVAL 4 YEAR), 'Juan Pérez', 1, 123000);
INSERT INTO Empleado VALUES ('E1234', 'Juan Perez', '1972-11-08', 'Director', CURDATE(), '999', 50000, 12.30,8.55);
/*
3º)
*/
CREATE TABLE IF NOT EXISTS Peliculas(
Titulo VARCHAR(50) NOT NULL,
Director VARCHAR(50),
Sinopsis Text,
FULLTEXT(Titulo),
FULLTEXT(Director),
FULLTEXT(Sinopsis),
FULLTEXT(Titulo, Sinopsis),
FULLTEXT(Director, Sinopsis),
FULLTEXT KEY (Sinopsis, Director,Titulo))Engine = MyISAM;


##Mostrar todas las películas que hablen sobre periódicos, periodistas, etc.
SELECT *  FROM Peliculas
WHERE MATCH(sinopsis) AGAINST('period*' IN BOOLEAN MODE);
##	Mostrar todas las películas que contengan la frase “campeón del mundo”.
SELECT *  FROM Peliculas
WHERE MATCH(sinopsis) AGAINST('"campeon del mundo"' IN BOOLEAN MODE);
	##Mostrar todas las películas en las que aparezca la palabra “director”
SELECT *  FROM Peliculas
WHERE MATCH(sinopsis) AGAINST(director);
##Mostrar todas las películas en las que aparezca la palabra “director”, utilizando el modo de expansión de consulta.
SELECT *  FROM Peliculas
WHERE MATCH(sinopsis) AGAINST('director' WITH QUERY EXPANSION);



/*
4.	Devuelve un listado con el código de pedido, nombre del cliente, fecha esperada y fecha de entrega 
de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada. 
Utlizar funciones de Fecha
*/
CREATE VIEW viFecha AS
SELECT codPedido, nombreCliente, fechaEsperada, fechaEntrega, DATEDIFF(fechaEsperada, FechaEntrega )
FROM Pedido JOIN Cliente USING (CodCliente)
WHERE DATEDIFF(fechaEsperada, FechaEntrega) > 2;


/*
5.	Devuelve un listado con el nombre completo de los empleados en una única columna junto 
con el nombre completo de sus jefes en una única columna. Ordenados por jefe
*/
SELECT e.codEmpleado, CONCAT(e.apellido1, ' ', e.apellido2, ', ', e.nombre) Empleado, 
e.codjefe, CONCAT(jefe.apellido1, ' ', jefe.apellido2, ', ', jefe.nombre) AS jefe
FROM Empleado e JOIN Empleado jefe ON e.codjefe = jefe.codEmpleado
ORDER BY jefe;

/*
6.	Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no 
han realizado ningún pedido ordenado por cliente.
*/
SELECT * FROM Cliente
WHERE codCliente NOT IN (SELECT codCliente FROM Pedido) OR 
codCliente NOT IN (SELECT codCliente FROM Pago)
ORDER BY nombreCliente;
/*
7.	Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los 
representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
*/
SELECT * FROM Oficina
WHERE codOficina NOT IN 
(SELECT codOficina
FROM Producto JOIN detallepedido USING (codProducto) 
JOIN Pedido USING (codPedido)
JOIN Cliente USING (codCliente)
JOIN Empleado ON codEmpleado = codEmpleadoRep
WHERE gama = 'Frutales');

select codoficina from oficina where codoficina not in (select codOficina from empleado
where codempleado in (select codempleadorep from cliente 
where codcliente in (select codcliente from pedido 
where codpedido in (select codpedido from detallepedido 
where codproducto in (select codproducto from producto where gama = 'Frutales')))));

/*
8.	La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, 
el IVA y el total facturado. La base imponible se calcula sumando el precio de venta del producto por el 
número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, 
y el total la suma de los dos campos anteriores. Formatear los resultados con 2 decimales
*/

SELECT Format(SUM(precioVenta * cantidad), 2) AS BaseImponible,
FORMAT(SUM(precioVenta * cantidad)*0.12, 2) AS IVA,
FORMAT(SUM(precioVenta * cantidad)*1.21, 2) AS TOTAL
FROM detallepedido JOIN producto USING (codProducto);


/*
9.	La misma información que en la pregunta anterior, pero agrupada por código de producto, mostrando el 
nombre del producto ordenado por el nombre.
*/ 
CREATE TABLE FACturacion
SELECT codProducto, nombre, Format(SUM(precioVenta * cantidad), 2) AS BaseImponible,
FORMAT(SUM(precioVenta * cantidad)*0.12, 2) AS IVA,
FORMAT(SUM(precioVenta * cantidad)*1.21, 2) AS TOTAL
FROM detallepedido JOIN producto USING (codProducto)
GROUP BY codProducto
ORDER BY nombre;

/*10 Mostrar los productos con los que se ha obtenido un beneficio superior a laa media de todos los productos.
Para calcular el beneficio tenemos que tener en cuenta el precio de venta, el de compra y las unidades vendidad
*/
SELECT nombre, SUM(cantidad * precioVenta - cantidad * precioCompra) AS Beneficio
FROM Producto JOIN detallepedido USING (codProducto)
GROUP BY nombre
HAVING SUM(cantidad * precioVenta - cantidad * precioCompra) > 
(SELECT AVG(cantidad * precioVenta - cantidad * precioCompra) FROM Producto JOIN detallepedido USING (codProducto))

