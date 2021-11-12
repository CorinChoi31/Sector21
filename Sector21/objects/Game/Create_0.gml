os_powersave_enable(false);

global.grid_cursor = noone;

game_alpha = 0;

game_ready = false;
game_start = false;
game_pause = 0; game_pause_sprite = noone; game_pause_tick = 0; game_pause_select = 0;
game_done = 0; game_done_sprite = noone; game_done_tick = 0; game_done_select = 0; game_done_type = 0;

game_enemy_pattern = noone;
game_enemy_start = false;
game_enemy_wave = -1;
game_enemy_wait = 0;
game_enemy_list = ds_list_create();
game_enemy_next = false;
game_enemy_entry = ds_list_create();
game_enemy_create = room_speed;

game_center = noone;

game_tick = 0; game_tick_frame = 0;
game_score = 0; game_score_soft = 0; game_score_bonus = 0; game_score_center = true;

game_cost = 50; game_cost_soft = 0;
game_cost_recharge = -1;
game_cost_recharge_speed = room_speed*2;

game_interface_y = [1];
game_interface_dy = [1];
game_cursor_y = [1,1,1,1,1];