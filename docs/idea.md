# Idea del cambio

Elegí extender Five Nights at ESCOM para trabajar sobre una mecánica observable de administración de energía. El jugador utiliza cámaras y un láser durante una ronda de supervivencia.

**Problema observado:** al agotarse la batería, las herramientas se desactivaban, pero la partida continuaba mostrando la oficina sin una derrota por agotamiento.

Propuse una consecuencia clara: apagar la pantalla, bloquear las herramientas y terminar la ronda mediante el screamer y el Game Over existentes. La tarea principal del jugador es sobrevivir administrando sus recursos.

El criterio de éxito es que una ronda con energía agotada muestre oscuridad → screamer → Game Over, y que una nueva partida recupere su energía y controles. Comprobé este comportamiento mediante ejecución manual el 4 de octubre de 2026; las capturas originales y la grabación están en [evidencias](evidencia/entrega-1/README.md).

## Historia de usuario

Como jugador, quiero que agotar la energía termine la ronda con una secuencia de derrota para reconocer la consecuencia de consumir todos los recursos.

## Criterios de aceptación

- Dado que estoy en una ronda, cuando la energía llega a cero, entonces se desactivan la cámara y el láser y aparece el apagón.
- Dado que comenzó el apagón, cuando termina su espera, entonces se reproduce el screamer y después aparece Game Over.
- Dado que terminó la ronda, cuando inicio una partida nueva, entonces se restauran la energía y los controles.

El alcance de este cambio es la regla de agotamiento y su presentación usando los recursos existentes. El atajo de victoria se desarrolló por separado en la issue #2.

Utilicé IA como apoyo en el código y la documentación.
