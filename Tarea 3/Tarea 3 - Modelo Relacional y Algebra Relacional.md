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

```mermaid

erDiagram
    CLIENTES ||
    CRÉDITOS ||--o{ CLIENTES : Consumen
    CUENTAS DE DEBITO ||--o{ CLIENTES : Ahorran Dinero

    CLIENTES {
        datetime Fecha_Reporte 
        string ID_Cliente 
        string Nacionalidad
        boolean Genero
        numeric Antigüedad
        float Ingreso_Estimado
        numeric Créditos_Activos
        boolean Abandono
    }

    CRÉDITOS {
        string ID_Cliente
        float Puntaje_crediticio
        numeric Tarjetas_de_credito
        numeric Créditos_Activos
    }

    CUENTAS DE DEBITO {
        datetime Fecha_Reporte  
        string ID_Cliente 
        float Saldo
        boolean Cliente_activo
        numeric Créditos_Activos
    }
````
---

## ○ Operaciones del Álgebra Relacional que se podrian realizar

| **Operacion**     | **Explicacion**                           |
|--------------|---------------------------------------|
|*1. Intersección*   |      |
|*2. Diferencia*     |         |
|*3. Selección*    |                         |
|*4. Proyección*        |           |