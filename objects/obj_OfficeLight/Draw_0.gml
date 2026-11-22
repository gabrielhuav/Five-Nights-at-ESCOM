if (global.CameraUp == 1 || global.EnergyBlackout) exit;

var _cam = view_camera[0];
var _x = camera_get_view_x(_cam);
var _y = camera_get_view_y(_cam);
var _old_alpha = draw_get_alpha();
var _old_colour = draw_get_colour();
draw_set_alpha(darkness + flicker);
draw_set_colour(c_black);
draw_rectangle(_x, _y, _x + camera_get_view_width(_cam), _y + camera_get_view_height(_cam), false);
draw_set_alpha(_old_alpha);
draw_set_colour(_old_colour);
