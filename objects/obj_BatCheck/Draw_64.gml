// Hold a black screen until the existing screamer sequence starts.
if (blackout_phase > 0) {
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_color(c_white);
}
