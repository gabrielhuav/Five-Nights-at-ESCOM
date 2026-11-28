alarm[0] = game_get_speed(gamespeed_fps) * irandom_range(2, 4);
if (global.EnergyBlackout || image_alpha == 0) exit;
// Otra pose, nunca la misma dos veces seguidas.
image_index = (image_index + irandom_range(1, 2)) mod 3;
