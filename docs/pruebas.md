# Matriz de pruebas — Entrega 1

Pruebas manuales realizadas y reportadas por Alexis177 durante esta conversación; el asistente no ejecutó GameMaker. Destino observado: Windows. Versiones exactas de Windows, IDE LTS y runtime: pendientes. El proyecto probado es la copia LTS local, con ambas características; falta repetir desde el clon de cada PR. Los commits se identificarán mediante las ligas de los PR.

| Caso | Pasos | Esperado | Resultado real | Estado |
|---|---|---|---|---|
| Flujo principal | Nueva partida, abrir/cerrar cámara y activar/desactivar láser | Controles responden y batería disminuye | Confirmado por el usuario | Confirmado manualmente |
| Agotamiento | Usar herramientas hasta vaciar batería | Oscuridad → screamer → Game Over | Orden confirmado por el usuario; video adjunto | Confirmado manualmente |
| Reinicio | Tras derrota, iniciar Nuevo Juego | Batería llena, controles activos, pantalla normal | Las tres condiciones confirmadas | Confirmado manualmente |
| Sin red | Ejecutar y jugar sin Wi-Fi | Juego local funcional | Usuario confirma funcionamiento; pasos detallados pendientes | Confirmación parcial |
| Datos inválidos | En depurador, energía negativa | Normaliza a cero y activa apagón sin error | No ejecutado | Pendiente |
| Rotación/recreación | Probar en destino aplicable; documentar política de estado | Sin crash ni interfaz inutilizable | No ejecutado; reiniciar aplicación no sustituye recreación móvil | Pendiente |
| Texto ampliado | Aumentar escala/texto y comprobar controles | Legibilidad y controles utilizables | No ejecutado | Pendiente |
| Accesibilidad | Revisar etiquetas, contraste y área táctil | Controles identificables y usables | No ejecutado | Pendiente |
| Umbrales y fin simultáneo | Dos consumidores cerca de cero; victoria coincidente | Una salida coherente sin valores negativos | No ejecutado de forma dirigida | Pendiente |

Evidencia: [video de agotamiento](evidencia/entrega-1/06-apagon-screamer-gameover.mp4). El archivo se copió íntegro; el asistente no pudo reproducirlo. No sustituye la captura individual con identificación del equipo.

CI valida recursos del proyecto, orden de salas y ausencia de marcadores de conflicto en GML. No compila ni ejecuta GameMaker.

Uso de IA: Codex de OpenAI asistió en análisis, implementación, corrección, documentación y preparación de CI/PR. Las confirmaciones de ejecución fueron aportadas por el usuario.
