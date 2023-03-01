CREATE USER 'bdEmpresasABC'@'localhost' IDENTIFIED BY 'bdEmpresasABC';
GRANT ALL ON bdEmpresasABC.* TO 'bdEmpresasABC'@'localhost'
WITH GRANT OPTION;
FLUSH PRIVILEGES;