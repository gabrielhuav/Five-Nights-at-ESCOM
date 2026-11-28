time_source_destroy(vigilante);
for (var i = 0; i < array_length(global.TelefonoSonidos); i++) audio_stop_sound(global.TelefonoSonidos[i]);
global.TelefonoSonidos = [];
