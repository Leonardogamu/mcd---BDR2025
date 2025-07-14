
###JOIN
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

###LEFT JOIN
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

####RIGHT JOIN

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


####SUBCONSULTA

create view nacionalidades_hombres_5cred_promedio AS
select distinct nacionalidad, AVG(ingreso_estimado)
from (
	select * from abandono_bancario.clientes_concentrado
	where creditos_activos = 5 
	and genero = 0
	) as t1
group by nacionalidad;

#############CREAR TRIGGER
#Creamos tabla en la que se guardara cada cliente nuevo que caiga en abandono = 0 y creditos = 0

use abandono_bancario;

CREATE table abandono_bancario.abandono_efectivo (
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

#Crear activador

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



