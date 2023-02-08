#1
SELECT fa.actor_id AS ID, CONCAT(a.first_name," ",a.last_name) AS Nombre,COUNT(*) AS "Numero de peliculas" 
FROM film_actor fa JOIN actor a USING(actor_id)
GROUP BY fa.actor_id
ORDER BY 3 DESC LIMIT 10;

#2
SELECT *
FROM film
