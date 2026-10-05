// Issue #2: complete the active night with Ctrl + Shift + N.
// Use a pressed edge so holding N cannot repeat the action.
if (room != Culturales1) exit;
if (global.Bateria <= 0) exit;
if (variable_global_exists("EnergyBlackout")) {
    if (global.EnergyBlackout) exit;
}
if (keyboard_check(vk_control) && keyboard_check(vk_shift)
    && keyboard_check_pressed(ord("N"))) {
    alarm[0] = -1;
    global.Hora = 8;
    // Reuse the regular 6 AM clock update and victory transition.
    event_perform(ev_alarm, 0);
}
