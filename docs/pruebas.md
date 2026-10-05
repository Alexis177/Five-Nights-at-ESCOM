# Pruebas de ejecución — Entrega 1

Realicé estas comprobaciones el 4 de octubre de 2026 en Windows, con GameMaker LTS IDE 2026.0.0.16 y runtime 2026.0.0.23. Utilicé la copia local del proyecto, que contiene el apagón y el atajo de victoria. Los resultados corresponden a esa ejecución manual.

| Caso | Procedimiento | Resultado esperado | Resultado observado |
|---|---|---|---|
| Inicio | Abrir el juego y seleccionar Nuevo Juego | Entrar a la partida | Se mostró la oficina con reloj y batería |
| Cámara | Abrir y cerrar la vigilancia durante la partida | Mostrar cámaras y regresar a la oficina | La interfaz respondió |
| Láser | Activar y desactivar el láser con energía | Cambiar su estado | El control respondió |
| Comportamiento original | Agotar la batería antes de modificar el juego | Registrar la reacción original | Cámara y láser dejaron de funcionar; la oficina siguió visible |
| Apagón modificado | Agotar la batería con el cambio instalado | Pantalla negra, screamer y Game Over, en ese orden | Comprobé la secuencia en ese orden |
| Nueva partida | Iniciar otra partida tras la derrota | Restaurar energía y controles | Batería llena, controles activos y pantalla normal |

También comprobé que el juego funciona sin Wi-Fi. Esta observación se limita al funcionamiento local del juego.

[Capturas del funcionamiento original y video del cambio](evidencia/entrega-1/README.md).

La validación automática revisa la integridad de recursos, las referencias de salas y los marcadores de conflicto en GML. No compila ni ejecuta GameMaker.

Utilicé IA como apoyo en el código y la documentación.
