// Global Tap: toque en Android y clic en Windows, en coordenadas de la sala.
if (global.EnergyBlackout) exit;
if (variable_global_exists("CameraUp") && global.CameraUp == 1) exit;
if (!point_in_rectangle(event_data[? "posX"], event_data[? "posY"], x, y, x + ANCHO, y + ALTO)) exit;
switch (fase) {
    // Tocar el telefono corta una llamada de inicio.
    case FaseTelefono.LLAMADA_N1:
        callar();
        fase = FaseTelefono.NADA;
        break;
    case FaseTelefono.GUARDIA:
        timbre_inicio();
        break;
    case FaseTelefono.TIMBRE_INICIO:
        llamada_operadora();
        break;
    case FaseTelefono.OPERADORA:
        esperar();
        break;
    case FaseTelefono.SONANDO:
        contestar();
        break;
}
