if (global.EnergyBlackout) exit;

if (flicker_steps > 0) {
    flicker_steps -= 1;
    flicker = (flicker_steps mod 6 < 3) ? random_range(0.25, 0.5) : 0;
    if (flicker_steps == 0) flicker = 0;
} else {
    next_flicker -= 1;
    if (next_flicker <= 0) {
        flicker_steps = irandom_range(9, 24);
        var _low_battery = global.BatConteo <= 1;
        next_flicker = _low_battery ? irandom_range(90, 240) : irandom_range(300, 720);
    }
}
