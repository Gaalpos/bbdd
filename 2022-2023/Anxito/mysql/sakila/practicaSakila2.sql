#1
SELECT fa.actor_id AS ID,CONCAT(a.first_name," ",a.last_Name) AS Nombre,COUNT(*) AS "Número de películas" FROM film_actor fa JOIN actor a USING(actor_id)
GROUP BY fa.actor_id
ORDER BY 3 DESC LIMIT 10;

#2

SELECT c.first_name,c.last_name,co.country
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
WHERE co.country LIKE 'S%';

#3
SELECT co.country AS "País",COUNT(c.customer_id) AS "Número de clientes"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id)
GROUP BY co.country_id
ORDER BY 2 DESC
LIMIT 10;

#4 

SELECT f.title,COUNT(i.inventory_id) AS "Núm copias"
FROM film f JOIN inventory i USING(film_id)
GROUP BY f.title
ORDER BY 2 DESC
LIMIT 10;

#5

SELECT f.film_id,f.title,COUNT(*)
FROM customer c JOIN rental r USING(customer_id) JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
WHERE first_name='DEBORAH' AND last_name='WALKER'
GROUP BY f.film_id;

SELECT DISTINCT f.film_id
FROM customer c JOIN rental r USING(customer_id) JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
WHERE first_name='DEBORAH' AND last_name='WALKER';

#6

SELECT c.customer_id,CONCAT(c.first_name," ",c.last_name) AS "Nombre cliente",SUM(p.amount) AS Total
FROM customer c JOIN rental r USING(customer_id) JOIN payment p USING(rental_id)
GROUP BY c.customer_id
ORDER BY 3 DESC
LIMIT 10;
