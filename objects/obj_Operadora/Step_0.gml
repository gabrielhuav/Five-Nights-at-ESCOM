if (global.EnergyBlackout) exit;
switch (zona) {
    case 0: image_alpha = (global.CameraUp == 1 && global.CamaraActiva == 13) ? 1 : 0; break;
    case 1: image_alpha = (global.CameraUp == 1 && global.CamaraActiva == 11) ? 1 : 0; break;
    default: image_alpha = 1; break;
}
