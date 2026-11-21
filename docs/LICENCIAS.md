# Licencias y procedencia

Estado al 8 de noviembre de 2026. Este documento resume lo que consta en el repositorio y en el expediente de publicación. No asigna licencias ni sustituye las de terceros.

## Código y proyecto

- El repositorio **no declara una licencia de código abierto**. El proyecto original (2025) es de Carlos Adrián Hernández Torres. Gabriel Hurtado Avilés continúa el proyecto con el permiso verbal del autor, como se indica en [AUTHORS.md](../AUTHORS.md).
- Las aportaciones de los alumnos llegan mediante Pull Requests y se acreditan en el [README](../README.md) y en el historial de Git.

## Recursos

- La procedencia y las condiciones de música, sonidos, fotografías, gráficos y video se registran en el expediente local de publicación, que no se versiona. Según [AUTHORS.md](../AUTHORS.md), el 23 de octubre de 2026 el responsable confirmó que disponen de creaciones propias con permiso para distribuirlas en Google Play. Las autorizaciones concretas se revisan archivo por archivo.
- Para la versión 0.1.1, el propietario confirmó el permiso de distribución de los nuevos recursos del Intruso: `sounds/snd_IntrusoJS`, `sprites/spr_Intruso`, `sprites/spr_IntrusoJS` y `sprites/spr_IntrusoGO`.
- El ícono Android de pixel art rojo lo eligió Gabriel Hurtado Avilés el 24 de octubre de 2026 entre propuestas generadas con IA a partir del ícono original. No cambia los créditos del juego original.

### Inventario de procedencia para distribución

| Recursos | Procedencia o permiso documentado | Atribución y evidencia |
|---|---|---|
| Música de menú, oficina y créditos, y sonidos del juego original | El propietario confirmó el permiso de distribución de los archivos enumerados en el inventario de publicación. | Expediente de publicación, `inventario_recursos.md`. Falta confirmar la autoría individual y las condiciones de cada pista. |
| `sounds/snd_IntrusoJS`, `sprites/spr_Intruso*` | Recursos de la Noche 2 con permiso de distribución confirmado por el propietario. | Créditos de la Noche 2 en el README e historial del PR #4. |
| Sprites originales de oficina, cámaras, personajes, menú e interfaz | El repositorio original identifica al autor del proyecto. Falta documentar la procedencia individual de las fotografías y composiciones. | Conservar los créditos del autor original. Ver `AUTHORS.md` e `inventario_recursos.md` del expediente. |
| `datafiles/vd_PSJS1.mp4` | Video del proyecto original. Falta documentar el origen y permiso específicos de la imagen y el audio. | Seguimiento en `inventario_recursos.md` del expediente. |
| `fonts/fnt_Privacidad` | El recurso de GameMaker declara Arial. Las condiciones aplicables a los glifos compilados están pendientes de documentar. | `fonts/fnt_Privacidad/fnt_Privacidad.yy`. |
| `options/android/icons*` | Variante pixel art seleccionada por el propietario a partir del ícono original. | `AUTHORS.md` y materiales de la ficha en el expediente. |

## Motor

El juego se crea con GameMaker (YoYo Games). Los ejecutables generados incluyen el runtime de GameMaker y se rigen por sus términos de uso.

## Antes de agregar recursos

Incluye en el PR el origen de cada recurso nuevo (autor, enlace o declaración de creación propia) y la licencia o permiso que autoriza distribuirlo en Google Play.
