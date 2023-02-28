#1  Actores que tienen de primer nombre ‘Scarlett’.
SELECT f.film_id,f.title,COUNT(*)
FROM customer c JOIN rental r USING(customer_id) JOIN inventory i USING(inventory_id) JOIN film f USING(film_id)
WHERE first_name=''

#2  Actores que tienen de apellido ‘Johansson’.
