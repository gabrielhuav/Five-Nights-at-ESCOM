// Tapping the desk monitor opens the cameras, the same as the camera button.
if (global.CameraUp == 1 || global.CambioCamara == 1 || global.blockCam == 1 || global.EnergyBlackout) exit;

var _px = event_data[? "posX"] - x;
var _py = event_data[? "posY"] - y;
if (!point_in_rectangle(_px, _py, edge_left[0][0], edge_top[0][1], edge_right[0][0], edge_bottom[2][1])) exit;

// obj_ButtonDown only reacts while global.ShowButton is 1 (office on its left side). The flag stays at 1 so the
// close button is visible and works inside the cameras; the office sets it again when the cameras close.
global.ShowButton = 1;
with (obj_ButtonDown) {
    if (y < 928) event_perform(ev_gesture, ev_gesture_tap);
}
