draw_set_color(c_white);
draw_set_alpha(1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(Default_Font);

draw_text(16, 32*1, "FPSR: " + string(fps_real));
draw_text(16, 32*2, "FPS: " + string(fps) + "/" + string(room_speed));

//draw_text(16, 32*4, "TIME: " + string_format(global.seq_time,0,6));
//draw_text(16, 32*5, "TICK: " + string_format(global.seq_tick,0,6));

//draw_text(16, 32*7, "MS_X: " + string_format(global.mouse_pos_x[0],0,2));
//draw_text(16, 32*8, "MS_Y: " + string_format(global.mouse_pos_y[0],0,2));

draw_set_halign(fa_center);
draw_set_valign(fa_middle);