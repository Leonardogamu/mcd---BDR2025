# Tarea 1
## ○ Descripcion de una base de datos

Una entidad financiera que presta dinero a las personas físicas y morales requiere de un sistema, el cual ayude a tener un registro de manera diaria de los **clientes** los cuales aun tienen un **credito activo**. Los clientes registran **informacion sensible** como domicilios, actividad economica, personalidad ante hacienda, tipo de credito, vencimiento futuro del credito, numero de pagos realizados, estado civil. Todo lo anterior para tener un control de el tipo de clientes que consumen los creditos, y evitar caer en un posible caso de lavado de dinero.
Adicionalmente solo se requiere conocer el **saldo actual** del cliente, el **monto total** del credito para tener un registro del comportamiento de los pagos, tomando en cuenta que, en cuanto la persona liquide su deuda, desaparecera del sistema pues solo se tiene control de los que tienen deuda activa.

## ○ Tipos de datos que tendran los atributos

- Fecha de la informacion **(fecha)**
- Identificador del Cliente **(texto)**
- Nombre del Cliente **(texto)**
- Identificador del Credito **(texto)**
- Nombre del Credito/Producto **(texto)**
- Calle **(texto)**
- Numero **(texto)**
- Colonia **(texto)**
- Municipio **(texto)**
- Estado **(texto)**
- Actividad Economica **(texto)**
- Personalidad en Hacienda **(texto)**
- Vencimiento **(fecha)**
- Numero de Pago **(texto)**
- Estado Civil **(texto)**
- Saldo Actual **(numerico - reales)**
- Monto total de la deuda **(numerico - reales)**

## ○ Investigacion SGBD: PostgreSQL

PostgreSQL es un sistema de gestión de bases de datos (SGBD) el cual sirve mediante el gran numero de funciones de SQL que tiene, para gestionar y manejar bases de datos, con las principales  funciones necesarias para administrar una base de datos, como las consultas de información, la escritura y reescritura de información, eliminación de información y también creación de funciones las cuales se guardan en la base de datos o también existiendo procedimientos mejor conocidos como Store Proceedures los cuales también se guardan en la base de datos y se pueden mandar a llamar al momento de realizar consultas. 

También existiendo funciones agregadas, las cuales son distintas de las funciones que se guardan en la base de datos, estas funciones agregadas realizan cálculos o aplican procedimientos que terminan devolviendo un valor, o que incluso terminan modificando el resultado de una consulta completa.

Este sistema comenzó y aun continua siendo un proyecto de código abierto, que a pesar de los posibles problemas de seguridad que podría tener el ser de codigo abierto, se utiliza en distintas empresas o proyectos donde se manejan datos de manera masiva pues, se ha ganado una reputación muy buena y actualmente se volvio un sistema fiable para las empresas que buscan una gestión de datos segura, además de contar con soporte para los principales lenguajes de programación como Java, Python, C++, entre otros. Esto porque, por ejemplo, cuenta con librerias en R y en Python para conectarse desde estos lenguajes a bases de datos que se administren desde PostgreSQL, facilitando mas el manejo de datos y la integracion de distintos softwares. Pero lo anterior nos habla de una comunidad que esta activa, lo cual en un proyecto de código abierto es algo vital.


Lo termine eligiendo por ser el que mas conozco y mejor manejo

### Fuentes de la investigacion

- [PostgreSQL Official Docs. *Aggregate Functions*](https://www.postgresql.org/docs/current/functions-aggregate.html)
- [Platzi. *Descubre PostgreSQL*](https://platzi.com/blog/que-es-postgresql/)
- [Kinsta. *¿Qué es PostgreSQL?*](https://kinsta.com/es/base-de-conocimiento/que-es-postgresql/)
- [W3Schools. *PostgreSQL Intro*](https://www.w3schools.com/postgresql/postgresql_intro.php) 