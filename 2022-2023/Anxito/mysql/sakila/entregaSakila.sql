#1  Actores que tienen de primer nombre ‘Scarlett’.
SELECT CONCAT(first_name," ",last_name) as nombre
FROM 
	actor
where 
	first_name='Scarlett' ;

#2  Actores que tienen de apellido ‘Johansson’.
SELECT *
	
FROM 
	actor
where 
	last_name='Johansson' ;

#3. Actores que contengan una ‘O’ en su nombre.

SELECT
    CONCAT(first_name, ' ', last_name) AS name
FROM
    actor a
WHERE
    first_name LIKE '%O%';

#4. Actores que contengan dos ‘O’ en su nombre y en una ‘A’ en su apellido.

SELECT
    CONCAT(first_name, ' ', last_name) AS name
FROM
    actor a
WHERE
    first_name LIKE '%O%O%'
        AND last_name LIKE '%A%';


#5. Listar las ciudades con nombres compuestos.

SELECT
    city
FROM
    city
WHERE
    city LIKE '% %';


#6. Listar las películas con una duración entre 80 y 100.

SELECT
    title, length
FROM
    film
WHERE
    length LIKE '8%' OR length LIKE '9%';

#7. Mostrar las ciudades del country Spain (consulta multitabla).

SELECT
    city, co.country
FROM
    city c
        JOIN
    country co USING (country_id)
WHERE
    country = 'Spain';


#8. Mostrar el nombre de la película y el nombre de los actores que participan en ella.

SELECT
    a.first_name, f.title
FROM
    film f
        JOIN
    film_actor fa USING (film_id)
        JOIN
    actor a USING (actor_id)
WHERE
    f.film_id = fa.film_id
        AND a.actor_id = fa.actor_id;


#9. Mostrar el country, la ciudad y dirección de cada miembro del staff.

SELECT
    CONCAT(s.first_name, ' ', s.last_name) AS name,
    co.country,
    c.city,
    a.address
FROM
    staff s
        JOIN
    address a USING (address_id)
        JOIN
    city c USING (city_id)
        JOIN
    country co USING (country_id);
#10. Mostrar el country, la ciudad y dirección de cada customer.

SELECT
    CONCAT(cu.first_name, ' ', cu.last_name) AS name,
    co.country,
    c.city,
    a.address
FROM
    customer cu
        JOIN
    address a USING (address_id)
        JOIN
    city c USING (city_id)
        JOIN
    country co USING (country_id);

#11. Direcciones de california que tengan ‘274’ en el número de teléfono

SELECT
    address
FROM
    address a
        JOIN
    city c USING (city_id)
WHERE
    a.district LIKE 'california'
        AND a.phone LIKE '%274%';


#12. Películas ‘Épicas’ (Epic) o ‘Brillantes’ (brilliant) que duren más de 180 minutos

SELECT
    title
FROM
    film f
        JOIN
    film_category fa USING (film_id)
        JOIN
    category ca USING (category_id)
WHERE
    f.length <= 180 AND ca.name LIKE 'Epic'
        OR ca.name LIKE 'brilliant';


#13. Películas que duren entre 100 y 120 minutos o entre 50 y 70 minutos

SELECT
    title, length
FROM
    film
WHERE
    length LIKE '10%' OR length LIKE '11%'
        OR length LIKE '5%'
        OR length LIKE '7%'
ORDER BY length;

#14 Películas que cuesten 0.99, 2.99 y tengan un rating ‘g’ o ‘r’ y que hablen de cocodrilos (cocodrile)
SELECT
    *
FROM
    film
        JOIN
    film_category ON film.film_id = film_category.film_id
        JOIN
    category ON film_category.category_id = category.category_id
WHERE
    (rental_rate = 0.99 OR rental_rate = 2.99)
        AND (rating = 'G' OR rating = 'R')
        AND (category.name LIKE '%Crocodile%');
#15 Direcciones de Ontario o de Punjab o que su código postal acabe en 5 o que su teléfono acabe en 5
SELECT
    *
FROM
    address
WHERE
    (city_id IN (SELECT
            city_id
        FROM
            city
        WHERE
            city = 'Ontario' OR city = 'Punjab'))
        OR (phone LIKE '%5')
        OR (postal_code LIKE '%5');
#16. Alquileres con un pago por encima de la media
SELECT
    title, amount
FROM
    film
        JOIN
    inventory USING (film_id)
        JOIN
    rental USING (inventory_id)
        JOIN
    payment USING (rental_id)
WHERE
    amount > (SELECT
            AVG(amount)
        FROM
            payment);
#17 Actores que no han trabajado en películas con rating ‘R’
SELECT
    *
FROM
    actor
WHERE
    actor_id NOT IN (SELECT
            actor_id
        FROM
            film_actor
                JOIN
            film ON film.film_id = film_actor.film_id
        WHERE
            rating = 'R');
#18. Mostrar la categoría con menos películas
SELECT
    c.name categoria, COUNT(*) "numero de peliculas"
FROM
    category c
        JOIN
    film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id
ORDER BY COUNT(*) ASC
LIMIT 1;
#19 Películas en las que han trabajado más de 10 actores
SELECT
    f.title titulo, COUNT(*) "numero de peliculas"
FROM
    film f
        JOIN
    film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id
HAVING COUNT(*) > 10;
#20. Películas en las que han trabajado más de 10 actores
/* colsulta realizada de otra forma porque Don Antonio asi lo pidio*/
SELECT
    COUNT(*) numero_peliculas, f.title titulo
FROM
    film f
        JOIN
    film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id
HAVING COUNT(*) > 10;
#21. El título de la película que más se ha alquilado (en número de alquileres)
SELECT
    film.title, COUNT(*) AS rental
FROM
    rental
        JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
        JOIN
    film ON inventory.film_id = film.film_id
GROUP BY film.film_id
ORDER BY rental_count DESC
LIMIT 1;
#22. El título de la película que más dinero ha dado (en suma de importe)
SELECT
    film.title, SUM(payment.amount) AS total_revenue
FROM
    payment
        JOIN
    rental ON payment.rental_id = rental.rental_id
        JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
        JOIN
    film ON inventory.film_id = film.film_id
WHERE
    payment.amount > 0
GROUP BY film.film_id
ORDER BY total_revenue DESC
LIMIT 1;
#23. Los 5 actores que han trabajado en menos películas
SELECT
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    COUNT(*) AS num_films
FROM
    actor AS a
        JOIN
    film_actor AS fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY num_films ASC
LIMIT 5;
#24. La referencia para los clientes es las dos primeras letras de su nombre y las dos primeras letras de su apellido.
SELECT
    CONCAT(LEFT(first_name, 2), LEFT(last_name, 2)) AS reference
FROM
    customer;
#25. Hacer una consulta que nos muestre el id del cliente y esa referencia.
SELECT
    customer_id,
    CONCAT(LEFT(first_name, 2), LEFT(last_name, 2)) AS reference
FROM
    customer;
#26 Listar todos los pagos que se han hecho un viernes.
SELECT
    *
FROM
    payment
WHERE
    DAYOFWEEK(payment_date) = 6;
#27 Clientes que no han alquilado documentales (‘documentary’)
SELECT first_name, last_name
FROM customer
WHERE customer_id NOT IN (SELECT customer_id
FROM customer JOIN rental USING (customer_id) JOIN inventory USING (inventory_id)JOIN film USING (film_id) JOIN
film_category USING (film_id) JOIN category USING (category_id)
WHERE name = 'Documentary');
 
