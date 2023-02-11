#1
SELECT CONCAT(c.first_name," ",c.last_name) AS Nombre,ci.city AS Ciudad 
FROM customer c JOIN address a ON c.address_id=a.address_id JOIN city ci USING(city_id) 
WHERE first_name='JUDY' AND last_name='GRAY';

#2
SELECT COUNT(DISTINCT co.country_id) AS "PAÍSES CLIENTES"
FROM customer c JOIN address a USING(address_id) 
JOIN city ci USING(city_id) JOIN country co USING(country_id);

#LA SIGUIENTE CONSULTA NO ESTÁ EN EL BOLETÍN, SACAMOS EL PAÍS SIN CLIENTES
SELECT co.country 
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) RIGHT JOIN country co USING(country_id)
WHERE c.customer_ID is NULL;

#3
SELECT COUNT(*) AS "Clientes egipcios"
FROM customer c JOIN address a USING(address_id) 
JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country='EGYPT';

#DUDA DE ELOY
SELECT COUNT(*) AS "Clientes egipcios",group_concat(concat(city) separator ',persona')
FROM customer c JOIN address a USING(address_id) 
JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country='EGYPT';

#4
SELECT DISTINCT ci.city
FROM customer c JOIN address a USING(address_id) 
JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country='EGYPT';

#5
SELECT COUNT(*) AS "Clientes no americanos"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE co.country<>'UNITED STATES';

#6
SELECT COUNT(*))FROM film WHERE length<=90;

#7
SELECT COUNT(*) FROM film f WHERE f.description LIKE "%ASTRONAUT%";

#8

SELECT * FROM film f WHERE f.description LIKE "%ASTRONAUT%" AND length<=90;

#9
SELECT title, length FROM film ORDER BY length DESC;

#10

SELECT first_name,last_name FROM customer;

SELECT CONCAT(first_name,'.',last_name,"@cebem.es") AS correoE
FROM customer;

SELECT LOWER(CONCAT(SUBSTRING(first_name,1,1),last_name,"@cebem.es")),active FROM customer;

#11

SELECT customer_id,first_name,last_name,email,active FROM customer;

#12

SELECT DISTINCT ci.city_id,ci.city,co.country
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)





