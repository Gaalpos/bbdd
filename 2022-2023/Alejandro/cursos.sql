SELECT * FROM aaaejemplo.cursos;
INSERT INTO cursos values (4, 'PASI');

SELECT *
FROM Alumnos JOIN cursos USING (codCurso);

#listar todos los cursos y los alumnos 
SELECT *
FROM cursos LEFT JOIN Alumnos USING (codCurso);

SELECT *
FROM Alumnos RIGHT JOIN Cursos USING (codCurso)
WHERE dni IS NULL;