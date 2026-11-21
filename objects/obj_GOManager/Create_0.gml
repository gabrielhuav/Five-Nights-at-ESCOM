audio_stop_all();

SecGO = 0;

switch (global.JSBy) {
    case 1:
        instance_create_layer(0, 0, "Estatica", obj_PMJS);
        alarm_set(0, 620);
        break;
    case 2:
        instance_create_layer(0, 0, "Estatica", obj_IntrusoJS);
        alarm_set(0, 150);
        break;
}
