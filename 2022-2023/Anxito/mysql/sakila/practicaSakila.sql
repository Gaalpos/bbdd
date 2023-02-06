##1
SELECT CONCAT(c.first_name," ",c.last_name) AS Nombre,ci.city AS Ciudad
FROM customer c JOIN address a ON c.address_id=a.address_id JOIN city ci USING(city_id)
WHERE first_name='JUDY' AND last_name='GRAY';
##2
SELECT COUNT(DISTINCT co.country_id) AS "PAISEES CLIENTES"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id);


SELECT COUNT(DISTINCT co.country_id) AS "PAISEES CLIENTES"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE c.customer_ID is NULL;

##3
SELECT COUNT(*) AS "Clientes egipcios"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country ='EGYPT';

SELECT COUNT(*) AS "Clientes egipcios", GROUP_CONCAT(CONCAT(city) separator ',')
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country ='EGYPT';

##4
SELECT DISTINCT ci.city_id,ci.city, COUNT(*)
FROM customer c JOIN address a USING(address_id) 
JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country ='EGYPT'
GROUP BY ci.city_id;

SELECT DISTINCT ci.city_id,ci.city, COUNT(*)
FROM customer c JOIN address a USING(address_id) 
JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE country ='EGYPT'
GROUP BY ci.city_id;

##5
SELECT COUNT(*) AS "Clientes no americanos"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE co.country<>'UNITED STATES'



