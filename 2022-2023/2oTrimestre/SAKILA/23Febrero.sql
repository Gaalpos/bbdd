## Obtén los actores que han trabajado en todas las películas en las que ha trabajado Christopher West
select fa.film_id
from actor a join film_actor fa using (actor_id)
where first_name="Christopher" and last_name="WEST";

## Clientes con más películas alquiladas que alguno de los clientes que empiezan por ‘A’
select *
from

