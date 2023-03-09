CREATE DATABASE IF NOT EXISTS aaBDTransacciones;
USE aaBDTransacciones;

CREATE TABLE Productos(
idProducto INT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
precio INT NOT NULL,
existencias INT NOT NULL);

CREATE TABLE Vendedores(
idVendedor INT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
ventasAcumuladas INT DEFAULT 0);

CREATE TABLE VENTAS(
idVenta INT PRIMARY key AUTO_INCREMENT,
idProducto INT NOT NULL,
idVendedor INT NOT NULL,
cantidad INT NOT NULL,
FOREIGN KEY (idProducto) REFERENCES Productos (idProducto),
FOREIGN KEY (idVendedor) REFERENCES Vendedores (idVendedor));


INSERT INTO Productos (idProducto, nombre, precio, existencias) VALUES
(100, 'peras', 2, 2000),
(200, 'manzanas', 3, 3000);

INSERT INTO Vendedores (idVendedor, nombre, ventasAcumuladas) VALUES
(500, 'Juan', 5000),
(600, 'Maria', 6000);

## El vendedor JUan codigo 500 vende peras codigo 100 cantidad 200

INSERT INTO Ventas(idProducto, idVendedor, cantidad) VALUES
(100, 500, 200);
UPDATE Productos SET existencias = existencias - 200 WHERE idProducto = 100;
UPDATE Vendedores SET VentasAcumuladas = VentasAcumuladas + 200*2 WHERE idVendedor = 500;



## El vendedor Maria codigo 600 vende manzanas codigo 200 cantidad 500
START TRANSACTION;
BEGIN;
INSERT INTO Ventas(idProducto, idVendedor, cantidad) VALUES
(200, 600, 500);

UPDATE Productos SET existencias = existencias - 500 WHERE idProducto = 200;
UPDATE Vendedore SET VentasAcumuladas = VentasAcumuladas + 500*3 WHERE idVendedor = 800;
COMMIT;

ROLLBACK;

## SAVEPOINT

CREATE TABLE numeros(numero int);

START TRANSACTION;
BEGIN;
INSERT numeros(numero) VALUES (5), (3);
SELECT numero FROM Numeros;
SAVEPOINT miPunto;
INSERT numeros(numero) VALUES (15), (13);
SELECT numero FROM Numeros;
ROLLBACK TO SAVEPOINT miPunto;
INSERT numeros(numero) VALUES (25), (23);
COMMIT;

## Maria vende  300 manzanas 
INSERT INTO Ventas(idProducto, idVendedor, cantidad) VALUES
((SELECT idProducto FROM Productos WHERE nombre = 'Manzanas'),
(SELECT idVendedor FROM Vendedores WHERE nombre = 'Maria'), 300);

UPDATE Productos SET existencias = existencias - 300 
	WHERE idProducto = (SELECT idProducto FROM Productos WHERE nombre = 'Manzanas');
UPDATE Vendedores SET VentasAcumuladas = VentasAcumuladas + 300*
	(SELECT precio FROM Productos WHERE nombre = 'Manzanas')
WHERE idVendedor = (SELECT idVendedor FROM Vendedores WHERE nombre = 'Maria');
