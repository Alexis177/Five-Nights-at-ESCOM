# Pruebas del atajo de victoria

Realicé las pruebas en Windows con GameMaker LTS IDE 2026.0.0.16 y runtime 2026.0.0.23. Utilicé la copia local que contiene tanto el atajo como el apagón.

| Caso | Procedimiento | Resultado esperado | Resultado observado |
|---|---|---|---|
| Victoria | Pulsar Ctrl+Shift+N durante una ronda con energía | Activar la victoria de 6 AM | Se mostró la pantalla de 6 AM |
| Apagón | Pulsar el atajo durante el apagón | Mantener la secuencia de derrota | El atajo no interrumpió la secuencia |

[Captura de la victoria](evidencia/entrega-1/05-victoria-atajo.png). Capturé el resultado después de usar la combinación de teclas.

El atajo completa la ronda mediante el flujo de victoria existente. No añade desbloqueo de nuevas noches. La validación automática comprueba recursos y marcadores de conflicto; no ejecuta GameMaker.

Utilicé IA como apoyo en el código y la documentación.
