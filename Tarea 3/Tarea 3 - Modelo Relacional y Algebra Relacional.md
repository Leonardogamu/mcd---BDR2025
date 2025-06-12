# Tarea 3
## ○ Esquema del Modelo Relacional de la Base de Datos
La Base de datos se puede representar mediante el siguiente esquema del modelo relacional:
### • Clientes
  - Fecha_Reporte
  - **ID_Cliente (Clave Primaria/Primary Key)**
  - Nacionalidad
  - Genero
  - Antigüedad
  - Ingreso_Estimado
  - Créditos_Activos
  - Abandono

### • Créditos

 - **ID_Credito (Clave Primaria/Primary Key)**
 - **ID_Cliente (Clave Foranea/Foreign Key → Clientes.ID_Cliente)**
 - Puntaje_crediticio
 - Tarjetas_de_credito
 - Créditos_Activos

### • Cuentas Debito

 - Fecha_Reporte
 - **ID_Cuenta (Clave Primaria/Primary Key)**
 - **ID_Cliente (Clave Foranea/Foreign Key → Clientes.ID_Cliente)**
 - Saldo
 - Cliente_activo
 - Créditos_Activos

## ○ Diagrama Relacional
Se representa el esquema del punto anterior, con el siguiente diagrama relacional:

```mermaid

erDiagram
    CLIENTES ||--o{ CREDITOS : Consumen
    CLIENTES ||--o{ CUENTAS_DE_DEBITO : Ahorran_Dinero

    CLIENTES {
        datetime Fecha_Reporte 
        string ID_Cliente 
        string Nacionalidad
        boolean Genero
        numeric Antiguedad
        float Ingreso_Estimado
        numeric Créditos_Activos
        boolean Abandono
    }

    CREDITOS {
        string ID_Credito
        string ID_Cliente
        float Puntaje_crediticio
        numeric Tarjetas_de_credito
        numeric Creditos_Activos
    }

    CUENTAS_DE_DEBITO {
        datetime Fecha_Reporte  
        string ID_Cuenta
        string ID_Cliente 
        float Saldo
        boolean Cliente_activo
        numeric Creditos_Activos
    }
````
---

## ○ Operaciones del Álgebra Relacional que se podrian realizar

| **Operacion**     | **Explicacion**      | **Expresión**    |
|--------------|---------------------------|----------------|
|*1. Intersección*   | Se busca obtener tuplas de clientes los cuales tengan saldo en su cuenta de debito, y cuenten con 5 o mas creditos activos        | Creditos [Creditos_Activos > 4] ∩ Cuentas_de_Debito         |
|*2. Diferencia*     | Con esta operacion se consigue obtener aquellos clientes que no han abandonado, pero no cuentan con creditos                  | Clientes [Abandono = 0] - Creditos  |
|*3. Selección*    | Mediante esta operacion se obtendrian lso clientes con 4 o mas creditos, asi como sus respectivos ID_Credito                      | Creditos [Creditos_Activos > 3]           |
|*4. Proyección*        | Con este operador, se obtendrian solo los ID's, la nacionalidad y el si abandono o no, sirviendonos para un analisis superficial del abandono de clientes por nacionalidad             | Clientes [ID_Cliente, Nacionalidad, Abandono]   |


## ○ Nuevas Modificaciones a la Base de Datos Propuesta
Con el esquema anteriormente realizado, opte por agregar una columna de ID_Creditos y ID_Cuentas a la Base de Datos, esto para mayor facilidad al momento de manipular las relaciones.



