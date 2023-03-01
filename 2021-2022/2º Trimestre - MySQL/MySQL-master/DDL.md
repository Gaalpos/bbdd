# Data Definition Language
## Índice
  - [Detalles importantes](#detalles-importantes)
  - [O sublinguaxe DDL](#o-sublinguaxe-ddl)
    - [```CREATE```](#create)
      - [```CREATE (DATABASE|SCHEMA)```](#create-(databse|schema))

### Detalles importantes
  > Cando algo esta entre ```[]``` é opcional.    
  > Cando hai unha ```|``` significa OU.    
  > Recomendase evitar o uso de acentos e espazos nas expresións.

### O sublinguaxe DDL
O sublinguaxe SQL é usado para crear bases de datos, táboas, usuarios ou dominios. Tamén nos permite engadir atributos cun tipos de datos definidos, establecer restricións e establecer criterios nas táboas interrelacionadas. Chámase DDL porque significa linguaxe de definición de datos.

### ```CREATE```
- #### ```CREATE (DATABASE|SCHEMA)```
  Ambos dous teñen a mesma función, declarar a Base de Datos na que engadiremos as táboas, datos e restricións.
  Anque dependendo do xestor utilizado pode variar a función de cada un. En MySQL podemos usar os dous indistintamente. Sen embargo en PostgreSQL. ```ESCHEMA``` é usado como unha capa intermedia entre ```DATABASE``` e as táboas que a compoñen.  

    **FÓRMULA**
  ```SQL
  Create (DATABASE|SCHEMA)
         [IF NOT EXISTS] <nomeBD>
         [CHARACTER SET <nomeDoCharset>]
  ;
  ```
    > Con ```IF NOT EXISTS``` evitamos crear dúas bases de datos co mesmo nome.   
    >Con ```CHARACTER SET``` indicamos o CharSet que queremos usar, como UTF-8.

- #### ```CREATE DOMAIN```
Crearemos un dominio cando teñamos que repetir varias veces nunha BD o mesmo tipo de datos en distintos atributos. Ademais en caso de que tivésemos que modificalo, resulta moito mais sinxelo que ir atributo por atributo.

  **FÓRMULA**
  ```SQL
  CREATE DOMAIN <nomeDoDominio> <tipoDeDato>
                [NOT NULL]
                [CHECK (restrición)]
  ;
  ```
  **Parámetros opcionais**

    > Engadimos ```NOT NULL```  a fórmula se queremos evitar os valores nulos.     
    > Usaremos  ```CHECK``` cando precisemos engadir restricións.

- #### ```CREATE TABLE```
Para crear táboas usaremos a seguinte formula.
```SQL
CREATE TABLE [IF NOT EXISTS] <nomeDaTaboa> (
	     <nomeDoAtributo1> <tipoDeDato> [PRIMARY KEY],
	     <nomeDoAtributoN> <dominioN>   [DEFAULT <'expresion'>] [NOT NULL] [UNIQUE],

);
```
