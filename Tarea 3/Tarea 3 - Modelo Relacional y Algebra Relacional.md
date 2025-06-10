# Tarea 3
## ○ Esquema del Modelo Relacional de la Base de Datos

### • Clientes
  - Fecha_Reporte
  - **ID_Cliente (Clave Primaria)**
  - Nacionalidad
  - Genero
  - Antigüedad
  - Ingreso_Estimado
  - Créditos_Activos
  - Abandono

### • Créditos

 - **ID_Cliente (Clave Primaria)**
 - Puntaje_crediticio
 - Tarjetas_de_credito
 - Créditos_Activos

### • Cuentas Debito

 - Fecha_Reporte
 - **ID_Cliente (Clave Primaria)**
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
        string ID_Cliente
        float Puntaje_crediticio
        numeric Tarjetas_de_credito
        numeric Creditos_Activos
    }

    CUENTAS_DE_DEBITO {
        datetime Fecha_Reporte  
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
|*1. Intersección*   |                     | Creditos [Creditos_Activos > 5] ∩ Cuentas_de_Debito         |
|*2. Diferencia*     |                     | Clientes [Abandono = 0] - Creditos  |
|*3. Selección*    |                       | Creditos [Creditos_Activos > 3]           |
|*4. Proyección*        |                  | Clientes [ID_Cliente, Nacionalidad, Abandono]   |