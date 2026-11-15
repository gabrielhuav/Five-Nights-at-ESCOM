# Five Nights at ESCOM — trabajo autorizado

**PR #6 y PR #7 integrados.** Opciones, pausa táctil y correcciones de ú/audio están en `main`; CODEOWNERS requiere revisión de @gabrielhuav. Preparando Android0.1.10/1010. Play sigue en0.1.1/1001; no hay nuevo envío a revisión ni publicación. Consultar el estado vigente de publicación.

## Estado posterior verificado · 14 nov 2026, por la noche

- El propietario ya fusionó PR #6: `ae1037c`, árbol de juego idéntico a `6b76378` probado. Incluye ú y audio; no incluye ajuste de sincronización.
- PR #7 (`.github/CODEOWNERS`: `* @gabrielhuav`) fusionado con autorización expresa: `c267873`. Main exige PR, una aprobación del propietario, revisión nueva tras cambios, conversaciones resueltas y checks `project-integrity` / `validate-gamemaker-project` actualizados. Reglas activas ID27289829. La excepción del administrador sólo opera mediante PR; evita impedir al propietario integrar sus propios PR aprobados expresamente.
- Actualización en preparación: rama `codex/play-options-update`, commit de versión `a7bee92`, Android0.1.10/1010. Máximo Console comprobado1001;1002–1009 consumidos localmente. AAB generado, validado, cargado y guardado como un cambio pendiente de revisión en Alpha; no enviado a revisión ni publicado. Ver `docs/publicacion/ACTUALIZACION_0.1.10_2026-11-14.md`.
- La solicitud del propietario cubre preparar la actualización y documentar pasos reales. Se requiere autorización expresa final para enviarla a revisión; publicación administrada desactivada: Google podría activar Alpha automáticamente al aprobar.
- Este bloque sustituye las notas históricas siguientes que dicen «PR listo / no fusionado».

## Repositorio y conservación

- Trabajar exclusivamente en el fork https://github.com/gabrielhuav/Five-Nights-at-ESCOM. `origin` debe apuntar a ese fork. No hacer push ni abrir PR contra `upstream` (autor original).
- Comprobar estado, remotos y ramas antes de modificar. Conservar cambios ajenos y créditos de Carlos Adrián Hernández Torres y colaboradores.
- Proyecto GameMaker: `Five Nights at ESCOM.yyp`. No aplicar procedimientos de compilación KMP o Flutter a este proyecto.
- Revisar `docs/publicacion/ACTUALIZACION_PLAY_STORE.md` antes de preparar la siguiente actualización.
- Conservar el formato nativo de GameMaker en `.yy`, `.yyp` y `.resource_order` (comas finales; una instancia por línea en salas). No reescribirlos con herramientas JSON. Validar con `python tools/validate_project.py`. Evitar rutas que sólo difieran en mayúsculas.

## Estado aclarado al 14 de noviembre de 2026

- **Ya lanzado en la prueba cerrada de Play:** 0.1.1 (1001), Noche 2, Intruso, guardado y Continuar, desde `0adaaaa`. Envío documentado el 7 nov; lanzamiento confirmado por el propietario el 8 nov. **El 14 nov la IA verificó directamente 1001/0.1.1 Activo en Console**, con 1000/0.1.0 Inactivo. No confundirlo con producción abierta.
- **Cambios posteriores, fuera de esa publicación:** PR #2 (pausa, apagón y atajo) en `main`; PR #6 (Opciones y pausa táctil) en `feature/options-menu`, commit `7c094f8`. El usuario autorizó compilar y probar el PR #6 el 14 nov; esto no autoriza un nuevo envío a Play.
- Contexto adicional: `C:\Users\gabri\Downloads\1151055 Administracion\README_PARA_IAS_PUBLICACION_GOOGLE_PLAY.md`. Informe y presentación de la actualización ya realizada: `Publicacion Five Nights at ESCOM\Actualizacion Noche 2` dentro de esa carpeta.

