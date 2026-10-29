# QA del apagón por energía y del atajo de noche (Ctrl+Shift+N)

> Estado: **QA estático (revisión de código) + plan de pruebas.** Los casos de ejecución están **bloqueados** porque quien elaboró este documento no tuvo GameMaker disponible. No se declara ningún caso como aprobado ni se adjunta evidencia de ejecución inexistente.

- **Autor:** Javier Gámez (`Javier-Gamez`)
- **SHA analizado:** `14d2cb7c44c5f0085e150f7efaa675b75e3ce163` (`main`)
- **Entorno de referencia de los docs del proyecto:** Windows, GameMaker LTS IDE 2026.0.0.16, runtime 2026.0.0.23
- **Validación automática:** `python tools/validate_project.py` pasa; solo revisa integridad de recursos, orden de salas y marcadores de conflicto. No compila ni ejecuta el juego.
- **Archivos revisados:** `objects/obj_BatCheck/{Create_0,Step_2,Draw_64}.gml`, `objects/obj_WinTimer/{Create_0,Alarm_0,Step_0}.gml`, `objects/obj_BatCamara/Step_2.gml`, `objects/obj_BatLaser/Step_2.gml`, `objects/obj_Culturales1/Create_0.gml`.

## 1. Comportamiento a validar

| Función | Comportamiento esperado |
|---|---|
| Apagón | Al llegar `global.Bateria` a 0 se bloquean cámaras y láser, se detiene el audio, se muestra pantalla negra y, tras ~6 s, entra el screamer y la sala `GameOver`. |
| Atajo | Con energía y sin apagón, Ctrl+Shift+N (flanco de `N`) completa la ronda y entra a la sala `Win` con el reloj en 6 AM. |

### Criterios de aceptación

| ID | Criterio |
|---|---|
| CA-1 | Al agotar la batería: pantalla negra → screamer → Game Over, en ese orden. |
| CA-2 | Con la batería en 0, cámara y láser no se pueden activar. |
| CA-3 | Tras Game Over, una nueva partida inicia con batería llena (14400) y controles activos. |
| CA-4 | Ctrl+Shift+N durante una ronda con energía muestra la victoria de 6 AM. |
| CA-5 (límite) | El atajo se ignora durante el apagón, con la batería en 0, fuera de `Culturales1` y si falta alguna de las tres teclas. |

## 2. Matriz de riesgos

| ID | Riesgo | Impacto | Casos |
|---|---|---|---|
| R-1 | El 6 AM y el agotamiento ocurren casi a la vez y se produce un resultado mixto (victoria con batería 0). Ver S-5. | Medio | QA-B07 |
| R-2 | El estado del apagón (`global.EnergyBlackout`, `blackout_phase`) sobrevive a una nueva partida. | Alto | QA-B04 |
| R-3 | La pausa (otro PR) interactúa mal con el apagón o con el atajo. | Medio | QA-B08 |
| R-4 | El atajo se dispara con combinaciones parciales o con la tecla mantenida. | Bajo | QA-B06 |
| R-5 | El apagón/screamer resulta inaccesible o incómodo (parpadeo, sin aviso, atajo de tres teclas). | Medio | QA-B09 |

## 3. Casos de prueba

Campos a llenar al ejecutar: autor, fecha, SHA probado, versión, evidencia (liga). Hasta entonces, todos están **bloqueados**.

| ID | Categoría | Cubre | Pasos | Esperado | Resultado real | Estado |
|---|---|---|---|---|---|---|
| QA-B01 | Ruta feliz | CA-1, CA-2 | 1. Nuevo Juego. 2. Mantener cámara y láser activos hasta agotar la batería (≈2 min con ambos, ver S-4). 3. Intentar abrir cámara y láser durante el apagón. | Negro → screamer → Game Over; controles bloqueados. | No ejecutado: sin entorno de GameMaker | Bloqueado |
| QA-B02 | Límite | CA-1 | Agotar la batería usando un solo consumidor (≈4 min) y luego repetir con ambos. | Misma secuencia sin quedar a medio camino. | No ejecutado: sin entorno de GameMaker | Bloqueado |
| QA-B03 | Regresión | CA-1 | Antes de agotar la batería, abrir/cerrar cámaras, activar el láser y observar el indicador (`BatConteo` de 5 a 1). | Todo funciona como antes del cambio; el indicador baja por niveles. | No ejecutado: sin entorno de GameMaker | Bloqueado |
| QA-B04 | Navegación y estado | CA-3, R-2 | Tras Game Over, volver al menú e iniciar Nuevo Juego. | Batería 14400, cámaras y láser activos, sin pantalla negra residual. | No ejecutado: sin entorno de GameMaker | Bloqueado |
| QA-B05 | Ruta feliz (atajo) | CA-4 | Con energía, pulsar Ctrl+Shift+N. | Sala `Win` con reloj en 6 AM. | No ejecutado: sin entorno de GameMaker | Bloqueado |
| QA-B06 | Límite (atajo) | CA-5, R-4 | Probar Ctrl+N, Shift+N, N solo, mantener N con Ctrl+Shift, y pulsar el atajo en menú y en `GameOver`. | Solo la combinación completa, y solo en `Culturales1`, activa la victoria; una sola vez. | No ejecutado: sin entorno de GameMaker | Bloqueado |
| QA-B07 | Carrera | R-1 | Aproximar la batería a 0 cerca de la hora 7 y pulsar el atajo o esperar el 6 AM en el mismo instante que el agotamiento. | Un único resultado coherente (Game Over o Win), nunca ambos ni un estado intermedio. | No ejecutado: sin entorno de GameMaker | Bloqueado |
| QA-B08 | Interacción | R-3 | Pausar (ESC/P) durante el apagón y reanudar; pausar y salir al menú durante el apagón; pulsar el atajo en pausa. | El apagón continúa tras reanudar; salir al menú limpia el estado; el atajo no actúa en pausa. | No ejecutado: sin entorno de GameMaker | Bloqueado |
| QA-B09 | Accesibilidad | R-5 | Revisar el screamer por parpadeo y falta de aviso; probar el atajo con Sticky Keys de Windows; comprobar texto ampliado en las pantallas. TalkBack no aplica (Windows). | Documentar limitaciones reales; el atajo es opcional y no el único camino de juego. | No ejecutado: sin entorno de GameMaker | Bloqueado |
| QA-B10 | Entorno | — | Repetir QA-B01 con otra resolución o escala de pantalla y perdiendo el foco de la ventana durante el apagón. | La secuencia termina igual; la pantalla negra cubre toda la ventana. | No ejecutado: sin entorno de GameMaker | Bloqueado |

