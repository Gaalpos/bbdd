use ExamenGabrielPazosAlonso;

create table if not exists Peliculas(
id int primary key auto_increment,
Titulo varchar(50),
Director varchar(50),
Sinopsis text);


alter table Peliculas
add fulltext (titulo);

alter table Peliculas
add fulltext (Director);

alter table Peliculas
add fulltext (Sinopsis);

alter table Peliculas
add fulltext (titulo,sinopsis);

alter table Peliculas
add fulltext (director,sinopsis);

select *
from peliculas
where match(titulo,sinopsis) against('period*' IN BOOLEAN MODE);

select *
from peliculas
where match (titulo, sinopsis) against ('campeón del mundo');

select*
from peliculas
where match(titulo,sinopsis) against('director' with query expansion);

select *
from peliculas
where match(titulo,sinopsis) AGAINST('+director -guerra' IN BOOLEAN MODE);