- Play: 0.1.0 (código 1000, `5808e2c`) y 0.1.1 (código 1001, `0adaaaa`, Noche 2 e Intruso) ya enviadas a la prueba cerrada Alpha. La 0.1.1 se envió a revisión el 7 nov; el propietario informó su lanzamiento el 8 nov y la IA la verificó Activo en Console el 14 nov.
- `main` = release 0.1.1 + PR #2 integrado (pausa ESC/P, apagón por batería, atajo Ctrl+Shift+N) + controlador de pausa no persistente. Esos cambios no están publicados en Play. El 14 nov se compiló y probó parte de su comportamiento dentro de la rama del PR #6 en Windows, no en Android.
- PR #6, base `7c094f8`, correcciones en el PR `6b76378`: ú completa y salida de agradecimientos respetando volumen; sin ajuste de sincronización. APK final **0.1.9 (1009)** probado en FiveNightsESCOM_Test; regresión instrumentada1008 aprobó33 comprobaciones a0/10/100 %. Antes se probó1007 en emuladores4KB/16KB. Ver `docs/pruebas-pr-6-2026-11-14.md`. No se usó S22+ en estas repeticiones; no hay AAB/envío. Códigos locales1002–1009 consumidos; no reutilizarlos. El PR remoto ya incluye6b76378, por excepción expresa del propietario para esa rama y esas dos correcciones. CI aprobada, CLEAN/MERGEABLE, listo para unirse; no se ha fusionado. La excepción no autoriza otras escrituras en forks ajenos.
- GitHub Pages publica la política desde `prepare/google-play-closed-test:/docs`: no borrar esa rama; cambiar la fuente de Pages requiere autorización. `prepare/android-night2-update` conserva el commit exacto de la 0.1.1. Se comprobó directamente que PR #6 apunta a `main`, es MERGEABLE y su fuente es `TheMike54/Five-Nights-at-ESCOM:feature/options-menu`. La excepción expresa para subir6b76378 a esa rama ya se aplicó; mantener la restricción general de trabajar sólo en el fork autorizado para otras acciones. El destino actual del PR #5 no se comprobó en esta sesión.

## Firma y publicación

- Nunca buscar, leer, registrar, mostrar o versionar contraseñas. El propietario las introduce localmente.
- Llave de carga existente fuera del repo: `C:\Users\gabri\.android\keystores\five-nights-at-escom-upload.jks`; alias `upload-five-nights-at-escom`. No crear otra ni reutilizar llaves de otros proyectos.
- Conservar paquete `ovh.gabrielhuav.fivenightsatescom`, ícono pixel art rojo, privacidad y permisos mínimos de la preparación Android anterior.
- Comprobar el código máximo de versión en Play antes de elegir uno mayor. Los códigos 1000 y 1001 ya se utilizaron; nunca reusarlos para otra compilación.
- Pedir autorización expresa antes de cambiar de cuenta, enviar a revisión, publicar o publicar una política web. Una autorización anterior de envío no autoriza automáticamente el envío de una nueva versión. Explicar si la aprobación puede activar el lanzamiento automáticamente.
- No garantizar aprobación de Google ni presentar una versión guardada o en revisión como publicada.
- No leer ni capturar correos de estudiantes ni enviarles mensajes sin instrucción expresa. Reutilizar la lista existente26-O Y2027-1; no crear/importar otra.

## Documentación de la actualización

- El usuario solicitó una presentación nueva que documente pasos reales de actualización usando como referencia visual:
  `C:\Users\gabri\Downloads\Planeacion Didactica Android 27-1\ENTREGA_FINAL\Con_autor\Unidad_5\05_Tutorial_Publicar_en_Google_Play_KMP_Flutter_DAMN.pptx`.
- Conservar el original y otros PPTX/DOCX. Crear una presentación separada, adaptada a GameMaker y a actualizar un juego ya existente en Play.
- Mantener formato institucional, autoría, capturas completas y focos editables. Añadir acciones, comprobación y resultado real de cada paso. No simular capturas ni declarar pruebas o publicaciones no realizadas.
- Guardar capturas PNG numeradas, ancho máximo1600px e índice en la carpeta de publicación del usuario. No mostrar secretos ni correos de estudiantes.
