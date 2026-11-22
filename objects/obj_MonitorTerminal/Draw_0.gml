// The monitor turns off with the cameras up, in the blackout and without battery.
if (global.CameraUp == 1 || global.EnergyBlackout || global.BatConteo <= 0) exit;

if (!surface_exists(screen_surface)) {
    screen_surface = surface_create(screen_w, screen_h);
}

// 1. Terminal text on the flat surface.
var _old_font = draw_get_font();
var _old_colour = draw_get_colour();
var _old_alpha = draw_get_alpha();
var _old_halign = draw_get_halign();
var _old_valign = draw_get_valign();
surface_set_target(screen_surface);
draw_clear(colour_back);
// Keep the surface opaque: the glow and the scanlines are translucent and would lower its alpha.
gpu_set_colourwriteenable(true, true, true, false);
draw_set_font(term_font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// global.Hora goes from 0 (10 PM) to 7 (5 AM).
var _hour = (22 + global.Hora) mod 24;
var _hour12 = (_hour mod 12 == 0) ? 12 : _hour mod 12;
var _time = string_replace_all(string_format(_hour12, 2, 0), " ", "0") + ":00 " + ((_hour >= 12) ? "PM" : "AM");
var _battery = clamp(ceil(global.Bateria / 14400 * 100), 0, 100);
var _full = round(_battery / 100 * (term_cols - 2));

var _header = " SEGURIDAD ESCOM  NOCHE " + string(global.Noche) + string_repeat(" ", term_cols);
term_text(0, 0, string_copy(_header, 1, term_cols), colour_text, true);
term_value(2, "HORA", _time, false);
term_value(4, "ENERGIA", string(_battery) + "%", _battery <= 20);
term_text(5, 0, "[" + string_repeat("#", _full) + string_repeat("-", term_cols - 2 - _full) + "]", colour_dim, false);
term_value(7, "LASER", (global.Laser == 1) ? "ACTIVO" : "APAGADO", global.Laser == 1);
term_value(9, "MOVIMIENTO", (motion_text == "") ? "NINGUNO" : motion_text, motion_text != "");
term_text(11, 0, "> MONITOREO EN CURSO", colour_text, false);
if ((current_time div 500) mod 2 == 0) {
    draw_set_colour(colour_text);
    var _cx = term_x + 21 * char_w;
    var _cy = term_y + 11 * line_h;
    draw_rectangle(_cx, _cy, _cx + char_w - 4, _cy + char_w, false);
}

// Old screen: a little static, scanlines and darker corners.
draw_sprite_stretched_ext(spr_static_camera, static_frame, 0, 0, screen_w, screen_h, c_white, 0.06);
draw_sprite(spr_TerminalCRT, 0, 0, 0);
gpu_set_colourwriteenable(true, true, true, true);
surface_reset_target();

draw_set_font(_old_font);
draw_set_colour(_old_colour);
draw_set_alpha(_old_alpha);
draw_set_halign(_old_halign);
draw_set_valign(_old_valign);

// 2. The surface stretched over the curved mesh of the screen.
var _tex = surface_get_texture(screen_surface);
for (var _j = 0; _j < grid_rows; _j++) {
    draw_primitive_begin_texture(pr_trianglestrip, _tex);
    for (var _i = 0; _i <= grid_cols; _i++) {
        var _a = grid[_j * (grid_cols + 1) + _i];
        var _b = grid[(_j + 1) * (grid_cols + 1) + _i];
        draw_vertex_texture(x + _a[0], y + _a[1], _i / grid_cols, _j / grid_rows);
        draw_vertex_texture(x + _b[0], y + _b[1], _i / grid_cols, (_j + 1) / grid_rows);
    }
    draw_primitive_end();
}

// 3. The monitor frame from the photo goes on top and hides the edge of the mesh.
draw_sprite(spr_MonitorMarco, 0, x + 1490, y + 410);
