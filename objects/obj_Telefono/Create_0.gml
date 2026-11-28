// Telefono del escritorio: llamadas de inicio (Noche 1 y Noche 3) y, en la Noche 3, el timbre cada 60 a 90 s.
// Contestar antes de 5 s pone una frase de la Operadora segun las faltas; no contestar es una falta y la hace avanzar.
// A la tercera falta se contesta solo, dice la frase final y lanza el susto. La zona tactil se mueve con la oficina.
event_inherited();

// Prueba: el timbre cada 10 s, la Noche 3 forzada con su Operadora y Prismoso quieto. Regresar a false antes de subir.
#macro TELEFONO_PRUEBA false

enum FaseTelefono { NADA, LLAMADA_N1, GUARDIA, TIMBRE_INICIO, OPERADORA, ESPERA, SONANDO, HABLANDO, FINAL_CLIC, FINAL }

// Zona tactil sobre el aparato de spr_Culturales1 (x 700-900, y 590-850; la oficina se dibuja en y = -160).
ANCHO = 200;
ALTO = 260;
SEG = game_get_speed(gamespeed_fps);
SEG_CONTESTAR = 5;

faltas = 0;
fase = FaseTelefono.NADA;
sonido = -1;
cuenta = 0;

if (TELEFONO_PRUEBA) global.Noche = 3;
var _noche = variable_global_exists("Noche") ? global.Noche : 0;

// Los sonidos del telefono y la respiracion se pausan con la pausa: obj_pauseManager desactiva las instancias,
// asi que un time source global (que sigue corriendo) los pausa y los reanuda.
global.TelefonoSonidos = [];
global.TelefonoPausado = false;
var _vigilar = method(undefined, function() {
    var _p = variable_global_exists("game_paused") && global.game_paused;
    if (_p == global.TelefonoPausado) return;
    global.TelefonoPausado = _p;
    for (var i = 0; i < array_length(global.TelefonoSonidos); i++) {
        if (_p) audio_pause_sound(global.TelefonoSonidos[i]);
        else audio_resume_sound(global.TelefonoSonidos[i]);
    }
});
vigilante = time_source_create(time_source_global, 1, time_source_units_frames, _vigilar, [], -1);
time_source_start(vigilante);

reproducir = function(_snd, _bucle) {
    var _s = audio_play_sound(_snd, 0, _bucle);
    array_push(global.TelefonoSonidos, _s);
    return _s;
};

suena = function(_s) {
    return _s != -1 && (audio_is_playing(_s) || audio_is_paused(_s));
};

callar = function() {
    if (sonido != -1) audio_stop_sound(sonido);
    sonido = -1;
};

esperar = function() {
    callar();
    if (variable_global_exists("Noche") && global.Noche == 3) {
        fase = FaseTelefono.ESPERA;
        cuenta = SEG * (TELEFONO_PRUEBA ? 10 : irandom_range(60, 90));
    } else {
        fase = FaseTelefono.NADA;
    }
};

timbre_inicio = function() {
    callar();
    fase = FaseTelefono.TIMBRE_INICIO;
    cuenta = 0;
    sonido = reproducir(snd_Telefono_timbre, true);
};

llamada_operadora = function() {
    callar();
    fase = FaseTelefono.OPERADORA;
    sonido = reproducir(snd_Llamada_N3_operadora, false);
};

sonar = function() {
    callar();
    fase = FaseTelefono.SONANDO;
    cuenta = 0;
    sonido = reproducir(snd_Telefono_timbre, true);
};

contestar = function() {
    callar();
    var _frases;
    switch (faltas) {
        case 0: _frases = [snd_Op_sinfaltas_1, snd_Op_sinfaltas_2, snd_Op_sinfaltas_3, snd_Op_sinfaltas_4]; break;
        case 1: _frases = [snd_Op_falta1_1, snd_Op_falta1_2, snd_Op_falta1_3]; break;
        default: _frases = [snd_Op_falta2_1, snd_Op_falta2_2, snd_Op_falta2_3, snd_Op_falta2_4]; break;
    }
    fase = FaseTelefono.HABLANDO;
    sonido = reproducir(_frases[irandom(array_length(_frases) - 1)], false);
};

perdida = function() {
    callar();
    faltas += 1;
    if (faltas >= 3) {
        // La tercera: se contesta solo y dice la frase final.
        fase = FaseTelefono.FINAL_CLIC;
        sonido = reproducir(snd_Telefono_clic, false);
    } else {
        with (obj_Operadora) event_user(0);
        esperar();
    }
};

// Llamadas de inicio.
if (_noche == 1) {
    fase = FaseTelefono.LLAMADA_N1;
    sonido = reproducir(snd_Llamada_N1, false);
} else if (_noche == 3) {
    fase = FaseTelefono.GUARDIA;
    sonido = reproducir(snd_Llamada_N3_guardia, false);
}

instance_create_layer(0, 0, layer, obj_Respiracion);
