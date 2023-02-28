
## 1. Actores que tienen de primer nombre ‘Scarlett’.
select *
from actor where first_name='Scarlett';

## 2. Actores que tienen de apellido ‘Johansson’.
select *
from actor where last_name='Johansson';

## 3. Actores que contengan una ‘O’ en su nombre.

select *
from actor
where first_name like '%O%' or last_name like '%O%';



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

## 10. Mostrar el country, la ciudad y dirección de cada customer.

## 11. Direcciones de california que tengan ‘274’ en el número de teléfono
## 12. Películas ‘Épicas’ (Epic) o ‘Brillantes’ (brilliant) que duren más de 180 minutos
## 13. Películas que duren entre 100 y 120 minutos o entre 50 y 70 minutos
## 14. Películas que cuesten 0.99, 2.99 y tengan un rating ‘g’ o ‘r’ y que hablen de cocodrilos
##(cocodrile)
## 15. Direcciones de Ontario o de Punjab o que su código postal acabe en 5 o que su teléfono
##acabe en 5
## 16. Alquileres con un pago por encima de la media

 ## 17. Actores que no han trabajado en películas con rating ‘R’

##18. Mostrar la categoría con menos películas

## 19. Películas en las que han trabajado más de 10 actores
## 20. Películas en las que han trabajado más de 10 actores
##21. El título de la película que más se ha alquilado (en número de alquileres)
## 22. El título de la película que más dinero ha dado (en suma de importe)
##23. Los 5 actores que han trabajado en menos películas
##24. La referencia para los clientes es las dos primeras letras de su nombre y las dos primeras
##letras de su apellido.
##25. Hacer una consulta que nos muestre el id del cliente y esa referencia.
##26. Listar todos los pagos que se han hecho un viernes.
##27. Clientes que no han alquilado documentales (‘documentary’)