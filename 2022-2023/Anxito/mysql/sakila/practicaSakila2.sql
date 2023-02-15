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

#7

SELECT fc.category_id AS "Código cateogría",ca.name AS "Categoría",COUNT(*) AS "Alquileres"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id) JOIN rental r USING(customer_id) JOIN inventory i USING(inventory_id) JOIN film_category fc USING(film_id) JOIN category ca USING(category_id)
WHERE co.country='SPAIN'
GROUP BY fc.category_id
ORDER BY 3 DESC;

#8

SELECT ac.actor_id,CONCAT(ac.first_name," ",ac.last_name) as "Nombre",COUNT(*) AS "Alquileres"
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id) JOIN rental r USING(customer_id) JOIN inventory i USING(inventory_id) JOIN film_actor fa USING(film_id) JOIN actor ac USING(actor_id)
WHERE co.country='ARGENTINA'
GROUP BY ac.actor_id
ORDER BY 3 DESC 
LIMIT 10;

#9

SELECT f.title AS "Título",COUNT(*) AS "Alquileres"
FROM actor a JOIN film_actor fa USING(actor_id) JOIN film f USING(film_id)  JOIN inventory i USING(film_id) JOIN rental r USING(inventory_id)
WHERE a.first_name="SANDRA" AND a.last_name="KILMER"
GROUP BY i.film_id
ORDER BY 2 DESC
LIMIT 1;

#MEJORA DE LA CONSULTA PARA QUE SAQUE PELÍCULAS CON EL MISMO NÚMERO DE ALQUILERES


SELECT f.title AS "Título",COUNT(*) AS "Alquileres"
FROM actor a JOIN film_actor fa USING(actor_id) JOIN film f USING(film_id)  JOIN inventory i USING(film_id) JOIN rental r USING(inventory_id)
WHERE a.first_name="SANDRA" AND a.last_name="KILMER"
GROUP BY i.film_id
HAVING COUNT(*)=(SELECT COUNT(*)
FROM actor a JOIN film_actor fa USING(actor_id)   JOIN inventory i USING(film_id) JOIN rental r USING(inventory_id)
WHERE a.first_name="SANDRA" AND a.last_name="KILMER"
GROUP BY i.film_id
ORDER BY 1 DESC
LIMIT 1)
ORDER BY 2 DESC;


#10 - 11
SELECT AVG(f.length) AS "duracion"
FROM rental r JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
WHERE return_date IS NULL;

SELECT AVG(peliculas.duracion) AS "Duración media alquiladas"
FROM
(SELECT DISTINCT(f.film_id),f.length AS "duracion"
FROM rental r JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
WHERE return_date IS NULL) peliculas;

#12

SELECT i.store_id,COUNT(*) AS "Alquileres infantil"
FROM rental r JOIN inventory i USING(inventory_id) JOIN film_category fc USING(film_id) JOIN category ca USING(category_id)
WHERE ca.name="CHILDREN" AND YEAR(r.rental_date)=2005 AND MONTH(r.rental_date) IN (8,9)
GROUP BY i.store_id
ORDER BY 2 DESC;

SELECT i.store_id,COUNT(*) AS "Alquileres infantil"
FROM rental r JOIN inventory i USING(inventory_id) JOIN film_category fc USING(film_id) JOIN category ca USING(category_id)
WHERE ca.name="CHILDREN" AND r.rental_date BETWEEN '2005-08-01' AND '2005-09-30'
GROUP BY i.store_id
ORDER BY 2 DESC;

#13

SELECT s.staff_id,c.city,st.store_id,cit.city
FROM staff s JOIN address a USING(address_id) JOIN city c USING(city_id) JOIN store st USING(store_id) JOIN address ad ON st.address_id=ad.address_id JOIN city cit ON ad.city_id=cit.city_id
WHERE c.city_id=cit.city_id;

#14
SELECT customer_id,first_name,last_name,SUM(amount)
FROM payment JOIN customer USING(customer_id)
GROUP BY customer_id
ORDER BY 4 DESC
LIMIT 10;

#15

SELECT f.title,SUM(p.amount)
FROM film f JOIN inventory i USING(film_id) JOIN rental r USING(inventory_id) JOIN payment p USING(rental_id)
GROUP BY f.film_id
ORDER BY 2 DESC LIMIT 10;















