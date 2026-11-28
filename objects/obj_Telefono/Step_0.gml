if (TELEFONO_PRUEBA) {
    if (!instance_exists(obj_Operadora)) instance_create_layer(8, 936, "Cam01", obj_Operadora);
    // Prismoso quieto para probar el telefono sin que ataque: sus alarmas no llegan a 0.
    with (obj_PM) for (var i = 0; i < 3; i++) if (alarm[i] > 0) alarm[i] += 1;
}
// En el apagon no suena ni cuenta faltas.
if (global.EnergyBlackout) {
    if (fase != FaseTelefono.NADA) {
        callar();
        fase = FaseTelefono.NADA;
    }
    exit;
}
// Olvida los sonidos que ya terminaron.
global.TelefonoSonidos = array_filter(global.TelefonoSonidos, function(_s) {
    return audio_is_playing(_s) || audio_is_paused(_s);
});

switch (fase) {
    case FaseTelefono.LLAMADA_N1:
        if (!suena(sonido)) fase = FaseTelefono.NADA;
        break;
    case FaseTelefono.GUARDIA:
        if (!suena(sonido)) timbre_inicio();
        break;
    case FaseTelefono.TIMBRE_INICIO:
        // Entre las dos llamadas de inicio suena un timbre y despues habla la Operadora.
        cuenta += 1;
        if (cuenta >= SEG * 3) llamada_operadora();
        break;
    case FaseTelefono.OPERADORA:
    case FaseTelefono.HABLANDO:
        if (!suena(sonido)) esperar();
        break;
    case FaseTelefono.ESPERA:
        cuenta -= 1;
        if (cuenta <= 0) sonar();
        break;
    case FaseTelefono.SONANDO:
        cuenta += 1;
        if (cuenta >= SEG * SEG_CONTESTAR) perdida();
        break;
    case FaseTelefono.FINAL_CLIC:
        if (!suena(sonido)) {
            fase = FaseTelefono.FINAL;
            sonido = reproducir(choose(snd_Op_final_1, snd_Op_final_2, snd_Op_final_3), false);
        }
        break;
    case FaseTelefono.FINAL:
        if (!suena(sonido)) {
            fase = FaseTelefono.NADA;
            sonido = -1;
            with (obj_Operadora) event_user(1);
        }
        break;
}
