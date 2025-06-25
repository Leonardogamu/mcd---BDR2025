# Tarea 4
## ○ Creacion de Base de Datos, Tablas y Subida de Datos "Manual"
El codigo se hizo en MySQL

```mysql

-----Creamos la base de datos y la seleccionamos

create database abandono_bancario;
use abandono_bancario;

-----Creamos las tablas 
-----tabla de clientes
create table clientes_concentrado(
	id_cliente INT primary key,
	fecha_reporte DATE,
	nacionalidad VARCHAR(255),
	genero BOOLEAN,
	antiguedad INT,
	ingreso_estimado FLOAT(255,4),
	creditos_activos INT,
	abandono BOOLEAN
	
);

-----tabla de creditos
create table creditos_colocacion(
	id_credito INT primary key,
	id_cliente INT,
	foreign key (id_cliente) references abandono_bancario.clientes_concentrado(id_cliente),
	puntaje_crediticio FLOAT(255,4),
	tarjetas_credito INT,
	creditos_activos INT

);

-----tabla de cheques/debito
create table cheques_debito(
	id_cuenta INT primary key,
	id_cliente INT,
	foreign key (id_cliente) references abandono_bancario.clientes_concentrado(id_cliente),
	fecha_reporte DATE,
	saldo FLOAT(255,4),
	cliente_activo BOOLEAN,
	creditos_activos INT

);

----SUBIMOS LA INFORMACION A ESTAS TABLAS DE LA BASE DE DATOS

insert into clientes_concentrado values
(15634602,'2025-04-30','France',1,2,101348.88,1,1),
(15647311,'2025-04-30','Spain',1,1,112542.58,1,0),
(15619304,'2025-04-30','France',1,8,113931.57,3,1),
(15701354,'2025-04-30','France',1,1,93826.63,2,0),
(15737888,'2025-04-30','Spain',1,2,79084.1,1,0),
(15574012,'2025-04-30','Spain',0,8,149756.71,2,1);


insert into creditos_colocacion values
(0115634602, 15634602,619,1,1),
(0115647311, 15647311,608,1,0),
(0115619304, 15619304,502,3,1),
(0115701354, 15701354,699,2,0),
(0115737888, 15737888,850,1,1),
(0115574012, 15574012,645,2,1);

insert into cheques_debito values
(1015634602,15634602,'2025-04-30',0,1,1),
(1015647311,15647311,'2025-04-30',83807.86,1,1),
(1015619304,15619304,'2025-04-30',159660.8,0,3),
(1015701354,15701354,'2025-04-30',0,0,2),
(1015737888,15737888,'2025-04-30',125510.82,1,1),
(1015574012,15574012,'2025-04-30',113755.78,0,2);

-----REVISANDO QUE SI SE IMPORTARON BIEN LOS VALORES   
select * from abandono_bancario.clientes_concentrado limit 3

select * from abandono_bancario.creditos_colocacion limit 3

select * from abandono_bancario.cheques_debito limit 3

```