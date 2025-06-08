# Tarea 2
## ○ Base de Datos en Modelo Entidad-Relacion

Modelo de Entidad-Relacion de la Base de Datos Propuesta:
![Diagrama Entidad-Relacion](https://github.com/Leonardogamu/mcd---BDR2025/blob/main/Imagenes/DIAGRAMA%20Entidad-Relacion%20TAREA%202.PNG?raw=true)
**Las modificaciones realizadas a la base de datos propuesta se describen al final**

## ○ Definicion del Dominio de los atributos de la base de datos

**Definicion del Dominio**

| **Atributo**     | **Dominio**                           |
|--------------|---------------------------------------|
|*Fecha Reporte*   | Datetime     |
|*ID del Cliente*     | String         |
|*Nacionalidad*    | String                        |
|*Genero*        | Boolean; Masculino = 0, Femenino = 1           |
|*Antiguedad*         | Numeric          |
|*Ingreso Estimado*        | Float       |
|*Creditos Activos*      | Numeric                   |
|*Abandono*      | Boolean; Si = 1, No = 0                |
|*Puntaje Crediticio*      | Float                   |
|*Tarjetas de Credito*      | Numeric                   |
|*Saldo*      | Float                |
|*Cliente Activo*      | Boolean; Si = 1, No = 0                  |

**Muestra o Ejemplo del Dominio:**

| **Atributo**     | **Dominio (Muestra)**                           |
|--------------|---------------------------------------|
|*Fecha Reporte*   | '2025-04-30'     |
|*ID del Cliente*     | "00022251896"         |
|*Nacionalidad*    | "Mexicana"                        |
|*Genero*        | "0"; Masculino           |
|*Antiguedad*         | 2          |
|*Ingreso Estimado*        | 18932.24       |
|*Creditos Activos*      | 2                   |
|*Abandono*      | "0"; No               |
|*Puntaje Crediticio*      | 519.2                   |
|*Tarjetas de Credito*      | 1                   |
|*Saldo*      | 2250.32                |
|*Cliente Activo*      | "1"; Si                |


## ○ Modificaciones Realizadas a la Base de Datos Propuesta

Se continua con una base de datos de una entidad financiera
que presta dinero a personas físicas y recibe depositos de las mismas, pero con un objetivo diferente, el de registrar el comportamiento de los clientes o depositantes, y detectar si existen clientes que dejan de utilizar los productos de cheques (Captacion) que es el producto principal que todo cliente por operatividad, debe tener para ser cliente.

Adicionalmente registrando el numero de productos de creditos (Colocacion) con los que se cuenta, asi como su comportamiento crediticio.
