# QA — Atajo de victoria (issue #2)

Destino: Windows con GameMaker LTS; IDE 2026.0.0.16 y runtime 2026.0.0.23, segun el usuario. Version exacta de Windows pendiente. Ejecución manual reportada por Alexis177 en la copia local que incluye el apagón. Falta repetir desde el clon de este PR.

| Caso | Pasos | Esperado | Observado |
|---|---|---|---|
| Victoria | Durante ronda con batería positiva, Ctrl+Shift+N | Victoria de 6 AM | Confirmado por usuario y captura |
| Apagón | Pulsar atajo durante apagón | No interrumpe screamer ni derrota | Confirmado por usuario; requiere cambio de issue #1 instalado |
| Tecla sostenida | Mantener combinación | Una transición | Pendiente |
| Menú/derrota | Pulsar fuera de ronda | Sin efecto | Pendiente |
| Reinicio tras atajo | Nueva partida tras victoria | Estado limpio | Pendiente |

Evidencia: [6 AM](evidencia/entrega-1/05-victoria-atajo.png). La captura acredita el resultado; el usuario confirma la pulsación.

CI solo valida integridad de recursos y marcadores de conflicto. No ejecuta GameMaker. Implementación y documentación asistidas por Codex; pruebas reportadas por el usuario. El atajo completa la ronda y vuelve al flujo existente, no implementa desbloqueo de noches nuevas.
