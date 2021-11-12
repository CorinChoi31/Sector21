range = [0,0];
color = c_white;
alpha = 0;
rotate = 0;

range_dest = [global.grid_length*0.4,global.grid_length*0.5];
color_dest = c_white;
alpha_dest = 1;

color_array = [255,255,255];

step = room_speed/5;
density = 12;

unit_id = 0;

unit_enable = false;
unit_ready = 0;
unit_death = false;

unit_collision = ds_list_create();

unit_attack_target = noone;
unit_attack_amount = 0;
unit_attack_range = 0;

unit_effect_id = ds_list_create();
unit_effect_tick = ds_list_create();
unit_effect_amount = ds_list_create();
unit_effect_sender = ds_list_create();

unit_speed = 0;
unit_speed_max = 0;
unit_speed_accel = 0;