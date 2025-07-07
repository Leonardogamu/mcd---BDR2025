# Tarea 6
## ○ Usar funciones de agregacion para calcular en tu base de datos
### a) Conteo de frecuencias o media

• Conteo de Frecuencias de clientes por nacionalidad

El codigo se hizo en MySQL:
```mysql
use abandono_bancario;

select nacionalidad, 
count(*) 
from abandono_bancario.clientes_concentrado
group by
nacionalidad
```
• Media de los creditos activos por nacionalidad

El codigo se hizo en MySQL:
```mysql
select nacionalidad, 
AVG(creditos_activos)
from abandono_bancario.clientes_concentrado
group by
nacionalidad
```

### b) Mínimos o Máximos

• Mínimo y Máximo del Saldo de las cuentas de debito/chequeras

El codigo se hizo en MySQL:
```mysql
select 
MIN(saldo) as saldo_minimo,
MAX(saldo) as saldo_maximo
from abandono_bancario.cheques_debito
```

### c) Cuantil cuyo resultado sea distinto a la mediana

• Tercer cuartil/ Cuantil 75%

El codigo se hizo en MySQL:
```mysql
SELECT ingreso_estimado AS cuantil_75
FROM 
(
  SELECT 
    ingreso_estimado,
    PERCENT_RANK() OVER (ORDER BY ingreso_estimado ) AS percentil
  FROM abandono_bancario.clientes_concentrado
) as t1
WHERE percentil >= 0.75
ORDER BY percentil
LIMIT 1;
```

### d) Moda

• Moda de la cantidad de tarjetas de credito que tienen los clientes

El codigo se hizo en MySQL:
```mysql
SELECT 
tarjetas_credito, 
COUNT(*) AS frecuencia
FROM abandono_bancario.creditos_colocacion
GROUP BY tarjetas_credito
ORDER BY frecuencia DESC
LIMIT 1;
```

### e) Hallazgos, dificultades, implementacion de soluciones encontradas en línea.
### • Hallazgos
  - Lo que mas llamo mi atencion es que 32 clientes cuentan con 3 tarjetas de credito, siendo la frecuencia mas alta vista en la cantidad de tarjetas que los clientes suelen tener
  - De las cuentas de cheques, la que cuenta con un saldo mas alto es aquella con mas de 800mil pesos, lo cual se podria ver como un comportamiento extraño pues no se encuentra en inversion o generando algun rendimiento en una cuenta de cheques.
  - Adicionalmente algo a resaltar es que la nacionalidad que mas se repite es la China, con 20 clientes originarios de China.


### • Dificultades
  - La parte mas dificil fue obtener la Moda, pues habia diseñado un query mas largo con subquery y todo, pero despues me di cuenta que se podia se una manera mas compacta y jugando con la funcion LIMIT
  - Pero tambien en la obtencion del tercer cuartil o cuantil 75% en lo que mas se me dificulto fue en la obtencion de una funcion que pudiera hacer el rank a nivel percentil, porque pense que ni existia hasta que descubri el PERCENT_RANK.

### • Recomendaciones o recursos relevantes
  - La recomendacion que mas se repite en el ambito laboral es seguir el principio de parsimonia, entre mas compacto y mas eficiente sea el query que hagas, siempre sera mejor que uno que sea mas detallado, rebuscado y no de solo la informacion o resultado que se busca, por ello a veces es mejor usar subquerys pero tambien poniendo en consideracion la simplicidad del query.
  - En cuanto a la busqueda de funciones, me sirve mucho stack overflow no solo para buscar funciones, si no para buscar problematicas similares a las que se me presentan, pues ahi no solo ponen cual es mejor utilizar, ponen un contexto completo de que logra hacer tal sintaxis o como se soluciona un error y como se termina viendo un resultado.