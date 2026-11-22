event_inherited();

// Security terminal shown on the desk monitor: time, battery, laser and the last camera with movement.
// The text is drawn on a surface and stretched over a curved mesh that follows the monitor screen.

// Inner edges of the screen inside spr_Culturales1 (2125x1080), measured on the photo: start, middle, end.
// The instance sits at (0, -160) like the office, so these offsets follow the office when it scrolls.
edge_top = [[1518, 435], [1690, 447], [1862, 452]];
edge_bottom = [[1518, 668], [1690, 707], [1862, 732]];
edge_left = [[1518, 435], [1518, 552], [1518, 668]];
edge_right = [[1862, 452], [1863, 592], [1862, 732]];

screen_w = 704;
screen_h = 528;
screen_surface = -1;
grid_cols = 24;
grid_rows = 18;

// Terminal layout: one monospaced grid of 26 columns, 22 px characters and 36 px rows, centred with safe margins.
term_font = font_add_sprite_ext(spr_TerminalFont, " #%-.0123456789:>[]ABCDEFGHIJKLMNOPQRSTUVWXYZ", false, 0);
term_cols = 26;
char_w = 22;
line_h = 36;
term_x = (screen_w - term_cols * char_w) div 2;
term_y = (screen_h - (11 * line_h + char_w)) div 2;
colour_back = make_colour_rgb(2, 10, 5);
colour_text = make_colour_rgb(90, 255, 140);
colour_dim = make_colour_rgb(40, 140, 75);

// Movement report: the camera number stays on screen for a few seconds.
motion_text = "";
motion_timer = 0;
last_pm_pos = -1;
last_intruder_cam = -1;
static_frame = 0;

// Point of a quadratic curve that passes through its three points (the middle one at t = 0.5).
curve_point = function(_p, _t) {
    var _cx = _p[1][0] * 2 - (_p[0][0] + _p[2][0]) / 2;
    var _cy = _p[1][1] * 2 - (_p[0][1] + _p[2][1]) / 2;
    var _a = (1 - _t) * (1 - _t);
    var _b = 2 * (1 - _t) * _t;
    var _c = _t * _t;
    return [_a * _p[0][0] + _b * _cx + _c * _p[2][0], _a * _p[0][1] + _b * _cy + _c * _p[2][1]];
};

// Coons patch: the surface that passes through the four edges of the screen.
screen_point = function(_u, _v) {
    var _t = curve_point(edge_top, _u);
    var _b = curve_point(edge_bottom, _u);
    var _l = curve_point(edge_left, _v);
    var _r = curve_point(edge_right, _v);
    var _p00 = edge_top[0], _p10 = edge_top[2], _p01 = edge_bottom[0], _p11 = edge_bottom[2];
    var _px = (1 - _v) * _t[0] + _v * _b[0] + (1 - _u) * _l[0] + _u * _r[0]
        - ((1 - _u) * (1 - _v) * _p00[0] + _u * (1 - _v) * _p10[0] + (1 - _u) * _v * _p01[0] + _u * _v * _p11[0]);
    var _py = (1 - _v) * _t[1] + _v * _b[1] + (1 - _u) * _l[1] + _u * _r[1]
        - ((1 - _u) * (1 - _v) * _p00[1] + _u * (1 - _v) * _p10[1] + (1 - _u) * _v * _p01[1] + _u * _v * _p11[1]);
    return [_px, _py];
};

// Mesh points, extended 4 px past the edges: spr_MonitorMarco covers that border.
var _ex = 4 / 350;
var _ey = 4 / 260;
grid = array_create((grid_cols + 1) * (grid_rows + 1));
for (var _j = 0; _j <= grid_rows; _j++) {
    for (var _i = 0; _i <= grid_cols; _i++) {
        var _u = -_ex + (_i / grid_cols) * (1 + 2 * _ex);
        var _v = -_ey + (_j / grid_rows) * (1 + 2 * _ey);
        grid[_j * (grid_cols + 1) + _i] = screen_point(_u, _v);
    }
}

// Text on the terminal grid. Inverted text is dark on a lit block, used for the header and the alerts.
term_text = function(_row, _col, _text, _colour, _inverted) {
    var _x = term_x + _col * char_w;
    var _y = term_y + _row * line_h;
    if (_inverted) {
        draw_set_colour(_colour);
        draw_rectangle(_x - 4, _y - 6, _x + string_length(_text) * char_w + 4, _y + char_w + 5, false);
        draw_set_colour(colour_back);
        draw_text(_x, _y, _text);
    } else {
        draw_set_colour(_colour);
        draw_set_alpha(0.25);   // soft phosphor glow
        draw_text(_x - 1, _y, _text);
        draw_text(_x + 1, _y, _text);
        draw_set_alpha(1);
        draw_text(_x, _y, _text);
    }
};

// Label on the left, value on the right, joined by dots.
term_value = function(_row, _label, _value, _alert) {
    var _dots = string_repeat(".", term_cols - string_length(_label) - string_length(_value) - 2);
    term_text(_row, 0, _label + " " + _dots + " ", colour_dim, false);
    term_text(_row, term_cols - string_length(_value), _value, colour_text, _alert);
};
