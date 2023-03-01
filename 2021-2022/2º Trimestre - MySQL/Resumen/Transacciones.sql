## Transacciones
	START TRANSACTION;
	BEGIN;
	INSERT INTO Ventas(idProducto, idVendedor, cantidad) VALUE
	(200, 600, 500);

	UPDATE Productos SET existencias = existencias - 500 WHERE idProducto = 200;
	UPDATE Vendedores SET VentasAcumuladas = VentasAcumuladas + 500*3 WHERE idVendedor = 600;
	COMMIT;

	ROLLBACK;

	##SAVEPOINT
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