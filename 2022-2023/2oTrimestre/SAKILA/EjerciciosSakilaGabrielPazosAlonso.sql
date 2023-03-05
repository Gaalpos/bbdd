
## 1. Actores que tienen de primer nombre ‘Scarlett’.
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Scarlett';


## 2. Actores que tienen de apellido ‘Johansson’.
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name = 'Johansson';


## 3. Actores que contengan una ‘O’ en su nombre.

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name LIKE '%o%' OR last_name LIKE '%o%';




## 4. Actores que contengan dos ‘O’ en su nombre y en una ‘A’ en su apellido.
SELECT *
FROM actor
WHERE (first_name LIKE '%O%O%' AND last_name LIKE '%A%');


## 5. Listar las ciudades con nombres compuestos.
SELECT city
FROM city
WHERE city LIKE '% %';


## 6. Listar las películas con una duración entre 80 y 100.
SELECT title, length
FROM film
WHERE length BETWEEN 80 AND 100;


## 7. Mostrar las ciudades del country Spain (consulta multitabla).
SELECT city.city
FROM city
INNER JOIN country
ON city.country_id = country.country_id
WHERE country.country = 'Spain';



## 8. Mostrar el nombre de la película y el nombre de los actores que participan en ella.
SELECT film.title, actor.first_name, actor.last_name
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON film_actor.actor_id = actor.actor_id;


## 9. Mostrar el country, la ciudad y dirección de cada miembro del staff.
SELECT s.staff_id, s.first_name, s.last_name, a.address, a.district, c.city, co.country
FROM staff s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id;

## 10. Mostrar el country, la ciudad y dirección de cada customer.
SELECT c.customer_id, c.first_name, c.last_name, a.address, a.district, cty.city, ctr.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city cty ON a.city_id = cty.city_id
JOIN country ctr ON cty.country_id = ctr.country_id;

## 11. Direcciones de california que tengan ‘274’ en el número de teléfono
SELECT a.address, a.district, c.city, co.country, a.phone
FROM address a
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
WHERE a.phone LIKE '%274%' AND c.city = 'California';


## 12. Películas ‘Épicas’ (Epic) o ‘Brillantes’ (brilliant) que duren más de 180 minutos
SELECT f.title, f.description, f.length
FROM film f
WHERE (f.title LIKE '%Epic%' OR f.title LIKE '%Brilliant%') AND f.length > 180;


## 13. Películas que duren entre 100 y 120 minutos o entre 50 y 70 minutos
SELECT title, length
FROM film
WHERE (length BETWEEN 100 AND 120) OR (length BETWEEN 50 AND 70);

## 14. Películas que cuesten 0.99, 2.99 y tengan un rating ‘g’ o ‘r’ y que hablen de cocodrilos
##(cocodrile)
SELECT title, rental_rate, rating 
FROM film 
WHERE rental_rate IN (0.99, 2.99) 
AND (rating = 'G' OR rating = 'R') 
AND description LIKE '%cocodrile%';



## 15. Direcciones de Ontario o de Punjab o que su código postal acabe en 5 o que su teléfono
##acabe en 5

SELECT *
FROM address
WHERE (province = 'Ontario' OR province = 'Punjab')
OR postal_code LIKE '%5'
OR phone LIKE '%5';

## 16. Alquileres con un pago por encima de la media
SELECT rental_id, rental_date, amount
FROM rental
WHERE amount > (SELECT AVG(amount) FROM rental);


 ## 17. Actores que no han trabajado en películas con rating ‘R’
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id NOT IN (
    SELECT DISTINCT film_actor.actor_id
    FROM film_actor
    JOIN film ON film.film_id = film_actor.film_id
    WHERE film.rating = 'R'
);


##18. Mostrar la categoría con menos películas
SELECT category.name, COUNT(*) as count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY count ASC
LIMIT 1;


## 19. Películas en las que han trabajado más de 10 actores
SELECT film.title, COUNT(*) as actor_count
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id
HAVING actor_count > 10;



##21. El título de la película que más se ha alquilado (en número de alquileres)
SELECT film.title, COUNT(*) as rental_count
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.film_id
ORDER BY rental_count DESC
LIMIT 1;

## 22. El título de la película que más dinero ha dado (en suma de importe)\
SELECT film.title, SUM(payment.amount) as total_amount
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.film_id
ORDER BY total_amount DESC
LIMIT 1;


##23. Los 5 actores que han trabajado en menos películas
SELECT actor.first_name, actor.last_name, COUNT(*) as film_count
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY film_count ASC
LIMIT 5;



##24. La referencia para los clientes es las dos primeras letras de su nombre y las dos primeras letras de su apellido.
ALTER TABLE customer
ADD COLUMN reference VARCHAR(4);

UPDATE customer
SET reference = CONCAT(SUBSTR(first_name, 1, 2), SUBSTR(last_name, 1, 2));


##25. Hacer una consulta que nos muestre el id del cliente y esa referencia.
SELECT customer_id, CONCAT(SUBSTR(first_name, 1, 2), SUBSTR(last_name, 1, 2)) AS reference
FROM customer;

##26. Listar todos los pagos que se han hecho un viernes.
SELECT *
FROM payment
WHERE DAYOFWEEK(payment_date) = 6;

##27. Clientes que no han alquilado documentales (‘documentary’)
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category cat ON fc.category_id = cat.category_id
    WHERE r.customer_id = c.customer_id
    AND cat.name = 'Documentary'
);
