# Seguimiento de la auditoría del PR #5

La [auditoría del PR #5](https://github.com/gabrielhuav/Five-Nights-at-ESCOM/pull/5) revisó el código de 0.1.1 en `0adaaaa`. Las correcciones de la siguiente actualización parten de `2fa280c`. El commit del paquete publicado en Alpha, `a7bee92`, sólo difiere de esa base en cinco archivos de documentación.

| Hallazgo | Resultado en la rama base o en los cambios preparados |
|---|---|
| LOGIC-01 | Integrado desde el PR #2. La batería se limita a cero y los umbrales aceptan valores intermedios. |
| LOGIC-02 | Continuar detiene la música del menú antes de entrar a la Noche 2. |
| LOGIC-03 | El fundido de los créditos modifica sólo la reproducción activa y conserva el volumen del recurso. |
| LOGIC-04 | El reloj pasa de 5 a 6 AM tras un intervalo. El atajo reutiliza la ruta de victoria. |
| LOGIC-05 | El objeto del susto cierra el video en su evento de limpieza. |
| LOGIC-07 | El movimiento de Prismoso usa una probabilidad proporcional a la dificultad de 0 a 20. |
| DUP-01 | Un controlador comparte selección, presentación y alarma entre los 19 botones. |
| DUP-02 | La selección usa el número de cámara activo y el estado visual del botón. Se retiraron las 19 variables globales duplicadas. |
| DUP-03 | Ocho objetos de Prismoso en cámara heredan los eventos compartidos y conservan sus sprites. |
| DUP-04 | Una sola sala define la oficina para las dos noches. La segunda crea un Intruso en la capa y posición originales. |
| DUP-05 | Los objetos que siguen el fondo comparten el anclaje. Los dos consumidores de batería comparten el evento de consumo. |
| DEAD-01 | Se retiraron del proyecto los 830 recursos del paquete de efectos que carecían de referencias. |
| DEAD-02 | Se retiraron 33 sprites de variantes que carecían de referencias. |
| DEAD-03 | Se retiraron la secuencia de susto anterior, sus tres sprites y su sonido. El susto actual conserva el video. |
| DEAD-04 | Se retiraron 14 objetos sin instancias ni creación por código, junto con cuatro sprites dependientes. |
| DEAD-05 | Se retiraron Guardia, N134 y N1345 del proyecto y del orden de salas. |
| DEAD-06 | El controlador de cámaras ya es padre de los botones. Se retiraron las instancias ignoradas. |
| DEAD-07 | Opciones ya se integró con el PR #6. Se retiró el marcador deshabilitado de Extras y sus sprites. |
| DEAD-08 | Se retiraron las declaraciones de eventos sin archivo y se añadió su comprobación estática. |
| DEAD-09 | Se retiraron tres eventos vacíos y las ramas vacías señaladas. |
| DEAD-10 | Se retiraron las asignaciones sin lectura y el salto inalcanzable. Se mantienen las llamadas que crean instancias o abren el video. |
| PERF-01 | La música de menú, oficina y créditos usa audio comprimido en streaming. Ocho efectos se comprimen en el paquete. |
| PERF-02 | Se activó la eliminación de recursos sin uso. La compilación Windows registra 185 sprites y 15 sonidos, frente a 863 y 211 antes de la limpieza. La reducción combina varios cambios y se medirá de nuevo en el paquete Android firmado. |
| PERF-03 | Windows y Android usan páginas de textura de 4096 × 4096. La compilación Windows dejó de advertir que reducía el fondo de la oficina. |
| PERF-04 | El susto ocupa 4,317,413 bytes, frente a 27,414,155. Conserva 1280 × 720, H.264 y AAC estéreo. El archivo resultante registra 30 fps y 10.57 segundos. Falta comprobar reproducción y sincronía en el juego. |
| DOC-01 | La base ya incluye una guía de GameMaker para Windows y Android. |
| DOC-02 | La ficha de entrega enlaza `IDEA.md` y documenta el recorrido y la historia de usuario. |
| DOC-03 | Se enlaza el PR integrado y se distinguen las pruebas históricas de macOS de las pruebas posteriores en Android. |
| DOC-04 | La base ya incluye `AGENTS.md`. Se añade la comprobación de versión en ambas plataformas para esta actualización. |
| DOC-05 | La matriz de pruebas identifica `progreso.ini` y `noche_ganada`. |
| DOC-06 | Se corrigió la fecha en los créditos escritos. |
| CI-01 | El workflow de PR comprueba un registro de QA asociado a la huella de los archivos jugables revisados. La matriz histórica se conserva. |
| CI-02 | El validador lee los descriptores, comprueba recursos sin registrar y verifica archivos de eventos. El token del workflow tiene permisos de lectura. |
| CI-03 | La publicación posterior de Alpha pasó los controles del PR #8. El próximo PR deberá registrar sus propios resultados. La evidencia histórica de 0.1.1 sigue siendo la registrada en su informe. |
| REL-01 | El aviso del juego usa la versión de la compilación. Se alineó Windows con la base 0.1.10 y la copia preparada de la política web muestra la fecha del aviso. La página pública sigue en la rama de Pages. Su actualización requiere autorización expresa. |
| REL-02 | El [inventario de licencias](LICENCIAS.md) recoge la procedencia conocida, la evidencia y las atribuciones pendientes. Sigue pendiente confirmar la procedencia o las condiciones específicas de varias fotografías, fuentes y del audio y video del susto. |
| REL-03 | El ajuste de Android desactiva TV y Leanback. Falta comprobar el manifiesto del siguiente AAB. |

## Verificación

- El validador de GameMaker comprueba 290 recursos y sus eventos.
- GameMaker LTS 2026 compiló el proyecto actualizado para Windows VM. El resultado `.win` pesa 18,808,830 bytes. La compilación anterior a la limpieza pesaba 61,118,434 bytes. Estas cifras corresponden al archivo compilado de Windows.
- El control de QA acepta un registro válido y rechaza una huella desactualizada, casos repetidos y casos fallidos, pendientes o sin evidencia.
- La compilación de diagnóstico para Windows terminó. El ejecutable de GameMaker falló al iniciar con un error de reasignación de DLL de Windows, por lo que los recorridos de regresión quedaron sin ejecutar.
- El compilador de Android devolvió `Unable to obtain permission to execute`. Quedan pendientes el paquete Android y la prueba en dispositivo.
