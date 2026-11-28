// Operadora de la Noche 3: vive en la linea del telefono y se acerca con cada llamada perdida.
// zona 0: CAM 13 (lejos); 1: CAM 11 (cerca); 2: en la puerta de la oficina. La avanza obj_Telefono (User Event 0)
// y su susto lo lanza el mismo telefono a la tercera falta (User Event 1). El laser no la detiene.
zona = 0;
sprite_index = spr_Operadora_cam13;
image_speed = 0;
image_index = 0;
image_alpha = 0;
// En camara se dibuja encima de la foto de su camara (obj_Lugares, en 8, 936).
x = 8;
y = 936;
// Pose: cambia cada 2 a 4 s mientras se le ve.
alarm[0] = game_get_speed(gamespeed_fps) * irandom_range(2, 4);
