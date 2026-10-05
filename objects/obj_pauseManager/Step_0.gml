// Alternar pausa con tecla ESC o P
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("P"))) {
    global.game_paused = !global.game_paused;
    
    if (global.game_paused) {
        instance_deactivate_all(true);
    } else {
        instance_activate_all();
    }
}

// Lógica del botón de Salir (solo se evalúa cuando el juego está pausado)
if (global.game_paused) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    
    // Coordenadas y dimensiones del botón "Salir al Menú"
    var _btn_w = 260;
    var _btn_h = 50;
    var _btn_x1 = (_gui_w / 2) - (_btn_w / 2);
    var _btn_y1 = (_gui_h / 2) + 80;
    var _btn_x2 = _btn_x1 + _btn_w;
    var _btn_y2 = _btn_y1 + _btn_h;
    
    // Posición del cursor en la interfaz GUI
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    
    // Detectar clic sobre el botón
    if (point_in_rectangle(_mx, _my, _btn_x1, _btn_y1, _btn_x2, _btn_y2)) {
        if (mouse_check_button_pressed(mb_left)) {
            // Reactivar las instancias antes de cambiar de sala para limpiar estado
            global.game_paused = false;
            instance_activate_all();
            
            // Ir al menú principal (asegúrate de usar el nombre exacto de tu sala de menú)
            if (room_exists(MenuPrincipal)) {
                room_goto(MenuPrincipal);
            }
        }
    }
}