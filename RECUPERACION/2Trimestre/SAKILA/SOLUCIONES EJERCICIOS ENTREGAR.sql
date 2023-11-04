#PRÁCTICA A ENTEGAR SQL SOBRE SAKILA
#1
SELECT * FROM actor WHERE first_name='SCARLETT';
#2
SELECT * FROM actor WHERE last_name='JOHANSSON';
#3
SELECT * FROM actor WHERE first_name LIKE '%O%';
#4
SELECT * FROM actor WHERE first_name LIKE '%O%O%' AND last_name LIKE'%A%';
#5
SELECT * FROM city WHERE city LIKE '% %' OR city LIKE '%-%';
#6
SELECT * FROM film WHERE length BETWEEN 80 AND 100;
#7
SELECT ci.city
FROM country c JOIN city ci USING(country_id)
WHERE c.country='SPAIN';
#8
SELECT f.title,CONCAT(a.first_name,' ',a.last_name)
FROM film f JOIN film_actor fa USING(film_id) JOIN actor a USING(actor_id)
ORDER BY 1;

#SOLUCIÓN CON GROUP_CONCAT
SELECT f.film_id,f.title,group_concat(CONCAT(a.first_name,' ',a.last_name)) AS actores
FROM film f JOIN film_actor fa USING(film_id) JOIN actor a USING(actor_id)
GROUP BY f.film_id
ORDER BY 1;

#9
SELECT s.first_name,a.address,ci.city,co.country
FROM staff s JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id);

#10
SELECT CONCAT(c.first_name,' ',c.last_name),a.address,ci.city,co.country
FROM customer c JOIN address a USING(address_id) JOIN city ci USING(city_id) JOIN country co USING(country_id);

#11
SELECT a.address
FROM address a  WHERE a.district='CALIFORNIA' AND a.phone LIKE '%274%';

#12
SELECT *
FROM film WHERE length>180 AND (description LIKE '%EPIC%' OR description LIKE '%BRILLIANT%');

#13 

SELECT *
FROM film WHERE length BETWEEN 100 AND 120 OR length BETWEEN 50 AND 70;

#14
SELECT *
FROM film WHERE rental_rate IN (0.99,2.99) AND description LIKE '%CROCODILE%' AND rating IN ('r','g');

#15
SELECT * FROM address WHERE district IN ('Punjab','Ontario') OR phone LIKE '%5' OR postal_code LIKE '%5';

#16

SELECT r.rental_id,p.amount
FROM rental r JOIN payment p USING(rental_id) WHERE p.amount > (SELECT AVG(p2.amount) FROM payment p2);

SELECT rental_id,amount
FROM payment
WHERE amount>(SELECT AVG(p.amount) FROM payment p);

#17

SELECT ac.first_name,ac.last_name
FROM actor ac LEFT JOIN (SELECT DISTINCT a.actor_id AS codigoActorR
FROM actor a JOIN film_actor fa USING(actor_id) JOIN film f USING(film_id)
WHERE f.rating='r') actoresR ON ac.actor_id=actoresR.codigoActorR 
WHERE actoresR.codigoActorR IS NULL;

#18

SELECT name,category_id,COUNT(*)
FROM film_category fc JOIN category c USING(category_id)
GROUP BY category_id
ORDER BY 3 ASC
LIMIT 1;

#19_20

SELECT film_id,title,COUNT(*)
FROM film_actor JOIN film USING(film_id)
GROUP BY film_id
HAVING COUNT(*)>10;

#21
SELECT f.title
FROM rental r JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
GROUP BY f.film_id
ORDER BY COUNT(*) DESC 
LIMIT 1;

#22
SELECT f.title
FROM rental r JOIN inventory i USING(inventory_id) JOIN film f USING(film_id) JOIN payment p USING(rental_id)
GROUP BY f.film_id
ORDER BY SUM(p.amount) DESC 
LIMIT 1;

#23

SELECT a.first_name,a.last_name,COUNT(*)
FROM film_actor fa JOIN actor a USING(actor_id) 
GROUP BY fa.actor_id
ORDER BY 3 
LIMIT 5;

#24

SELECT CONCAT(SUBSTRING(first_name,1,2),SUBSTRING(last_name,1,2)) AS REF_CLI
FROM customer;

#25
SELECT customer_id,CONCAT(SUBSTRING(first_name,1,2),SUBSTRING(last_name,1,2)) AS REF_CLI
FROM customer;

#26
SELECT *
FROM payment 
WHERE DAYOFWEEK(payment_date)=6;

#27
SELECT * FROM customer WHERE customer_id NOT IN (
SELECT c.customer_id  
FROM customer c JOIN rental r USING(customer_id) JOIN inventory i USING(inventory_id) JOIN film f USING(film_id) JOIN film_category fc USING(film_id) JOIN category ca USING(category_id) WHERE
ca.name='Documentary');
