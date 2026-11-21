if (global.EnergyBlackout) exit;

var active_source;
switch (object_index) {
    case obj_BatCamara: active_source = global.BatCamara; break;
    case obj_BatLaser: active_source = global.BatLaser; break;
    default: exit;
}

if (active_source == 1) {
    global.Bateria = max(0, global.Bateria - 1);
}
