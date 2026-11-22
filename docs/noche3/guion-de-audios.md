# Guion de los audios de la Noche 3

Voces generadas con [edge-tts](https://github.com/rany2/edge-tts) y procesadas con ffmpeg para que suenen como una
grabadora vieja (el guardia) y una línea telefónica dañada (la Operadora). Los sonidos sin voz se sintetizaron con
ffmpeg.

| Personaje | Voz de edge-tts | Ajustes |
|---|---|---|
| Guardia anterior | `es-MX-JorgeNeural` | velocidad -12 %, tono -6 Hz, formantes al 0.93; grabadora: ruido de cinta, cortes, eco corto y clic al empezar y al terminar |
| La Operadora | `en-US-AvaMultilingualNeural` | velocidad -15 %, tono -15 Hz; línea dañada: ruido constante, cortes, eco corto y efecto metálico |

## Llamadas al inicio de la noche

### `snd_Llamada_N1` · Guardia anterior · Al empezar la Noche 1

> Hola, hola… espero que me estés escuchando. Estoy grabando esto para el siguiente guardia que obtenga este trabajo.
> Si estás oyendo esto, felicidades: ese eres tú. Así que te explico rápido.
>
> Tu turno es de diez de la noche a seis de la mañana. Nada más tienes que llegar a las seis. Fácil, ¿no?
>
> Abajo tienes las cámaras. Revísalas seguido. Hay… cosas que se mueven por los pasillos de noche. No te espantes,
> nada más no las pierdas de vista.
>
> Si algo se acerca a la puerta, prende el láser. Eso los detiene. Pero ojo: el láser y las cámaras se comen la
> batería, y si se acaba… pues ya no queda nada entre tú y la puerta.
>
> Ah, y una cosa más. Si el teléfono suena muy de madrugada… no soy yo. Yo ya no voy a estar aquí.
>
> Bueno… suerte.

### `snd_Llamada_N3_guardia` · Guardia anterior · Al empezar la Noche 3

> Hola, hola… soy yo otra vez. Grabé esto por si llegabas a la tercera noche. Si lo estás oyendo, vas bien.
>
> Mira… no te quiero espantar, pero aquí corren rumores. Dicen que el guardia que estaba antes que yo desapareció.
> Así, de un día para otro. Y dicen que fue por no contestar el teléfono.
>
> Yo no sé si sea cierto. No te garantizo nada. Pero yo siempre lo contesté… y a mí me funcionó. Bueno… hasta ahora.
>
> Así que si suena… contesta. Siempre. Aunque no te guste lo que te digan.
>
> Bueno… suerte. Otra vez.

### `snd_Llamada_N3_operadora` · La Operadora · Después de la grabación del guardia en la Noche 3

> Buenas noches. Le habla la operadora. Gracias por tomar esta línea.
>
> Le informo que esta noche su extensión recibirá varias llamadas. Le recomiendo contestar… pronto. No me gusta
> esperar.
>
> Si no contesta, no se preocupe: yo misma iré a buscar la respuesta. Cada vez un poquito más cerca. Si gusta, puede
> seguirme en sus cámaras.
>
> Ese láser que tanto le gusta… conmigo no funciona.
>
> Otros antes que usted también dejaban sonar el teléfono. Una vez… dos veces… A la tercera, ya no tuvieron que
> contestar.
>
> Ah, y si en algún momento siente que algo lo mira muy de cerca… no se mueva. Se le pasa en unos segundos.
>
> Que tenga una excelente noche. No cuelgue.

## El teléfono de la Operadora (Noche 3)

Si no se contesta, no se oye nada. Al contestar, suena una de las frases del grupo según las llamadas que no se
contestaron antes (se elige una al azar). A la tercera llamada sin contestar, el teléfono se contesta solo
(`snd_Telefono_clic`) y suena una frase final.

| Archivo | Cuándo | Texto |
|---|---|---|
| `snd_Op_sinfaltas_1` | Contestas sin faltas | Buenas noches. Solo quería saber si seguías despierto. |
| `snd_Op_sinfaltas_2` | Contestas sin faltas | Solo llamaba para escuchar tu voz. |
| `snd_Op_sinfaltas_3` | Contestas sin faltas | No cuelgues todavía… me gusta la compañía. |
| `snd_Op_sinfaltas_4` | Contestas sin faltas | Tranquilo. Esta vez solo quería saludarte. |
| `snd_Op_falta1_1` | Contestas con 1 falta | La vez pasada no me contestaste. Que no se repita. |
| `snd_Op_falta1_2` | Contestas con 1 falta | Te marqué hace rato… pensé que ya no estabas. |
| `snd_Op_falta1_3` | Contestas con 1 falta | Una llamada perdida. Todavía te la perdono. |
| `snd_Op_falta2_1` | Contestas con 2 faltas | Dos veces me ignoraste. No habrá una tercera. |
| `snd_Op_falta2_2` | Contestas con 2 faltas | Te queda una oportunidad. Úsala bien. |
| `snd_Op_falta2_3` | Contestas con 2 faltas | Ya sé dónde estás. Solo me falta llegar. |
| `snd_Op_falta2_4` | Contestas con 2 faltas | ¿Por qué no contestabas? Ya van dos veces. |
| `snd_Op_final_1` | Tercera falta | Te lo advertí. Ahora vamos a hablar en persona. |
| `snd_Op_final_2` | Tercera falta | Como no contestas… voy yo. |
| `snd_Op_final_3` | Tercera falta | Ya no hace falta que contestes. Ya estoy aquí. |

## Sonidos sin voz

| Archivo | Qué es | Cuándo suena |
|---|---|---|
| `snd_Telefono_timbre` | Timbre de teléfono viejo (1.2 s sonando, 1.8 s de silencio) | Mientras el teléfono suena; se repite |
| `snd_Telefono_clic` | El auricular se levanta | Cuando el teléfono se contesta solo |
| `snd_Aturdido` | Pitido de oído y golpe grave | En el aturdimiento |
| `snd_Operadora_pasos` | Pasos lejanos en un pasillo | Cuando la Operadora avanza |
| `snd_Respiracion` | Respiración lenta | Con batería baja |
| `snd_Operadora_grito` | Grito sintético | En el susto de la Operadora |
