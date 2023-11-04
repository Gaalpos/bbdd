#25

SELECT DISTINCT c.customer_id,c.first_name,c.last_name,c.email
FROM customer c JOIN rental r USING(customer_id) JOIN inventory i USING(inventory_id) JOIN film f USING(film_id) JOIN film_category fc USING(film_id) JOIN category ca USING(category_id)
WHERE ca.name='ACTION'
ORDER BY 1;

SELECT DISTINCT c.first_name,c.last_name,c.email,COUNT(*) AS "Copias de acción alquiladas"
FROM customer c JOIN rental r USING(customer_id) JOIN inventory i USING(inventory_id) JOIN film f USING(film_id) JOIN film_category fc USING(film_id) JOIN category ca USING(category_id)
WHERE ca.name='ACTION'
GROUP BY c.customer_id;



#26

SELECT f.title,c.name,pelis_por_categoria.pelis AS "Películas categoría"
FROM film f JOIN film_category fc USING(film_id) JOIN category c USING(category_id) JOIN (SELECT category_id AS categoria,COUNT(*) AS pelis FROM film_category GROUP BY category_id) AS pelis_por_categoria ON fc.category_id=pelis_por_categoria.categoria;


SELECT f.title,fc.category_id AS categoria,c.name,
(SELECT COUNT(*) 
FROM film_category fc2 
GROUP BY category_id 
HAVING category_id=categoria) AS pelis_categoria
FROM film f JOIN film_category fc USING(film_id) JOIN category c USING(category_id);

#27

SELECT c.customer_id,ROUND(AVG(p.amount),2)
FROM customer c JOIN payment p USING(customer_id)
GROUP BY  c.customer_id;

#28

SELECT customer_id AS cod_cliente,amount
FROM payment p
WHERE amount>(SELECT AVG(amount) FROM payment p2 WHERE p2.customer_id=p.customer_id)

