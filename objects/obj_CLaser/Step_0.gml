// The rays blink while they switch on and then glow with a slight flicker.
if (sprite_index == noone) exit;

if (switching_on > 0) {
    switching_on -= 1;
    image_alpha = (switching_on mod 4 < 2) ? 1 : 0.2;
    if (switching_on == 0) image_alpha = 1;
} else {
    image_alpha = random_range(0.85, 1);
}
