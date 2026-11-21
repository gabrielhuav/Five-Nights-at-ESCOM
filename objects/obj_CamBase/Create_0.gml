/// @description Configuration for the camera buttons inherited from this object
camera_number = 0;
idle_sprite = sprite_index;

// The row order matches camera numbers. Camera 19 uses the camera 18 view and hides the map dot.
var _cameras = [
    [obj_Cam_01, spr_Cam_01B, spr_Dot_1, spr_Cam01L],
    [obj_Cam_02, spr_Cam_02B, spr_Dot_2, spr_Cam02L],
    [obj_Cam_03, spr_Cam_03B, spr_Dot_3, spr_Cam03L],
    [obj_Cam_04, spr_Cam_04B, spr_Dot_4, spr_Cam04L],
    [obj_Cam_05, spr_Cam_05B, spr_Dot_5, spr_Cam05L],
    [obj_Cam_06, spr_Cam_06B, spr_Dot_6, spr_Cam06L],
    [obj_Cam_07, spr_Cam_07B, spr_Dot_7, spr_Cam07L],
    [obj_Cam_08, spr_Cam_08B, spr_Dot_8, spr_Cam08L],
    [obj_Cam_09, spr_Cam_09B, spr_Dot_9, spr_Cam09L],
    [obj_Cam_10, spr_Cam_10B, spr_Dot_10, spr_Cam10L],
    [obj_Cam_11, spr_Cam_11B, spr_Dot_11, spr_Cam11L],
    [obj_Cam_12, spr_Cam_12B, spr_Dot_12, spr_Cam12L],
    [obj_Cam_13, spr_Cam_13B, spr_Dot_13, spr_Cam13L],
    [obj_Cam_14, spr_Cam_14B, spr_Dot_14, spr_Cam14L],
    [obj_Cam_15, spr_Cam_15B, spr_Dot_15, spr_Cam15L],
    [obj_Cam_16, spr_Cam_16B, spr_Dot_16, spr_Cam16L],
    [obj_Cam_17, spr_Cam_17B, spr_Dot_17, spr_Cam17L],
    [obj_Cam_18, spr_Cam_18B, spr_Dot_18, spr_Cam18L],
    [obj_Cam_19, spr_Cam_19B, spr_Dot_OFF, spr_Cam18L]
];
for (var _index = 0; _index < array_length(_cameras); _index++) {
    var _camera = _cameras[_index];
    if (object_index == _camera[0]) {
        camera_number = _index + 1;
        selected_sprite = _camera[1];
        map_sprite = _camera[2];
        view_sprite = _camera[3];
        break;
    }
}
