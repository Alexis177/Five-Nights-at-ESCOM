# Plan de QA — Apagón por energía agotada y atajo de victoria (Alexis177)

- **Aportes revisados:** [PR #3](https://github.com/Alexis177/Five-Nights-at-ESCOM/pull/3) (apagón, issue #1) y [PR #4](https://github.com/Alexis177/Five-Nights-at-ESCOM/pull/4) (atajo Ctrl+Shift+N, issue #2), ambos fusionados en `main`.
- **SHA base (antes de los cambios):** `9c6fc59`
- **SHA a probar:** `14d2cb7` (`main` actual; contiene #3, #4 y el menú de pausa)
- **Autor del plan:** jesusGoliat
- **Estado del plan:** escrito **antes** de ejecutar. Ningún caso se ha ejecutado todavía; la columna «Real» se llena solo después de ejecutar en GameMaker.

## 1. Criterios de aceptación y riesgos

| ID | Criterio / riesgo | Casos |
|----|-------------------|-------|
| CA1 | **Éxito (issue #1):** cuando la energía llega a cero, se desactivan la cámara y el láser y aparece el apagón | QA-A01, QA-A03 |
| CA2 | **Éxito (issue #1):** cuando termina la espera del apagón, se reproduce el screamer y después aparece Game Over | QA-A01 |
| CA3 | **Límite (issue #1):** al iniciar una partida nueva después de perder, se restauran la energía y los controles | QA-A02 |
| CA4 | **Éxito (issue #2):** una pulsación de Ctrl+Shift+N activa la victoria de 6 AM una sola vez | QA-A04, QA-A05 |
| CA5 | **Límite (issue #2):** el atajo no funciona durante el apagón, en Game Over ni en el menú | QA-A06 |
| R1 | El apagón no se activa, o se activa dos veces, cuando la cámara y el láser consumen al mismo tiempo (impacto alto) | QA-A03 |
| R2 | El indicador de batería muestra un nivel incorrecto con el nuevo cálculo por rangos `ceil(Bateria / 2880)` (medio) | QA-A07 |
| R3 | Victoria y apagón ocurren en el mismo cuadro y se mezclan los dos finales (medio) | QA-A06, QA-A08 |
| R4 | El atajo se repite al mantener las teclas o se activa con combinaciones parciales (bajo) | QA-A05 |
| R5 | El atajo de tres teclas no se puede usar con las teclas especiales de Windows (accesibilidad, bajo) | QA-A09 |

## 2. Entorno y preparación

| Elemento | Valor previsto |
|----------|----------------|
| SO | Windows 10/11 |
| IDE / runtime | GameMaker LTS IDE 2026.0.0.16 y runtime 2026.0.0.23 (las mismas versiones que documentó el autor) |
| Destino | Windows (botón Run del IDE) |
| Pantalla | Registrar resolución y escala de Windows al ejecutar |

**Preparación:**
1. `git clone https://github.com/Alexis177/Five-Nights-at-ESCOM.git`
2. `git checkout 14d2cb7` (o `9c6fc59` para la ejecución de referencia).
3. Abrir `Five Nights at ESCOM.yyp` en GameMaker, destino Windows, Run.
4. Abrir la ventana *Output* del IDE para ver los mensajes `[EnergyBlackout v2]`.

**Datos útiles para planear los tiempos** (tomados del código):
- La batería empieza en `14400` (`obj_Culturales1/Create_0.gml`) y baja 1 por cuadro por cada herramienta activa. A 60 FPS (`option_game_speed`), dura unos **4 min** con una herramienta y unos **2 min** con cámara y láser juntos.
- Cada hora del reloj dura `3600` cuadros (unos 60 s); las 6 AM llegan a los **9 min** aproximadamente.
- El apagón dura `game_get_speed(gamespeed_fps) * 6` cuadros, es decir, **6 s**.

## 3. Ejecución de referencia en la base (`9c6fc59`)

Pendiente. Antes de probar `14d2cb7` hay que ejecutar la base para registrar el comportamiento original:

| Entrada | Esperado según el issue #1 | Real | Evidencia |
|---------|----------------------------|------|-----------|
| Agotar la batería con cámara y láser | La cámara y el láser dejan de funcionar, pero la ronda sigue | Pendiente | Pendiente |
| Pulsar Ctrl+Shift+N durante la ronda | No pasa nada (el atajo no existe en la base) | Pendiente | Pendiente |

## 4. Fichas de casos

**Datos comunes de las fichas:** SHA `14d2cb7`; entorno de la sección 2; autor y fecha se registran al ejecutar.

**QA-A01: Ruta feliz del apagón** (CA1, CA2). ⏳ **Pendiente**.

**Precondiciones y datos:** partida nueva desde «Nuevo Juego»; batería llena.

**Pasos:**
1. Activar la cámara y el láser y mantenerlos activos hasta que la batería llegue a cero (unos 2 min).
2. Intentar abrir la cámara y activar el láser cuando la batería esté en cero.
3. Contar el tiempo de pantalla negra.
4. Observar lo que sigue hasta llegar a Game Over.

**Esperado:** al llegar a cero, la cámara y el láser dejan de responder, todo el audio se detiene y la pantalla queda negra unos 6 s; después aparece el screamer y luego Game Over. En *Output* aparecen `blackout started` y `starting screamer, followed by Game Over`.

**Real:** pendiente.

**Evidencia:** video del paso 1 al 4 y captura del *Output* (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-A02: Partida nueva después de perder** (CA3). ⏳ **Pendiente**.

**Precondiciones y datos:** haber terminado QA-A01 en Game Over.

**Pasos:**
1. Esperar a que Game Over regrese al menú principal.
2. Elegir «Nuevo Juego».
3. Revisar el indicador de batería.
4. Abrir la cámara y activar el láser.

**Esperado:** la batería empieza llena (5 barras), la cámara y el láser responden y no hay pantalla negra.

**Real:** pendiente.

**Evidencia:** capturas de los pasos 3 y 4 (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-A03: Límite, dos consumidores al mismo tiempo** (CA1, R1). ⏳ **Pendiente**.

**Precondiciones y datos:** partida nueva.

**Pasos:**
1. Activar la cámara y el láser al mismo tiempo durante toda la partida.
2. Al llegar a cero, revisar el *Output*.

**Esperado:** el apagón empieza una sola vez (un solo `blackout started`) aunque los dos consumidores restaran en el mismo cuadro, y la batería nunca queda negativa.

**Real:** pendiente.

**Evidencia:** captura del *Output* (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-A04: Ruta feliz del atajo** (CA4). ⏳ **Pendiente**.

**Precondiciones y datos:** partida nueva con batería por encima de cero; reloj antes de las 6 AM.

**Pasos:**
1. Pulsar Ctrl+Shift+N una vez.
2. Observar el reloj y la sala que aparece.

**Esperado:** el reloj muestra 6 AM y aparece la sala de victoria una sola vez.

**Real:** pendiente.

**Evidencia:** captura de la victoria (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-A05: Límite, teclas mantenidas y combinaciones parciales** (CA4, R4). ⏳ **Pendiente**.

**Precondiciones y datos:** partida nueva con batería.

**Pasos:**
1. Pulsar Ctrl+N y luego Shift+N.
2. Mantener Ctrl+Shift y pulsar N dos veces seguidas.
3. Mantener Ctrl+Shift+N presionadas varios segundos.

**Esperado:** el paso 1 no hace nada. En los pasos 2 y 3 la victoria ocurre una sola vez y no se repite.

**Real:** pendiente.

**Evidencia:** video corto (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-A06: Condición alterna, atajo fuera de la ronda** (CA5, R3). ⏳ **Pendiente**.

**Precondiciones y datos:** partida en curso con forma de agotar la batería.

**Pasos:**
1. En el menú principal, pulsar Ctrl+Shift+N.
2. Agotar la batería y, durante la pantalla negra, pulsar Ctrl+Shift+N.
3. En Game Over, pulsar Ctrl+Shift+N.

**Esperado:** en los tres pasos el atajo se ignora; la secuencia de derrota llega a Game Over sin interrupción.

**Real:** pendiente.

**Evidencia:** video del paso 2 (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-A07: Regresión, consumo e indicador de batería** (R2). ⏳ **Pendiente**.

**Precondiciones y datos:** ejecutar en la base `9c6fc59` y en `14d2cb7`, con las mismas acciones.

**Pasos:**
1. Activar solo la cámara.
2. Cada 48 s (`2880` cuadros), anotar cuántas barras muestra la batería.
3. Repetir en el otro SHA.

**Esperado:** en ambos SHA el indicador baja de 5 a 1 barra en los mismos momentos aproximados; la cámara y el láser funcionan igual mientras hay batería.

**Real:** pendiente.

**Evidencia:** capturas antes y después en condiciones comparables (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-A08: Navegación y estado, la ventana pierde el foco** (R3). ⏳ **Pendiente**.

La orientación no aplica porque el destino es Windows. En su lugar se prueba la pérdida de foco de la ventana.

**Precondiciones y datos:** partida en curso.

**Pasos:**
1. Durante la pantalla negra del apagón, pulsar Alt+Tab, esperar 10 s y volver al juego.
2. En otra partida, minimizar la ventana, volver y pulsar Ctrl+Shift+N.
3. Dejar que el reloj llegue a las 6 AM con la batería casi agotada, si el tiempo lo permite.

**Esperado:** el apagón termina en Game Over una sola vez; el atajo funciona igual después de volver; nunca aparecen la victoria y la derrota juntas.

**Real:** pendiente.

**Evidencia:** video (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-A09: Accesibilidad, texto ampliado y teclas especiales** (R5). ⏳ **Pendiente**.

**Precondiciones y datos:** Windows con el tamaño de texto al máximo (*Configuración → Accesibilidad → Tamaño del texto*) y con las **teclas especiales** activadas (*Accesibilidad → Teclado*).

**Pasos:**
1. Iniciar una partida y revisar si el indicador de batería y el reloj siguen legibles.
2. Con teclas especiales, pulsar Ctrl, después Shift y después N, una a la vez.
3. Agotar la batería y revisar que la pantalla negra cubra toda la ventana.

**Esperado:** registrar si el juego respeta el tamaño de texto del sistema; el atajo funciona con teclas especiales; la pantalla negra cubre todo.

**Real:** pendiente.

**Evidencia:** capturas (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-A10: Entorno, otra resolución o escala** (CA1, CA4). ⏳ **Pendiente**.

**Precondiciones y datos:** cambiar la escala de pantalla de Windows (por ejemplo de 100 % a 150 %) o la resolución.

**Pasos:**
1. Repetir QA-A01 hasta la pantalla negra.
2. Repetir QA-A04.

**Esperado:** la pantalla negra cubre toda la ventana y la victoria por atajo se comporta igual que en la escala original.

**Real:** pendiente.

**Evidencia:** capturas con la escala visible (pendiente).

**Defecto y decisión:** pendiente.

## 5. Checks automáticos

| Check | Estado | Qué cubre |
|-------|--------|-----------|
| `python3 tools/validate_project.py` en `14d2cb7` (local, Python 3.12.3) | ✅ `Validated 1174 resource files, room order and GML conflict markers.` | Integridad de recursos, orden de salas y marcadores de conflicto |
| Workflow `GameMaker project integrity` | Ejecuta el mismo script en cada push y PR | Igual que arriba |

**Qué no cubren:** no compilan ni ejecutan GameMaker. No prueban el apagón, el atajo ni ningún comportamiento del juego; para eso son los casos de la sección 4.

## 6. Hallazgos del análisis estático

Estos hallazgos salen de leer el código y el historial, no de ejecutar el juego.

| ID | Hallazgo | Severidad | Estado |
|----|----------|-----------|--------|
| HS-A1 | El PR #4 dice «Keep this PR in Draft until outstanding QA and peer review are complete», pero se fusionó sin ninguna revisión | Media (proceso) | Confirmado en GitHub |
| HS-A2 | Los PR #3 y #4 indican que la validación desde un clon limpio quedó pendiente; las pruebas se hicieron sobre una copia local con los dos cambios juntos | Media | Confirmado en la descripción de los PR; se cubre con QA-A01 a QA-A06 sobre `14d2cb7` |
| HS-A3 | Si la batería llega a cero en el mismo cuadro en que la alarma de `obj_WinTimer` marca las 6 AM, la alarma corre antes que el *End Step* de `obj_BatCheck`: la sala cambia a `Win` y `global.EnergyBlackout` queda en `true` hasta la siguiente partida | Baja | Por verificar en ejecución (QA-A08) |

## 7. Dictamen

**Sin dictamen todavía.** No se puede recomendar ni rechazar la integración porque ningún caso se ha ejecutado. Al ejecutar, se llenan los resultados reales y se cierra esta sección con la recomendación y los riesgos que queden.
