# Tarea 7
## ○ Revisa inconsistencias en tu base de datos

La unica inconsistencia que identifique fue que ciertos clientes que tenian la columna de saldo como null, cuando deberia ser 0, esto podria traer problemas por lo que lo veo como una inconsistencia en la informacion que busco obtener.

El resto de inconsistencias o modificaciones posibles las intente arreglar desde la tarea 5 en la cual subi la informacion, pero por lo mismo de que era una cantidad grande de informacion, se procuro cuidar la integridad de la misma y la homologacion de formatos, tanto para cuidado de la misma como para evitar errores en cruces o operaciones, por ello no se hallaron mas inconsistencias.

## ○ Haz modificaciones o ajustes que faciliten la manipulacion de tu base de datos

1. Comenzando con arreglar la inconsistencia identificada, la cual especificaba que ciertos clientes tenian null en la columna saldo:

```sql
UPDATE abandono_bancario.cheques_debito
SET saldo = 0
WHERE saldo IS NULL;
```

2. Ahora quiero hacerle una adicion para una mejor homologacion de la informacion entre las 3 tablas, pues solo 2 cuentan con la fecha reporte de la informacion, me parece apropiado para la integridad de la informacion tambien incluir la fecha en la otra tabla faltante, tanto con el mismo formato como con el mismo nombre de columna:

```sql
ALTER TABLE abandono_bancario.creditos_colocacion
	ADD fecha_reporte DATE
		AFTER id_cliente;

UPDATE abandono_bancario.creditos_colocacion
SET fecha_reporte = '2025-04-30';
```

3. Ahora supongamos que el banco en aproximado quiere saber el ingreso despues de impuestos estimados por cliente/nivel cliente, entonces vamos a crear otra columna en la tabla de clientes para conocer su ingreso estimado despues de unos impuestos de en promedio 30%:

```sql
ALTER TABLE abandono_bancario.clientes_concentrado 
ADD column ingreso_neto_estimado FLOAT(255,4);

UPDATE abandono_bancario.clientes_concentrado 
SET ingreso_neto_estimado = (ingreso_estimado * 0.70);
```

## ○ Utiliza subconsultas para responder preguntas relevantes

1. Se quiere conocer el saldo de cheques de los clientes que cuentan con mas de 4 creditos activos

```sql
SELECT sum(t1.total) as saldo_total
FROM (SELECT 
    id_cliente,
    sum(saldo) as total,
    creditos_activos
    FROM abandono_bancario.cheques_debito
    WHERE creditos_activos > 4
    GROUP BY id_cliente, creditos_activos) as t1;

```

2. Se busca conocer el promedio del ingreso_estimado de aquellos clientes que son mujeres y cuentan con mas de 3 creditos activos, por nacionalidad:

```sql
SELECT distinct nacionalidad, AVG(ingreso_estimado)
FROM (
	SELECT * FROM abandono_bancario.clientes_concentrado
	WHERE creditos_activos > 3 
	AND genero = 1
	) as t1
GROUP BY nacionalidad;

```

3. Se busca obtener el promedio del ingreso_estimado de las 5 nacionalidades que mas ingreso_estimado representan, pero ahora se busca conocer para clientes que son hombres, y tambien con mas de 3 creditos:

```sql
SELECT distinct nacionalidad, AVG(ingreso_estimado)
FROM (
	SELECT *
	FROM abandono_bancario.clientes_concentrado
	WHERE creditos_activos > 3 
	AND genero = 1
	GROUP BY 
	id_cliente,
	fecha_reporte,
	nacionalidad,
	genero,
	antiguedad,
	ingreso_estimado,
	creditos_activos,
	abandono,
	ingreso_neto_estimado
	ORDER BY ingreso_estimado desc
	) as t1
GROUP BY  nacionalidad
LIMIT 5;
```


## ○ Reportando Hallazgos
1. Se identifico una incidencia/inconsistencia en la informacion, la cual se arreglo

2. Se agregaron dos columnas en distintas tablas, para mejorar el tratamiento de la informacion

3. Se encontro que las nacionalidades en las que los clientes hombres cuentan con un mayor ingreso estimado en promedio, son Costa Rica, Indonesia, Brazil, China y North Korea