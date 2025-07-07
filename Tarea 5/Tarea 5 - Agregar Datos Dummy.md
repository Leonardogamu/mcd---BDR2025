# Tarea 5
## ○ Agregar datos ficticios o de otras fuentes de manera automática
### • Utilizando Mockaroo.com
Los datos que se generaron y se subieron a la base de datos
se generaron con la siguiente configuracion en Mockaroo:

**1. Tabla clientes_concentrado**

| **Columna**     | **Tipo/Type**      |
|--------------|---------------------------|
|id_cliente    | Number  |
|fecha_reporte | Blank (Para introducir la misma fecha en toda la columna desde bloc de notas)   |
|nacionalidad  | Country |
|genero        | Number (minimo: 0 y maximo: 1) |
|antiguedad    | Number |
|ingreso_estimado| Number |
|creditos_activos| Number |
|abandono        | Number (minimo: 0 y maximo: 1)|

**2. Tabla creditos_colocacion**

| **Columna**     | **Tipo/Type**      |
|--------------|---------------------------|
|id_credito    | Number  |
|id_cliente    | Number   |
|puntaje_crediticio | Number (minimo: 100 y maximo: 900)|
|tarjetas_credito        | Number|
|creditos_activos    | Number |

**3. Tabla cheques_debito**

| **Columna**     | **Tipo/Type**      |
|--------------|---------------------------|
|id_cuenta    | Number  |
|id_cliente    | Number   |
|fecha_reporte | Blank (Para introducir la misma fecha en toda la columna desde bloc de notas)|
|saldo        | Number|
|cliente_activo   | Number (minimo: 0 y maximo: 1)|
|creditos_activos   | Number |



## ○ Hallazgos, dificultades, recomendaciones o recursos que sean relevantes.
### • Hallazgos
  - Lo primero que llama la atencion de la herramienta esque tiene opciones para crear campos por completo utilizando la IA
  - Adicionalmente te deja bajar la informacion en distintos tipos de archivo como lo son CSV, XML, SQL, Excel, entre otros.
  - Tambien con opciones como el incluir encabezado en las columnas o BOM
  - Te deja generar hasta 1000 filas de informacion para cada columna
  - Cuenta con opciones como agregar valores NULL entre las filas, para mezclar nulos con datos en una misma columna, algo interesante


### • Dificultades
  - La primera dificultad que enfrente fue para mis columnas 'fecha_reporte' las cuales tuve que dejar como columnas totalmente sin informacion, para despues mediante la funcion de reemplazo del bloc de notas rellenar toda esa columna con una misma fecha, pues no encontre la funcion de hacer que un solo valor de tipo fecha se repitiera en toda la columna
  - Otra dificultad con la que me tope fue con que al generar la informacion en 3 csv distintos la columna de id_cliente iban a terminar siendo totalmente distintas entre las 3 tablas lo cual no me serviria para realizar cruces de informacion o mas bien JOINs entre mis tablas, por lo cual modifique esas columnas para que existieran id_clientes en las 3 tablas y no enfrentarme con esa clase de problemas a futuro.

### • Recomendaciones o recursos relevantes
  - Si quieres tal cual cargar la informacion como la produce la herramienta es mejor bajar la informacion en tipo SQL para solo obtener el query y correrlo
  - En caso de querer realizarla ajustes a la informacion generada, creo que es mejor manejarla en csv para hacerle sus ajustes pertinentes y ya despues subir esa informacion, todo con el menor riesgo de que ocurran errores de formato.
  - Es mejor no bajar las 1000 filas que ofrecen, soy mas de mantener un volumen de informacion mas reducido pero suficiente, lo cual sera de ayuda a manejar la informacion de manera mas atenta.