# Tarea 8
## ○ Crear vistas sobre consultas significativas, recurrentes, entre otras, que:
### a) Incluya un JOIN

Esta vista facilita mas el observar el saldo que los clientes tienen en sus chequeras, asi como cuantas tarjetas de credito tienen, asi como otros creditos que tienen activos, pues en la tabla de cheques no esta el numero de tarjetas de credito de los clientes, asi facilitando analisis de clientes:

```sql
create view consulta_creditos_saldochequeras AS
select 
cheques_debito.fecha_reporte,
sum(cheques_debito.saldo) as saldo,
creditos_colocacion.tarjetas_credito,
creditos_colocacion.creditos_activos
from abandono_bancario.cheques_debito 
join abandono_bancario.creditos_colocacion
on cheques_debito.id_cliente = creditos_colocacion.id_cliente
group by
cheques_debito.fecha_reporte,
creditos_colocacion.tarjetas_credito,
creditos_colocacion.creditos_activos
```

### b) Incluya un LEFT JOIN

### c) Incluya un RIGHT JOIN

### d) Incluya una subconsulta

Esta vista nos obtendra el ingreso estimado en promedio, asi como la nacionalidad de los clientes que tengan 5 creditos activos, como aquellos que sean Hombres, esto nos facilitara mucho al momento de hacer analisis que sean a nivel nacionalidad:

```sql
create view nacionalidades_hombres_5cred_promedio AS
select distinct nacionalidad, AVG(ingreso_estimado)
from (
	select * from abandono_bancario.clientes_concentrado
	where creditos_activos = 5 
	and genero = 0
	) as t1
group by nacionalidad;
```

## ○ Crear almenos un disparador de inserción, actualizacion o eliminacion

## Elegir tema para proyecto integrador de aprendizaje