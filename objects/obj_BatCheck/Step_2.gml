// Energy depletion ends the round through a staged blackout.
if (blackout_phase > 0) {
    blackout_ticks += 1;
    global.Bateria = 0;
    if (blackout_ticks >= game_get_speed(gamespeed_fps) * 6) {
        show_debug_message("[EnergyBlackout v2] starting screamer, followed by Game Over");
        global.JSBy = 1;
        room_goto(GameOver);
    }
    exit;
}
global.Bateria = max(0, global.Bateria);
if (global.Bateria <= 0) {
    global.BatConteo = 0;
    global.EnergyBlackout = true;
    global.BatCamara = 0;
    global.BatLaser = 0;
    global.Laser = 0;
    global.CameraUp = 0;
    global.CambioCamara = 0;
    global.ShowButton = 0;
    global.blockCam = 1;
    with (obj_CLaserButton) { sprite_index = spr_CLOff; image_index = 0; }
    with (obj_CLaser) { sprite_index = noone; image_index = 0; }
    audio_stop_all();
    show_debug_message("[EnergyBlackout v2] blackout started");
    blackout_phase = 1;
    blackout_ticks = 0;
    with (obj_WinTimer) alarm[0] = -1;
    exit;
}
// Inclusive ranges also handle thresholds skipped by simultaneous consumers.
global.BatConteo = ceil(global.Bateria / 2880);
global.BatConteo = clamp(global.BatConteo, 1, 5);
