# - ¿Dónde vive JUDY GRAY?
select concat(c.first_name, " ",c.last_name) as Nombre, ci.city as ciudad 
from customer c 
join address a on c.address_id=a.address_id  join city ci using (city_id)
where first_name='JUDY' and last_name='GRAY';

# - ¿En cuántos países viven nuestros clientes? (países distintos)
select count(distinct co.country_id) as "PAISES CLIENTES"
from customer c join address a using(address_id) 
join city ci using(city_id) join country co using(country_id);

select count(distinct co.country_id) as "PAISES CLIENTES"
from customer c join address a using(address_id) 
join city ci using(city_id) join country co using(country_id);

# - ¿Cuántos clientes viven en Egipto?
select *
from customer c join address a using(address_id) join city ci using(city_id) join country co using (country_id)
where country='EGYPT';

select distinct ci.city
from customer c join address a using(address_id) join city ci using(city_id) join country co using (country_id)
where country='EGYPT';

