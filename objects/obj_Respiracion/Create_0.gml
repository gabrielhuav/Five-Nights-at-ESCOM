// Respiracion con bateria baja, en todas las noches: con la ultima barra (20 %) suena de vez en cuando.
// La crea obj_Telefono, que tambien la pausa con la pausa del juego.
UMBRAL = 14400 * 0.2;
alarm[0] = game_get_speed(gamespeed_fps) * irandom_range(10, 20);
