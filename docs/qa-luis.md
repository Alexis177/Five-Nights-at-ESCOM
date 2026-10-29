# Plan de QA — Menú de pausa (luisAgt)

- **Aporte revisado:** commit [`14d2cb7`](https://github.com/Alexis177/Five-Nights-at-ESCOM/commit/14d2cb7c44c5f0085e150f7efaa675b75e3ce163) «feat: add pause menu with resume and exit to main menu options». Se subió directo a `main`, sin PR ni issue.
- **SHA base (antes del cambio):** `3b65c65`
- **SHA a probar:** `14d2cb7`
- **Autor del plan:** jesusGoliat
- **Estado del plan:** escrito **antes** de ejecutar. Ningún caso se ha ejecutado todavía; la columna «Real» se llena solo después de ejecutar en GameMaker.
- **Relación con el [PR #5](https://github.com/Alexis177/Five-Nights-at-ESCOM/pull/5) de Javier-Gamez:** ese PR ya revisa la pausa de forma estática. Este plan lo complementa con dos riesgos que no cubre: la instancia persistente del administrador de pausa (R1) y la pausa durante el apagón (R2).

## 1. Criterios de aceptación y riesgos

No hay issue con criterios. Se toman del mensaje del commit («pause menu with resume and exit to main menu options») y del texto que dibuja el menú.

| ID | Criterio / riesgo | Casos |
|----|-------------------|-------|
| CA1 | **Éxito:** ESC o P pausan la partida (todo se congela y aparece «JUEGO EN PAUSA») y otra pulsación la reanuda | QA-L01, QA-L03 |
| CA2 | **Éxito:** «Salir al Menú» lleva al menú principal y una partida nueva empieza sin pausa y con batería llena | QA-L02 |
| R1 | `obj_pauseManager` es **persistente** y sigue vivo fuera de `Culturales1`: ESC/P pausarían el menú, Win o Game Over, y cada partida nueva agregaría otra instancia (impacto alto) | QA-L04 |
| R2 | Pausar durante el apagón oculta la pantalla negra y «Salir al Menú» evita el Game Over (medio) | QA-L05 |
| R3 | El cambio de `depth` de todas las capas de `Culturales1` altera el orden de dibujo (medio) | QA-L06 |
| R4 | El audio sigue sonando en pausa, porque no hay `audio_pause_all` (medio) | QA-L07 |
| R5 | El botón solo responde al mouse y su área no coincide con el dibujo en otra escala (bajo) | QA-L08, QA-L09 |

## 2. Entorno y preparación

| Elemento | Valor previsto |
|----------|----------------|
| SO | Windows 10/11 |
| IDE / runtime | GameMaker LTS IDE 2026.0.0.16 y runtime 2026.0.0.23 (las versiones documentadas en el repo) |
| Destino | Windows (botón Run del IDE) |
| Pantalla | Registrar resolución y escala de Windows al ejecutar |

**Preparación:**
1. `git clone https://github.com/Alexis177/Five-Nights-at-ESCOM.git`
2. `git checkout 14d2cb7` (o `3b65c65` para la ejecución de referencia).
3. Abrir `Five Nights at ESCOM.yyp` en GameMaker, destino Windows, Run.

**Datos útiles para planear los tiempos** (tomados del código): cada hora del reloj dura `3600` cuadros (unos 60 s a 60 FPS) y la batería dura unos 2 min con cámara y láser activos.

## 3. Ejecución de referencia en la base (`3b65c65`)

Pendiente. Antes de probar `14d2cb7` hay que ejecutar la base:

| Entrada | Esperado | Real | Evidencia |
|---------|----------|------|-----------|
| Pulsar ESC y P durante la partida | No pasa nada (la pausa no existe en la base) | Pendiente | Pendiente |
| Recorrer las cámaras 9 a 18 | Registrar el orden de dibujo original para QA-L06 | Pendiente | Pendiente |

## 4. Fichas de casos

**Datos comunes de las fichas:** SHA `14d2cb7`; entorno de la sección 2; autor y fecha se registran al ejecutar.

**QA-L01: Ruta feliz, pausar y reanudar** (CA1). ⏳ **Pendiente**.

**Precondiciones y datos:** partida nueva desde «Nuevo Juego».

**Pasos:**
1. Anotar la hora del reloj y las barras de batería.
2. Pulsar ESC y esperar 70 s (más de una hora del reloj).
3. Revisar el reloj y la batería.
4. Pulsar P.

**Esperado:** en el paso 2 aparece «JUEGO EN PAUSA» sobre fondo oscuro. En el paso 3 el reloj y la batería no cambiaron. En el paso 4 la partida sigue desde donde estaba.

**Real:** pendiente.

**Evidencia:** capturas de los pasos 1, 3 y 4 (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-L02: Ruta feliz, salir al menú** (CA2). ⏳ **Pendiente**.

**Precondiciones y datos:** partida en curso con la batería por debajo de 5 barras.

**Pasos:**
1. Pulsar ESC.
2. Hacer clic en «Salir al Menú».
3. Elegir «Nuevo Juego».
4. Revisar la batería y pulsar una vez ESC y otra vez ESC.

**Esperado:** el paso 2 lleva al menú principal. En la partida nueva la batería está llena, el juego no empieza en pausa y ESC pausa y reanuda con normalidad.

**Real:** pendiente.

**Evidencia:** capturas de los pasos 2 y 4 (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-L03: Límite, pulsaciones repetidas** (CA1). ⏳ **Pendiente**.

**Precondiciones y datos:** partida en curso.

**Pasos:**
1. Pulsar ESC diez veces rápido.
2. Pulsar ESC y P al mismo tiempo.
3. Mantener ESC presionada 5 s.

**Esperado:** cada pulsación alterna una sola vez entre pausa y juego; el paso 2 cuenta como una sola alternancia; mantener la tecla no alterna de forma continua; el juego nunca queda bloqueado.

**Real:** pendiente.

**Evidencia:** video corto (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-L04: Navegación y estado, pausa fuera de la ronda** (R1). ⏳ **Pendiente**.

**Precondiciones y datos:** haber salido al menú con «Salir al Menú» (QA-L02).

**Pasos:**
1. En el menú principal, pulsar ESC.
2. Elegir «Nuevo Juego» y pulsar ESC una vez.
3. Pulsar ESC otra vez para reanudar.
4. Perder la partida y, en Game Over, pulsar ESC.

**Esperado:** en el menú y en Game Over, ESC no pausa nada. En la partida nueva, una pulsación pausa y otra reanuda, igual que en la primera partida.

**Real:** pendiente.

**Evidencia:** video del paso 1 al 4 (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-L05: Condición alterna, pausa durante el apagón** (R2). ⏳ **Pendiente**.

**Precondiciones y datos:** partida con la batería a punto de agotarse.

**Pasos:**
1. Agotar la batería hasta que empiece la pantalla negra.
2. Pulsar ESC durante la pantalla negra y observar qué se ve detrás del menú.
3. Pulsar ESC para reanudar y esperar el resultado.
4. Repetir, pero en el paso 3 hacer clic en «Salir al Menú».

**Esperado:** detrás del menú se mantiene la pantalla negra; al reanudar, el apagón termina en screamer y Game Over. Registrar qué pasa al salir al menú durante el apagón.

**Real:** pendiente.

**Evidencia:** capturas de los pasos 2 y 3 (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-L06: Regresión, orden de dibujo y atajo** (R3). ⏳ **Pendiente**.

**Precondiciones y datos:** ejecutar en la base `3b65c65` y en `14d2cb7`.

**Pasos:**
1. Recorrer las cámaras 9 a 18 y capturar cada una en los dos SHA.
2. En `14d2cb7`, pausar y pulsar Ctrl+Shift+N.
3. Reanudar y pulsar Ctrl+Shift+N.

**Esperado:** las cámaras se ven igual en los dos SHA. En pausa, el atajo se ignora; al reanudar, funciona.

**Real:** pendiente.

**Evidencia:** capturas antes y después en condiciones comparables (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-L07: Condición alterna, audio en pausa** (R4). ⏳ **Pendiente**.

**Precondiciones y datos:** partida con sonido activo (láser encendido o música).

**Pasos:**
1. Pulsar ESC y escuchar 10 s.
2. Hacer clic en «Salir al Menú» y escuchar.

**Esperado:** registrar si el audio se detiene en pausa y si sigue sonando en el menú.

**Real:** pendiente.

**Evidencia:** video con audio (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-L08: Accesibilidad, teclado y texto ampliado** (R5). ⏳ **Pendiente**.

**Precondiciones y datos:** Windows con el tamaño de texto al máximo (*Configuración → Accesibilidad → Tamaño del texto*).

**Pasos:**
1. Pausar y revisar si «JUEGO EN PAUSA», la instrucción y el botón son legibles.
2. Intentar llegar a «Salir al Menú» solo con el teclado (Tab, flechas, Enter).
3. Revisar el contraste del texto blanco sobre el botón gris.

**Esperado:** registrar si el texto cambia con el ajuste del sistema y si el botón es accesible sin mouse.

**Real:** pendiente.

**Evidencia:** capturas (pendiente).

**Defecto y decisión:** pendiente.

---

**QA-L09: Entorno, otra resolución o escala** (R5). ⏳ **Pendiente**.

**Precondiciones y datos:** cambiar la escala de Windows (por ejemplo 150 %) o la resolución, o ejecutar en pantalla completa.

**Pasos:**
1. Pausar.
2. Pasar el mouse sobre las orillas del botón y hacer clic dentro, cerca del borde.

**Esperado:** el menú queda centrado; el botón cambia a rojo justo al entrar en el recuadro dibujado y el clic funciona en todo el recuadro.

**Real:** pendiente.

**Evidencia:** capturas con la escala visible (pendiente).

**Defecto y decisión:** pendiente.

## 5. Checks automáticos

| Check | Estado | Qué cubre |
|-------|--------|-----------|
| `python3 tools/validate_project.py` en `14d2cb7` (local, Python 3.12.3) | ✅ `Validated 1174 resource files, room order and GML conflict markers.` | Integridad de recursos, orden de salas y marcadores de conflicto |
| Workflow `GameMaker project integrity` | Ejecuta el mismo script en cada push y PR | Igual que arriba |

**Qué no cubren:** no compilan ni ejecutan GameMaker, así que no prueban la pausa ni ningún comportamiento del juego.

## 6. Hallazgos del análisis estático

Estos hallazgos salen de leer el código y el historial, no de ejecutar el juego.

| ID | Hallazgo | Severidad | Estado |
|----|----------|-----------|--------|
| HS-L1 | `obj_pauseManager.yy` tiene `"persistent":true` y la instancia está colocada en `Culturales1`. Una instancia persistente sobrevive al cambio de sala, y al volver a `Culturales1` se crea otra | Alta | Por verificar en ejecución (QA-L04) |
| HS-L2 | Al pausar, `instance_deactivate_all(true)` desactiva `obj_BatCheck`, que es quien dibuja la pantalla negra del apagón; por eso no se dibujaría mientras dure la pausa | Baja | Por verificar en ejecución (QA-L05) |
| HS-L3 | La condición `game_paused` agregada en `obj_BatCheck/Step_2.gml` no se alcanza durante la pausa, porque el objeto ya está desactivado. No causa daño | Baja | Confirmado en código |
| HS-L4 | El cambio se subió directo a `main` sin issue, sin PR y sin revisión | Media (proceso) | Confirmado en el historial |
| HS-L5 | El audio no se pausa y «Salir al Menú» solo acepta mouse | Media | Ya reportados como H-1 y H-2 en el PR #5 |

## 7. Dictamen

**Sin dictamen todavía.** No se puede recomendar ni rechazar el cambio porque ningún caso se ha ejecutado. Al ejecutar, se llenan los resultados reales y se cierra esta sección con la recomendación y los riesgos que queden.
