# 1- Realizar una consulta que me muestre toda las columnas de la tabla de productos
SELECT *
FROM products;

# 2- Realizar una consulta que me muestre el código, el nombre y el precio del 
#producto
SELECT ProductName, ProductID, UnitPrice
FROM products;

#3- Realizar una consulta que me muestre el código, nombre y la categoría de los 
#productos que estén entre 18.00 y 20.00

SELECT ProductId, ProductName, CategoryName
FROM products p JOIN Categories c USING(categoryID) 
WHERE unitPrice between 18.000 and 20.000;

# 4- Realiza una consulta que permita presentar la fecha actual mediante una función


#5- Realiza una consulta que permita presentar los apellidos de los empleados en 
#minúscula
SELECT LOWER(LastName)
FROM employees;


#6- Realiza una consulta que permita presentar los apellidos de los empleados en 
#mayúscula
SELECT UPPER(LastName)
FROM employees;

#7- Realiza una consulta que permita presentar las tres primeras letras del nombre de 
#los empleados
SELECT FirstName, SUBSTRING(FirstName, 1, 3)
FROM employees;

#8- Realiza una consulta que permita presentar el nombre y apellido, y un correo 
#electrónico de los empleados, éste deberá tener los siguientes datos:
#a. La primera letra del nombre, seguida del apellido
#b. El correo deberá presentarse en minúscula

SELECT   firstname, lastName
FROM employees; 






