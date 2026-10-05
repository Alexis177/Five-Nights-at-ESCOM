# Five Nights at ESCOM

Adapté el proyecto de [gabrielhuav](https://github.com/gabrielhuav/Five-Nights-at-ESCOM) para que agotar la energía termine la ronda mediante un apagón, el screamer existente y la pantalla de Game Over.

## Abrir y ejecutar

El entorno utilizado para las pruebas fue Windows, GameMaker LTS IDE **2026.0.0.16** y runtime **2026.0.0.23**.

1. Clonar el repositorio: `git clone https://github.com/Alexis177/Five-Nights-at-ESCOM.git`.
2. Entrar a la carpeta: `cd Five-Nights-at-ESCOM`.
3. Para revisar el apagón de este PR, ejecutar `git switch feature/1-energy-blackout`.
4. Abrir `Five Nights at ESCOM.yyp` desde GameMaker.
5. Seleccionar Windows como destino y ejecutar con el botón Run.
6. Seleccionar Nuevo Juego. Utilizar las cámaras y el láser hasta agotar la batería para comprobar la secuencia.

La ejecución manual documentada se realizó sobre la copia local LTS. Las instrucciones anteriores permiten obtener la rama desde Git.

## Documentación

- [Idea y criterios del cambio](docs/idea.md).
- [Bosquejos, controles y flujo de pantallas](docs/diseno/README.md).
- [Estructura y recorrido del código](docs/arquitectura.md).
- [Pruebas realizadas](docs/pruebas.md).
- [Evidencias antes y después](docs/evidencia/entrega-1/README.md).
- [Procedencia de recursos](docs/licencias.md).

El [PR del atajo de victoria](https://github.com/Alexis177/Five-Nights-at-ESCOM/pull/4) contiene el cambio independiente para finalizar la ronda con Ctrl+Shift+N.

## Validación automática

Con Python 3, ejecutar `python tools/validate_project.py` desde la raíz. GitHub Actions ejecuta esta comprobación al publicar cambios y abrir un PR. Revisa integridad del proyecto; la ejecución del juego se comprueba en GameMaker.

## Referencia de configuración

[Video de configuración incluido en el repositorio original](https://www.youtube.com/watch?v=wNQGLxLh3lc).

Utilicé IA como apoyo en el código y la documentación.
