// Movement report: Prismoso and the Intruder. The door and the attack are not cameras.
var _seconds = game_get_speed(gamespeed_fps) * 4;
if (variable_global_exists("PMPos")) {
    if (last_pm_pos != -1 && global.PMPos != last_pm_pos && global.PMPos >= 1 && global.PMPos <= 19) {
        motion_text = "CAM " + string_replace_all(string_format(global.PMPos, 2, 0), " ", "0");
        motion_timer = _seconds;
    }
    last_pm_pos = global.PMPos;
}
if (instance_exists(obj_Intruso)) {
    var _cam = obj_Intruso.camara_actual;
    if (last_intruder_cam != -1 && _cam != last_intruder_cam) {
        motion_text = "CAM " + string_replace_all(string_format(_cam, 2, 0), " ", "0");
        motion_timer = _seconds;
    }
    last_intruder_cam = _cam;
}
if (motion_timer > 0) {
    motion_timer -= 1;
    if (motion_timer == 0) motion_text = "";
}

// A new static frame every few steps, like a weak signal.
if (irandom(3) == 0) {
    static_frame = irandom(sprite_get_number(spr_static_camera) - 1);
}
