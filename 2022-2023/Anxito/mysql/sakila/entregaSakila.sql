#1  Actores que tienen de primer nombre ‘Scarlett’.
SELECT CONCAT(first_name," ",last_name) as nombre
FROM actor
where first_name='Scarlett' ;

#2  Actores que tienen de apellido ‘Johansson’.
SELECT CONCAT(last_name) as apellido
FROM actor
where last_name='Johansson' ;

#3 Actores que contengan una ‘O’ en su nombre.
SELECT CONCAT(first_name," ",last_name) as nombre
FROM actor



#5
SELECT city
FROM city
WHERE city LIKE "% %"
 
