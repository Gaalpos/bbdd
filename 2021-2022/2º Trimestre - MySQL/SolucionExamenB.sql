/* Crear Tablas*/
CREATE DATABASE IF NOT EXISTS ExamenBeatrizOlaldeB;
USE ExamenBeatrizOlaldeB;
CREATE TABLE IF NOT EXISTS Cuentas(
codCuenta INT PRIMARY KEY,
nifCliente CHAR(9) NOT NULL,
fechaCreacion DATE NOT NULL,
saldo INT NOT NULL DEFAULT 0);

CREATE TABLE IF NOT EXISTS Movimientos(
idMovimiento INT PRIMARY KEY AUTO_INCREMENT,
codCuenta INT NOT NULL,
fechaHora DATE NOT NULL,
cantidad INT ,
descripcion VARCHAR(50) NOT NULL);

##	Añadirle a la tabla MOVIMIENTOS la columna nifOperacion CHAR(9), no puede ser nula.
ALTER TABLE MOVIMIENTOS ADD COLUMN nifOperacion CHAR(9) NOT NULL;

##	Añadir la relación entre las tablas CUENTAS y MOVIMIENTOS.
ALTER TABLE Movimientos ADD FOREIGN KEY (codCuenta) REFERENCES Cuentas (codCuenta);

##	Modificar las caracteristicas de la columna cantidad de la tabla MOVIMIENTOS, que no puede ser nula.
ALTER TABLE MOVIMIENTOS MODIFY COLUMN cantidad INT NOT NULL;

##	Modificar el tipo de dato de la columna fechaHora, pasa a ser de tipo DATETIME.
ALTER TABLE MOVIMIENTOS MODIFY COLUMN fechaHora  DATETIME NOT NULL;

##	Cambiar el nombre a la columna cantidad por importe.
ALTER TABLE MOVIMIENTOS CHANGE COLUMN cantidad importe INT;

##	Eliminar la columna descripcion
ALTER TABLE MOVIMIENTOS DROP COLUMN descripcion;

## 2ª) Crear una transacción que registra:

START TRANSACTION;
INSERT INTO Cuentas (codCuenta, nifCliente, fechaCreacion, saldo) VALUES
(1, '145A', CURDATE(), 0);
INSERT INTO Movimientos (codCuenta,fechaHora, importe, nifOperacion) VALUES
(1, NOW(), 1000, '256j');
COMMIT ;
##ROLLBACK;

## 3º Crear la tabla Peliculas, con la siguiente estructura:

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

## Mostrar todas las películas en las que aparezca la palabra “guerra”
SELECT *  FROM Peliculas
WHERE MATCH(sinopsis) AGAINST('guerra');

## Mostrar todas las películas en las que aparezca la palabra “guerra”, utilizando el modo de expansión de consulta.
SELECT *  FROM Peliculas
WHERE MATCH(sinopsis) AGAINST('guerra' WITH QUERY EXPANSION);

## Mostrar todas las películas en las que aparezca la palabra “director” o “directora”, también pueden ser sus plurales, “directores” o “directoras”, etc.
SELECT *  FROM Peliculas
WHERE MATCH(sinopsis) AGAINST('direct*' IN BOOLEAN MODE);

## Mostrar todas las películas que contengan la palabra “trabajo” y no contengan la palabra “sufragista”.
SELECT *  FROM Peliculas
WHERE MATCH(sinopsis) AGAINST('+trabajo -sufragista' IN BOOLEAN MODE);


/* 4º) Calcular La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, 
el IVA y el total facturado. La base imponible se calcula sumando el precio de venta del producto 
por el número de unidades vendidas de la tabla detallePedido. 
El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores. 
Formatear los resultados con 2 decimales*/
SELECT Format(SUM(precioVenta * cantidad), 2) AS BaseImponible,
FORMAT(SUM(precioVenta * cantidad)*0.12, 2) AS IVA,
FORMAT(SUM(precioVenta * cantidad)*1.21, 2) AS TOTAL
FROM detallepedido JOIN producto USING (codProducto);

