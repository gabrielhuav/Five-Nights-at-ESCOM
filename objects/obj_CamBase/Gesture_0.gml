/// @description Select this camera and update the view
if (camera_number == 0) exit;
// A new room starts with unselected buttons even if the previous room selected this camera.
if (global.CamaraActiva == camera_number && sprite_index == selected_sprite) exit;

global.CamaraActiva = camera_number;
audio_stop_sound(snd_CamChng);
audio_play_sound(snd_CamChng, 0, false);
layer_sequence_destroy(global.CamChng);
global.CamChng = layer_sequence_create("CAMUPDWN", 402, 1260, sqn_CamChng);
alarm_set(0, 15);

with (obj_CamBase) {
    if (camera_number > 0 && id != other.id) {
        sprite_index = idle_sprite;
        image_index = 0;
    }
}
sprite_index = selected_sprite;
image_index = 0;
with (obj_Dots) {
    sprite_index = other.map_sprite;
    image_index = 0;
}
with (obj_Lugares) {
    sprite_index = other.view_sprite;
    image_index = 0;
}
