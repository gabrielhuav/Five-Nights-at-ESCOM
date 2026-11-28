alarm[0] = game_get_speed(gamespeed_fps) * irandom_range(15, 30);
if (global.EnergyBlackout || !variable_global_exists("Bateria")) exit;
if (global.Bateria > 0 && global.Bateria <= UMBRAL && !audio_is_playing(snd_Respiracion)) {
    var _s = audio_play_sound(snd_Respiracion, 0, false);
    if (variable_global_exists("TelefonoSonidos")) array_push(global.TelefonoSonidos, _s);
}
