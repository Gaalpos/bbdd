SELECT* FROM aaaEjemplo.Alumnos;

SELECT *
FROM Cursos,alumnos
WHERE cursos.codCurso= alumnos.codCurso
ORDER BY cursos.nombre;

##Producto cartesiano
SELECT *
FROM Cursos, alumnos
WHERE cursos.CodCurso;

##COMPOSICION

SELECT *
FROM cursos INNER JOIN Alumnos ON alumnos.codCurso
= cursos.codcurso;

## la palabra INNER la asume por defecto

SELECT *
FROM cursos JOIN Alumnos ON alumnos.codCurso
= cursos.codcurso;

## cuando las columnas que relacionan las tablas tienen el mismo
## nombre se puede utilizar USING

SELECT *
FROM cursos JOIN Alumnos USING (codCurso);

## listar los alumnos matriculados en cada curso, indicando su nombre

SELECT Cursos.nombre, Alumnos.nombre
FROM curso JOIN Alumnos USING (codCursos);