## 4. Hallazgos del análisis estático (reales)

| # | Hallazgo | Severidad | Estado |
|---|---|---|---|
| S-1 | `obj_BatCheck` deja mensajes `show_debug_message("[EnergyBlackout v2] ...")` en el código de juego, con una etiqueta de versión interna. Es ruido de depuración en cualquier compilación. | Baja | Confirmado en código |
| S-2 | Inconsistencia defensiva: `obj_WinTimer/Step_0` verifica `variable_global_exists("EnergyBlackout")` antes de leerla, pero `obj_WinTimer/Alarm_0`, `obj_BatCamara` y `obj_BatLaser` leen `global.EnergyBlackout` sin esa verificación. Hoy es seguro porque la variable se inicializa en `obj_Culturales1/Create_0` y esos objetos solo existen en `Culturales1`. | Baja | Confirmado; sin falla actual |
| S-3 | `global.Hora` solo se usa en el reloj y el temporizador de victoria (`obj_WinTimer`, y la inicialización de `obj_Coco`). El atajo, que fuerza `Hora = 8`, no omite lógica de juego dependiente de la hora. | — | Riesgo descartado por lectura de código |
| S-4 | Tiempos para planificar las pruebas: la batería inicia en 14400 y cada consumidor activo resta 1 por paso. Con cámara y láser a la vez se agota en ≈2 min (a 60 pasos/s); con uno solo, ≈4 min. Una noche completa dura 8 horas × 3600 pasos ≈ 8 min. El apagón es, por tanto, una ruta de juego frecuente, no un caso raro. | Informativo | Calculado desde el código |
| S-5 | Posible carrera de un fotograma: los consumidores restan batería en `Step_2` (End Step) y el 6 AM llega por un evento Alarm, que en GameMaker se ejecuta antes que el End Step. `Alarm_0` solo comprueba `global.EnergyBlackout`, que se activa un fotograma después de que la batería llega a 0 si `obj_BatCheck` se ejecuta antes que el consumidor. Depende del orden de ejecución de instancias. | Baja | Plausible; por verificar en QA-B07 |
| S-6 | El atajo Ctrl+Shift+N no tiene indicación en la interfaz ni protección para compilaciones finales: está disponible en cualquier compilación. | Baja | Confirmado; es intencional según los docs del proyecto |
| S-7 | La sala `GameOver` depende de `global.JSBy = 1` para elegir el screamer; el valor lo escribe `obj_BatCheck` y lo inicializa `obj_Coco` en 0. Si otra ruta dejara `JSBy` en un valor distinto, el Game Over podría mostrar otro screamer. | Baja | Por verificar en QA-B04 y QA-B08 |

## 5. Verificaciones automáticas

| Verificación | Qué comprueba | Qué no cubre |
|---|---|---|
| `tools/validate_project.py` (local) | Integridad de recursos, orden de salas y marcadores de conflicto en GML. Resultado: pasa (1174 archivos). | Compilación, ejecución, lógica del juego, audio y visuales. |
| Workflow `GameMaker project integrity` | Ejecuta el mismo script en cada `push` y `pull_request`. | Lo mismo que arriba. No sustituye las pruebas manuales. |

## 6. Limitaciones

- Ningún caso QA-B01 a QA-B10 fue ejecutado; no hay evidencia de comportamiento real.
- S-5 y S-7 son hipótesis derivadas del código y del orden de eventos de GameMaker, sin confirmación en ejecución.
- Este documento complementa, sin reemplazar, `docs/pruebas.md`, `docs/pruebas-atajo.md` y los QA de otros integrantes.

## 7. Dictamen preliminar

El apagón y el atajo parecen implementados de forma coherente con sus criterios de aceptación según la lectura del código, y los riesgos de integración con otros cambios (hora, pausa, estado) son bajos. **No se puede dar por aprobado el comportamiento hasta ejecutar al menos QA-B01, QA-B04, QA-B05 y QA-B07**, que cubren la ruta principal, el estado entre partidas y la posible carrera.

Se utilizó IA como apoyo en la revisión de código y la redacción de este documento.
