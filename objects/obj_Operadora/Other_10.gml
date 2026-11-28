/// Avanzar una zona (lo llama obj_Telefono con cada llamada perdida).
if (zona >= 2) exit;
zona += 1;
audio_play_sound(snd_Operadora_pasos, 0, false);
if (zona == 1) {
    sprite_index = spr_Operadora_cam11;
} else {
    // En la puerta: en la capa de Prismoso, para que la puerta quede delante.
    sprite_index = spr_Operadora_puerta;
    if (layer_exists("Botones")) layer = layer_get_id("Botones");
    x = instance_exists(obj_Culturales1) ? obj_Culturales1.x : 0;
    y = -160;
}
