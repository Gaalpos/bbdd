# Apuntes de SQL para Bases de Datos
## Índice
- [Detalles importantes](#detalles-importantes)
- [Clausulas](#clausulas)
  - [SELECT](#select)
    - [FUNCIONES DE SELECT](#funciones-de-select)
    - [OPERADORES DE SELECT](#operadores-de-select)
  - [FROM](#from)
  - [WHERE](#where)
    - [Operadores de WHERE](#operadores-de-where)
  - [ORDER BY](#order-by)
  - [GROUP BY](#group-by)
  - [HAVING](#having)
  - [LIMIT](#limit)
  - [JOIN](#join)
  - [INER JOIN](#iner-join)
  - [LEFT JOIN](#left-join)
  - [RIGHT JOIN](#right-join)
  - [SUBCONSULTAS](#subconsultas)
  - [CASE](#case)
- [SUBLENGUAJES DE SQL](#sublenguajes-de-sql)
- [AGRADECIMIENTOS](#agradecimientos)


## Detalles importantes
1. Los strings van siempre entre comillas simples.
2. La \ sirve para dejar un espacio en blanco.
3. Para poner mayor o menor + igual, él = deve de ir despues de < o >.
4. Para indicar que algo es diferente utilizaremos **<>**.
5. Siempre terminaremos una consulta con **;** punto y coma.
6. Para hacer comentarios en una linea usaremos **--** antes del comentario.
7. Para hacer los comentarios en varias lineas usaremos **/* */** poniendo el comentario entre los asteriscos.
8. Las clausulas SELECT, FROM, WERE, HAVING ... iran siempre en mayúsculas.

## CLÁUSULAS

### SELECT
La instrucción SELECT se utiliza para seleccionar datos de una base de datos.
```SQL
SELECT column1, column2, ...
FROM table_name;
```
Aquí, columna 1, columna2, ... son los nombres de los campos que utilizamos para selecionar los datos que queremos mostrar.
#### FUNCIONES DE SELECT
- La función **SUM ()** devuelve la suma total de una columna numérica..    
En la siguienteconsulta muestra la suma total de la poblacion de todo el mundo.
```SQL
SELECT SUM(population)
FROM world
```
- La función **DISTINCT** se usa para devolver solo valores distintos (diferentes).    
Dentro de una tabla, una columna a menudo contiene muchos valores duplicados; y a veces solo desea enumerar los diferentes valores (distintos).   
La siguiente instrucción SQL selecciona solo los valores DISTINCT de la columna "País" en la tabla "Clientes":
```SQL
 SELECT DISTINCT Country
 FROM Customers;
```
- La función **COUNT ()** devuelve el número de filas que coinciden con un criterio específico.   
La siguiente instrucción SQL encuentra el número de productos:
```sql
SELECT COUNT(ProductID)
FROM Products;
```
- La función **AVG ()** devuelve el valor promedio de una columna numérica.   
La siguiente instrucción SQL encuentra el precio promedio de todos los productos:
```SQL
SELECT AVG(Price)
FROM Products;
```
- La función **MIN ()** devuelve el valor más pequeño de la columna seleccionada.   
La siguiente instrucción SQL encuentra el precio del producto más barato:
```SQL
SELECT MIN(Price) AS SmallestPrice
FROM Products;
```
- La función **MAX ()** devuelve el valor más grande de la columna seleccionada.    
La siguiente instrucción SQL encuentra el precio del producto más caro:
```SQL
SELECT MAX(Price) AS LargestPrice
FROM Products;
```
- La función **LENGTH ()** devuelve la longitud de una cadena (en bytes).   
La siguiente intrucción devuelve la longitud del texto en la columna "CustomerName", en bytes:
```SQL
SELECT LENGTH(CustomerName) AS LengthOfName
FROM Customers;
```
- La función **REPLACE ()** reemplaza todas las apariciones de una subcadena dentro de una cadena, con una nueva subcadena.
La siguiente instrucción remplaza "X" por "M".
```SQL
SELECT REPLACE("XYZ FGH XYZ", "X", "M");
```
  **Nota:** Esta función realiza un reemplazo entre mayúsculas y minúsculas.

- La función **CONCAT ()** agrega dos o más expresiones juntas.   
La siguiente instrución agrega tres columnas en la columna "Dirección":
```sql
SELECT CONCAT(Address, " ", PostalCode, " ", City) AS Address
FROM Customers;  
```
- La función **ROUND ()** redondea un número a un número especificado de posiciones decimales.    
La siguiente instrucción redondea la columna Precio (a un decimal) en la tabla "Productos":
```sql
SELECT ProductName, Price, ROUND(Price, 1) AS RoundedPrice
FROM Products;
```
- La función **COALESCE ()** devuelve el primer valor no nulo en una lista.   
La siguiente instrucción nos muestra en movil de los profesores y en caso de que ese profesor no tenga movil pone el movil del centro que es 7884 15458 6878 .
```sql
SELECT nombre, COALESCE(movil,'7884 15458 6878') AS movil
FROM profesor;
```
#### OPERADORES DE SELECT
- El operador **UNION** se usa para combinar el conjunto de resultados de dos o más instrucciones SELECT.   
La siguiente instrucción SQL devuelve las ciudades de la tabla "Clientes" y "Proveedores"(sin repetir los valores):
```SQL
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;
```     
**NOTA**:
  - Cada instrucción SELECT dentro de UNION debe tener el mismo número de columnas.
  - Las columnas también deben tener tipos de datos similares.
  - Las columnas en cada instrucción SELECT también deben estar en el mismo orden.
### FROM
La intruccion FROM se utiliza para indicar en que tabla o tablas se encuentran los atributos que selecionamos con en SELECT.
```SQL
SELECT column1, column2, ...
FROM table_name;
```
Aquí, table_name es el nombre de la tabla en la que se encuentra la columnas column1, column2.
### WHERE
La cláusula WHERE se usa para filtrar registros.
```SQL
SELECT *
FROM Customers
WHERE Country='Mexico';
```
En esta instrucción SQL selecciona a todos los clientes del país "México", en la tabla "Customers".
#### OPERADORES DE WHERE
- El operador **IN** es una abreviatura para múltiples condiciones OR.  
La siguiente instrucción SQL selecciona a todos los clientes que se encuentran en "Germany", "France" o "UK":
```SQL
SELECT *
FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');
```

- El operador **LIKE** se usa para buscar un patrón específico en una columna.  
Hay dos comodines que se usan con frecuencia junto con el operador LIKE:
  - %: El signo de porcentaje representa cero, uno o varios caracteres.
  - _ - El guión bajo representa un solo carácter.

  La siguiente instrucción SQL selecciona a todos los clientes con un CustomerName que comienza con "a":
```SQL
  SELECT *
  FROM Customers
  WHERE CustomerName LIKE 'a%';
  ```
- El operador **BETWEEN** selecciona valores dentro de un rango dado. Los valores pueden ser números, texto o fechas.   
La siguiente instrucción SQL selecciona todos los productos con un precio BETWEEN  10 y 20:
```SQL
SELECT *
FROM Products
WHERE Price BETWEEN 10 AND 20;
```
- Los operadores **<, >, = o <>(diferente)** se utilzan para comparar datos de las tablas.
En la siguiente insturcción filtramos para que solo aparezacan los paises con más de 200000000 habitantes.
```sql
SELECT nombre
FROM world
WHERE population > 200000000;
```
- Los operadores **AND** y **OR** se utilizan para filtrar registros en función de más de una condición:
  - El operador **AND** muestra un registro si todas las condiciones separadas por AND son verdaderas.    
  La siguiente instrucción SQL selecciona todos los campos de "Clientes" donde el país es "Alemania" Y la ciudad es "Berlín":
  ```sql
  SELECT *
  FROM Customers
  WHERE Country='Germany' AND City='Berlin';
  ```
  - El operador **OR** muestra un registro si alguna de las condiciones separadas por OR es verdadera.  
  La siguiente instrucción SQL selecciona todos los campos de "Clientes" donde la ciudad es "Berlín" O "München":
  ```sql
  SELECT *
  FROM Customers
  WHERE City='Berlin' OR City='München';
  ```
- El operador **NOT** muestra un registro si la (s) condición (es) NO ES verdadera.   
La siguiente instrucción SQL selecciona todos los campos de "Clientes" donde el país NO es "Alemania":
```sql
SELECT *
FROM Customers
WHERE NOT Country='Germany';
```
### ORDER BY
La palabra clave ORDER BY ordena los registros en orden ascendente de forma predeterminada. Para ordenar los registros en orden descendente, use la palabra clave DESC.   
La siguiente instrucción SQL selecciona a todos los clientes de la tabla "Clientes", ordenados por la columna "País":
```sql
SELECT *
FROM Customers
ORDER BY Country;
```
### GROUP BY
La instrucción GROUP BY agrupa filas que tienen los mismos valores en filas de resumen, como "buscar el número de clientes en cada país".
La instrucción GROUP BY a menudo se usa con funciones agregadas (COUNT, MAX, MIN, SUM, AVG) para agrupar el conjunto de resultados por una o más columnas.  
La siguiente instrucción SQL enumera el número de clientes en cada país:
```SQL
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;
```
### HAVING
La cláusula HAVING se agregó a SQL porque la palabra clave WHERE no se pudo usar con funciones agregadas.   
La siguiente instrucción SQL enumera el número de clientes en cada país. Solo incluya países con más de 5 clientes:
```SQL
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;
```

### LIMIT
La cláusula LIMIT se utiliza para especificar el número de registros que se devolverán.   
Supongamos que deseamos seleccionar todos los registros del 1 al 30 (inclusive) de una tabla llamada "Pedidos". La consulta SQL se vería así:
```SQL
SELECT *
FROM Orders
LIMIT 30;
```
### JOIN
Una cláusula JOIN se usa para combinar filas de dos o más tablas, en función de una columna relacionada entre ellas.    
Veamos una selección de la tabla "Pedidos":   
![Tabla1](1.PNG)    
Luego, mire una selección de la tabla "Clientes":
   ![Tabla2](2.PNG)   
   Observe que la columna "CustomerID" en la tabla "Pedidos" se refiere al "CustomerID" en la tabla "Clientes". La relación entre las dos tablas anteriores es la columna "CustomerID".   
   Luego, podemos crear la siguiente instrucción SQL (que contiene una UNIÓN INTERNA), que selecciona registros que tienen valores coincidentes en ambas tablas:
```SQL
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
```
y producirá algo como esto:   
![Tabla3](3.PNG)
### INER JOIN
La palabra clave **INNER JOIN** selecciona registros que tienen valores que coinciden en ambas tablas.    
La siguiente instrucción SQL selecciona todos los pedidos con información del cliente:
```SQL
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
```

**Nota:** La palabra clave INNER JOIN selecciona todas las filas de ambas tablas siempre que haya una coincidencia entre las columnas. Si hay registros en la tabla "Pedidos" que no tienen coincidencias en "Clientes", ¡estos pedidos no se mostrarán!

### LEFT JOIN
La palabra clave **LEFT JOIN** devuelve todos los registros de la tabla izquierda (tabla1) y los registros coincidentes de la tabla derecha (tabla2). El resultado es NULL desde el lado derecho, si no hay coincidencia.   
La siguiente instrucción SQL seleccionará a todos los clientes y cualquier pedido que puedan tener:
```SQL
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
```   

**Nota:** La palabra clave LEFT JOIN devuelve todos los registros de la tabla izquierda (Clientes), incluso si no hay coincidencias en la tabla derecha (Pedidos).
### RIGHT JOIN
La palabra clave **RIGHT JOIN** devuelve todos los registros de la tabla derecha (tabla2) y los registros coincidentes de la tabla izquierda (tabla1). El resultado es NULL desde el lado izquierdo, cuando no hay coincidencia.    
The following SQL statement will return all employees, and any orders they might have placed:
```SQL
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;
```

**Nota:** La palabra clave RIGHT JOIN devuelve todos los registros de la tabla derecha (Empleados), incluso si no hay coincidencias en la tabla izquierda (Pedidos).
### SUBCONSULTAS
Una subconsulta es una consulta anidada en una instrucción SELECT, INSERT, UPDATE o DELETE, o bien en otra subconsulta. Las subconsultas se pueden utilizar en cualquier parte en la que se permita una expresión.    
En este ejemplo, se utiliza una subconsulta para selecionar los países con  más poblacion que Rusia.
```SQL
SELECT nombre
FROM world
WHERE population >
     (SELECT poblacion FROM world
      WHERE nombre='Rusia');
```
### CASE
La cláusula **CASE**  permite devolver diferentes valores en diferentes condiciones.
Si no hay condiciones coincidentes (y no hay ELSE), se devuelve NULL.   
El siguiente SQL ordenará a los clientes por ciudad. Sin embargo, si la ciudad es NULL, entonces se ordenaran por país:
```SQL
SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);
```
## SUBLENGUAJES DE SQL
Del SQL se derivan sublenguajes los cuales son utilizados para la manipulación, definición y control de la información o estructura de una base de datos relacional. Estos sublenguajes son:

  - **DDL** (DATA DEFINITION LANGUAGE) ⇒ Create, Alter, Drop
  - **DML** (DATA MANIPULATION LANGUAGE) ⇒ Insert, Update, Delete
  - **DCL** ( DATA CONTROL LANGUAGE) ⇒ Revoke, Audit, Comment
  - **TCL** (TRANSACTION CONTROL LANGUAGE) ⇒ Commit, Rollback
  - **DQL** (DATA QUERY LANGUAGE) ⇒ Select
  - **SFL** (SESSION CONTROL LANGUAGE) ⇒ Alter
## AGRADECIMIENTOS
**Adrián Iglesias Fernández**

**Alejandro Becerra Suarez**
