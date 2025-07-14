# Tarea 8
## ○ Crear vistas sobre consultas significativas, recurrentes, entre otras, las cuales:
### a) Incluyan un JOIN

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

### b) Incluyan un LEFT JOIN

Esta vista puede ser de gran ayuda para monitorear por fecha, el promedio por nacionalidad del comportamiento crediticio de los clientes, algo que serviria para el area de riesgo crediticio en el banco:

```sql
create view consulta_analisis_crediticios_promedio AS
select
clientes_concentrado.fecha_reporte,
clientes_concentrado.nacionalidad,
AVG(clientes_concentrado.ingreso_neto_estimado) as ingresos_netos,
AVG(creditos_colocacion.puntaje_crediticio) as score_promedio,
AVG(creditos_colocacion.creditos_activos) as creditos_promedios
from abandono_bancario.clientes_concentrado
left join abandono_bancario.creditos_colocacion on clientes_concentrado.id_cliente = creditos_colocacion.id_cliente
group by
clientes_concentrado.fecha_reporte,
clientes_concentrado.nacionalidad
```

### c) Incluyan un RIGHT JOIN

Esta otra vista serviria para monitorear a nivel cliente el comportamiento de sus ingresos a la cuenta, ideal para el area de prevencion al lavado de dinero del banco:

```sql
create view consulta_analisis_ingresos_pld AS
select
clientes_concentrado.id_cliente,
sum(clientes_concentrado.ingreso_neto_estimado) as ingreso_neto,
sum(cheques_debito.saldo) as saldo_real
from abandono_bancario.clientes_concentrado
right join abandono_bancario.cheques_debito on clientes_concentrado.id_cliente = cheques_debito.id_cliente
where cheques_debito.saldo > 400000.0
group by 
clientes_concentrado.id_cliente
```

### d) Incluyan una subconsulta

Esta vista nos obtendra el ingreso estimado en promedio, asi como la nacionalidad de los clientes que tengan 5 creditos activos, como aquellos que sean Hombres, esto nos facilitara mucho al momento de hacer analisis que sean a nivel nacionalidad:

```sql
create view nacionalidades_hombres_5cred_promedio as
select distinct nacionalidad, AVG(ingreso_estimado)
from (
	select * from abandono_bancario.clientes_concentrado
	where creditos_activos = 5 
	and genero = 0
	) as t1
group by nacionalidad;
```

## ○ Crear almenos un disparador de inserción, actualizacion o eliminacion

La idea de este trigger de inserción es que cada que un cliente presente 0 creditos activos y presente abandono en cheques, este cliente sea registrado en una tabla especifica para los casos de abandono 100% efectivo.

Los beneficios de este trigger es tener un control de aquellos clientes que si abandonaron los servicios del banco.

```sql
#creamos nueva tabla
USE abandono_bancario;

CREATE TABLE abandono_bancario.abandono_efectivo (
	id_cliente INT primary key,
	fecha_reporte DATE,
	nacionalidad VARCHAR(255),
	genero BOOLEAN,
	antiguedad INT,
	ingreso_estimado FLOAT(255,4),
	creditos_activos INT,
	abandono BOOLEAN,
	ingreso_neto_estimado FLOAT(255,4)
);

#Crear trigger

CREATE TRIGGER abandono_bancario.activar_abandonos
AFTER INSERT ON abandono_bancario.clientes_concentrado
FOR EACH ROW
BEGIN
    IF NEW.abandono = 0 AND NEW.creditos_activos = 0 THEN
        INSERT INTO abandono_efectivo (
            id_cliente,
            fecha_reporte,
            nacionalidad,
            genero,
            antiguedad,
            ingreso_estimado,
            creditos_activos,
            abandono,
            ingreso_neto_estimado
        ) VALUES (
            NEW.id_cliente,
            NEW.fecha_reporte,
            NEW.nacionalidad,
            NEW.genero,
            NEW.antiguedad,
            NEW.ingreso_estimado,
            NEW.creditos_activos,
            NEW.abandono,
            NEW.ingreso_neto_estimado
        );
    END IF;
END;


#probando que si funcione
INSERT INTO abandono_bancario.clientes_concentrado VALUES (
    15915682,'2025-07-30','Mexico',1,2,101348.88,0,0,100000.00
);


#aqui no deberia funcionar
INSERT INTO abandono_bancario.clientes_concentrado VALUES (
    15915588, '2025-07-13', 'Mexico', 1, 24, 15000.0000, 0, 1, 10000.0000
);

#verificamos que si guarde la info 
SELECT * FROM abandono_bancario.abandono_efectivo;
```

## ○ Consultas en Archivo SQL:

El codigo que se presenta en esta tarea tambien se puede bajar en formato .SQL en el siguiente link:
![Codigo_Tarea8](https://github.com/Leonardogamu/mcd---BDR2025/blob/main/Imagenes/ConsultasTAREA%208.sql)