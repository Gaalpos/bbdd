# Apuntes del sublenguaje DML
## Índice
  - [Sentencias DML](#Sentencias-DML)
    - [INSERT](#INSERT)
    - [UPDATE](#UPDATE)
    - [DELETE](#DELETE)

  ## Sentencias DML
  Na linguaxe SQL hai 3 instrucións que compoñen o DML (* Data Manipulation Language*). Son aquelas frases que nos permiten manipular a información que almacenamos nas bases de datos.

  Existen 3 instrucións que nos permitirán inserir datos nunha táboa **(INSERT)** , modificar eses datos **(UPDATE)** e borralos **(DELETE)**.

  ### INSERT
A instrución **INSERT** permite engadir datos a unha táboa.

**FORMULA**
```sql
INSERT INTO <nombreDeLaTabla>
  (<atributo1>[, <atributo2>, <atributo3>...])
  VALUES (
  (<valor1>[, <valor2>, <valor3>...])
  ) || (
  SELECT <atributoX> FROM <tablaX> ...);
```

**EXEMPLO**
```sql
  INSERT INTO world
  [(name, continent, area)]
  VALUES
  ('SPAIN', 'EUROPE', 100),
  ('PORTUGAL','EUROPE', 10);
```
Como podemos observar na sentencia anterior engadimos dúas tuplas con os valores especificados en **VALUES**, como podemos observar podemos engadir máis de una tupla a vez sempre que sepáresmos as tuplas por coma.

   **Nota** : Os  valores numéricos non van entre comillas.

### UPDATE
A instrución **UPDATE** permite modificar datos.

**FORMULA**
```sql
UPDATE <nombreDeLaTabla>
SET <atributo1> = <valor1>,
    <atrubuto2> = <valor2>,
    ...3

    <atributoN> = <valorN>
[WHERE <predicado>];
```
**Nota** El WHERE es opcional

**EXEMPLO**
```sql
UPDATE world
SET continent = 'ASIA'
WHERE name = 'SPAIN'
OR name = 'PORTUGAL'
```
No  exemplo anterior engadimos  a tupla Spain e Portugal o novo valor de continente que seria Asia. Se non establecemos o WHERE modificaríanse todos os continentes de todas as tuplas.
### DELETE
A instrución **DELETE** serve para eliminar valores de algunhas tuplas ou hasta bases de datos.

**FORMULA**
```SQL
DELETE FROM <nombreDeLaTabla>
  WHERE <predicado>;
```
**Nota**: Se non utilizamos o WHERE eliminiaremos toda a taboa.

**EXEMPLO**
```SQL
DELETE FROM world
  WHERE continent = 'EUROPE';
```
No exemplo, eliminamos todas as tuplas que conteñan o valor de continente igual  a EUROPE.
