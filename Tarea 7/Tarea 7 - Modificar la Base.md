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

