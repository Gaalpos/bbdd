CREATE USER IF NOT EXISTS 'Adrian'@'localhost' IDENTIFIED BY 'Adrian'; 

USE mysql;

SELECT *
FROM mysql.user;

DROP USER 'marta'@'localhost';

SHOW TABLES;

## Otorgar todos los privilegios a Adrian en todas las bases de datos
GRANT ALL PRIVILEGES ON . TO 'Adrian'@'localhost';

CREATE USER 'pepe'@'localhost' IDENTIFIED BY 'pepe';

GRANT ALL PRIVILEGES ON bdEmpresasAbc.* TO 'pepe'@'localhost';

CREATE USER 'isabel'@'localhost' IDENTIFIED BY 'isabel';

GRANT ALL PRIVILEGES ON bdEmpresasAbc.empleados TO 'isabel'@'localhost';

CREATE USER 'angel'@'localhost' IDENTIFIED BY 'angel';

CREATE USER 'carmen'@'localhost' IDENTIFIED BY 'carmen';
GRANT ALL PRIVILEGES ON . TO 'carmen'@'localhost' WITH GRANT OPTION;

GRANT SELECT(codCliente, nombre) ON bdempresasABC.clientes TO 'isabel'@'localhost'; 

FLUSH PRIVILEGES;


GRANT SELECT, INSERT ON bdempresasABC.Pedidos TO 'angel'@'localhost'; 
GRANT INSERT, UPDATE ON bdempresasABC.Pedidos TO 'angel'@'localhost'; 

SHOW GRANTS;
SHOW GRANTS FOR CURRENT_USER;
SHOW GRANTS FOR 'primeroDAM'@'localhost';

SHOW GRANTS FOR 'isabel'@'localhost';

REVOKE SELECT ON bdempresasabc.* FROM 'isabel'@'localhost';

SELECT * FROM USER;

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'carmen'@'localhost';
FLUSH PRIVILEGES;

REVOKE SELECT, INSERT FROM 'carmen'@'localhost';
REVOKE SELECT, INSERT ON bdempresasabc.* FROM 'beatriz'@'localhost'