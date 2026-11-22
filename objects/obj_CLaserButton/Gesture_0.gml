// Laser switch: the lever sprite shows the state and obj_CLaser draws the rays behind the door.
if (global.BatConteo <= 0) {
    audio_stop_sound(snd_EmptyButton);
    audio_play_sound(snd_EmptyButton, 0, false, 1.0, undefined, 1.0);
    exit;
}

audio_stop_sound(snd_Laser);

if (global.Laser == 0) {
    audio_play_sound(snd_Laser, 0, true, 1.0, undefined, 1.0);
    global.Laser = 1;
    global.BatLaser = 1;
    sprite_index = spr_CLOn;
    with (obj_CLaser) {
        sprite_index = spr_CLaser1;
        image_index = 0;
        switching_on = 12;
    }
} else {
    global.Laser = 0;
    global.BatLaser = 0;
    sprite_index = spr_CLOff;
    with (obj_CLaser) {
        sprite_index = noone;
        image_index = 0;
    }
}
image_index = 0;
