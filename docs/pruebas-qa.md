# Plan de QA — Menú de pausa, apagón por batería y atajo de victoria

> Estado: **QA estático (revisión de código) + plan de pruebas**. Los casos de ejecución están **bloqueados** porque quien elaboró este documento no pudo ejecutar GameMaker. No se declara ningún caso como aprobado ni se adjunta evidencia de ejecución inexistente.

- **Fork / rama de QA:** `Javier-Gamez/Five-Nights-at-ESCOM`, rama `qa/pause-menu-static-review` (fork sincronizado con `Alexis177/main`, mismo SHA)
- **SHA base analizado:** `14d2cb7c44c5f0085e150f7efaa675b75e3ce163` (`main`)
- **Entorno de referencia (según docs del proyecto):** Windows, GameMaker LTS IDE 2026.0.0.16, runtime 2026.0.0.23
- **Validación automática:** `python tools/validate_project.py` → pasa (1174 recursos, orden de salas, marcadores de conflicto). No compila ni ejecuta el juego.

## 1. Alcance y criterios de aceptación

| ID | Criterio |
|---|---|
| CA-1 | Con ESC o P en `Culturales1`, el juego se pausa (reloj, batería y enemigos congelados) y al repetir la tecla se reanuda. |
| CA-2 | "Salir al Menú" lleva a `MenuPrincipal` y una nueva partida inicia sin estado de pausa. |
| CA-3 | Al llegar la batería a 0 ocurre: pantalla negra → screamer → Game Over (≈6 s). |
| CA-4 | Ctrl+Shift+N durante una ronda con energía muestra la victoria de 6 AM; no actúa durante el apagón. |

## 2. Matriz de riesgos

| ID | Riesgo | Impacto | Caso que lo cubre |
|---|---|---|---|
| R-1 | El audio sigue sonando en pausa o en el menú (no hay `audio_pause_all`/`audio_stop_all` en la pausa). | Medio | QA-05 |
| R-2 | Cambiar el `depth` de todas las capas de `Culturales1` altera el orden de dibujo de cámaras. | Medio | QA-06 |
| R-3 | `instance_activate_all()` reactiva instancias desactivadas a propósito (descartado estáticamente, ver H-8). | Bajo | QA-03 |
| R-4 | El estado `global.game_paused` o la batería quedan sucios tras salir al menú. | Alto | QA-04 |
| R-5 | El atajo se usa durante la pausa o con la tecla mantenida. | Bajo | QA-07 |

## 3. Casos de prueba

Campos comunes a llenar al ejecutar: autor, fecha, SHA probado, versión, evidencia (liga).

| ID | Cubre | Pasos | Esperado | Resultado real | Estado |
|---|---|---|---|---|---|
| QA-01 Ruta feliz | CA-1 | 1. Nuevo Juego. 2. Pulsar ESC. 3. Observar reloj/batería 10 s. 4. Pulsar P. | Todo se congela en pausa y continúa al reanudar. | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |
| QA-02 Límite | CA-1 | Pulsar ESC y P repetidamente en ráfaga. | Alterna sin quedar bloqueado. | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |
| QA-03 Estado/cámaras | CA-1, R-3 | Abrir cámaras, pausar, reanudar. | Se conserva la cámara y el estado del láser. | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |
| QA-04 Salir al menú | CA-2, R-4 | Pausar, "Salir al Menú", Nuevo Juego. | Menú correcto; batería llena; sin pausa. | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |
| QA-05 Audio | R-1 | Pausar con música/sonidos activos; luego salir al menú. | El audio se detiene en pausa y no continúa en el menú. | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |
| QA-06 Regresión visual | R-2 | Recorrer cámaras 10 a 18 antes/después del commit `14d2cb7`. | Mismo orden de dibujo. | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |
| QA-07 Atajo | CA-4, R-5 | Ctrl+Shift+N con energía; en pausa; manteniendo N; durante apagón. | Victoria una sola vez; ignorado en pausa y apagón. | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |
| QA-08 Apagón | CA-3 | Agotar la batería. Pausar durante el apagón y reanudar. | Secuencia completa hasta Game Over. | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |
| QA-09 Accesibilidad | — | Texto ampliado del sistema; intentar salir solo con teclado. | Documentar: hoy "Salir al Menú" solo responde al mouse. TalkBack no aplica (Windows). | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |
| QA-10 Entorno | — | Repetir QA-01 en otra resolución/escala de pantalla. | Overlay y botón alineados. | No ejecutado: sin entorno de GameMaker disponible | Bloqueado |

## 4. Hallazgos del análisis estático (reales)

| # | Hallazgo | Severidad | Estado |
|---|---|---|---|
| H-1 | La pausa no pausa el audio: no hay `audio_pause_all` en el proyecto. | Media | Confirmado en código; falta verificar al oído (QA-05) |
| H-2 | "Salir al Menú" solo acepta mouse; posiciones fijas, sin considerar texto ampliado. | Media | Confirmado en código |
| H-3 | `Culturales1.yy` desplaza el `depth` de todas las capas en el commit de la pausa. | Media | Por verificar (QA-06) |
| H-4 | Ctrl+Shift+N es un atajo de trampa disponible en cualquier compilación. | Baja | Confirmado; intencional según issue #2 |
| H-5 | El commit `3b65c65` reformatea ~1180 archivos de recursos y ensucia el diff. | Media (proceso) | Confirmado |
| H-6 | El README indica cambiar a `feature/1-energy-blackout`, rama ya fusionada. | Baja | Confirmado |
| H-8 | Verificación estática de R-3: ningún otro objeto usa `instance_deactivate_*`, por lo que `instance_activate_all()` no reactiva instancias desactivadas a propósito. | — | Riesgo descartado por lectura de código |
| H-9 | Verificación estática de R-4: `obj_pauseManager` reinicia `global.game_paused` en su Create y `obj_Culturales1` reinicia `global.EnergyBlackout` en su Create, por lo que el estado debería limpiarse al entrar de nuevo a la sala. | — | Mitigado en código; falta confirmar en ejecución (QA-04) |
| H-10 | 32 objetos reproducen audio y ninguno se pausa con el menú de pausa (refuerza H-1). | Media | Confirmado en código |
| H-7 | La pausa no tiene casos en `docs/pruebas.md`. | Alta (proceso) | Cubierto por este plan |

## 5. Limitaciones

- La CI solo valida integridad de archivos; no compila ni ejecuta GameMaker.
- Este documento no contiene resultados de ejecución. QA-01 a QA-10 están bloqueados por falta de entorno y no cuentan como ejecutados. Cuando alguien los ejecute, se actualiza la columna de resultado, el estado y la evidencia.

## 6. Dictamen preliminar

**No integrar la pausa hasta ejecutar QA-01 a QA-08 y resolver o aceptar H-1 y H-3.** El apagón y el atajo tienen evidencia documentada previa por sus autores.