/* 5º) Crear una Vista Facturacion con la misma información que en la pregunta anterior, 
pero agrupada por código de producto, mostrando el nombre del producto ordenado por el nombre.*/
CREATE VIEW Facturacion AS 
SELECT codProducto, nombre, Format(SUM(precioVenta * cantidad), 2) AS BaseImponible,
FORMAT(SUM(precioVenta * cantidad)*0.12, 2) AS IVA,
FORMAT(SUM(precioVenta * cantidad)*1.21, 2) AS TOTAL
FROM detallepedido JOIN producto USING (codProducto)
GROUP BY nombre
ORDER BY nombre;

SELECT * FROM Facturacion;



/* 6º) Crear una tabla FechaEsperada con los siguientes datos: código de pedido, nombre del cliente,
 fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos 
 dos días antes de la fecha esperada. Utilizar funciones de Fecha*/
 
 CREATE TABLE FechaEsperada 
 SELECT codPedido, nombreCliente, fechaEsperada, fechaEntrega, DATEDIFF(fechaEsperada, FechaEntrega )
FROM Pedido JOIN Cliente USING (CodCliente)
WHERE DATEDIFF(fechaEsperada, FechaEntrega) > 2;

SELECT * FROM FechaEsperada;

/* 7º) Mostrar los productos con los que se ha obtenido un beneficio superior a la media del 
beneficio de todos los productos. Para calcular el beneficio tenemos que tener en cuenta el 
precio por unidad, el de compra y las unidades vendidas*/

SELECT nombre, SUM(cantidad * precioVenta - cantidad * precioCompra) AS Beneficio
FROM Producto JOIN detallepedido USING (codProducto)
GROUP BY nombre
HAVING SUM(cantidad * precioVenta - cantidad * precioCompra) > 
(SELECT AVG(cantidad * precioVenta - cantidad * precioCompra) FROM Producto JOIN detallepedido USING (codProducto));

/* 8º) Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido 
los representantes de ventas de algún cliente que haya realizado la compra de algún producto 
de la gama Frutales.*/

SELECT * FROM Oficina
WHERE codOficina NOT IN 
(SELECT codOficina
FROM Producto JOIN detallepedido USING (codProducto) 
JOIN Pedido USING (codPedido)
JOIN Cliente USING (codCliente)
JOIN Empleado ON codEmpleado = codEmpleadoRep
WHERE gama = 'Frutales');

SELECT codoficina FROM oficina WHERE codoficina NOT IN (SELECT codOficina FROM empleado
WHERE codempleado IN (SELECT codempleadorep FROM cliente 
WHERE codcliente IN (SELECT codcliente FROM pedido 
WHERE codpedido IN (SELECT codpedido FROM detallepedido 
WHERE codproducto IN (SELECT codproducto FROM producto WHERE gama = 'Frutales')))));

/* 9º) Devuelve un listado que muestre los clientes que no han realizado ningún pago 
y los que no han realizado ningún pedido ordenado por cliente.*/
SELECT * FROM Cliente
WHERE codCliente NOT IN (SELECT codCliente FROM Pedido) OR 
codCliente NOT IN (SELECT codCliente FROM Pago)
ORDER BY nombreCliente;

/* 10º) Devuelve un listado con el nombre completo de los empleados en una única columna 
junto con el nombre completo de sus jefes en una única columna. Ordenados por jefe*/
SELECT e.codEmpleado, CONCAT(e.apellido1, ' ', e.apellido2, ', ', e.nombre) Empleado, 
e.codjefe, CONCAT(jefe.apellido1, ' ', jefe.apellido2, ', ', jefe.nombre) AS jefe
FROM Empleado e JOIN Empleado jefe ON e.codjefe = jefe.codEmpleado
ORDER BY jefe;
