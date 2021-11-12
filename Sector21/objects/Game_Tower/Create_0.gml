rotate = 0;
range = [0,global.grid_length];
color = c_white;
alpha = 0;

range_dest = [global.grid_length*0.25,global.grid_length*0.875];
color_dest = c_white;
alpha_dest = 1;

color_array = [255,255,255];

step = room_speed/5;
density = 18;
tick = 0;

y_pos = 0;


pos = [0,0];
point = [0,0,0];


unit_id = 0;
unit_type = 0;
unit_upgrade = 0; unit_upgraded = 0; unit_upgrade_tick = 0;
unit_cost = 0; unit_cost_return = 0; unit_cost_reduce = 0;
unit_description = "";

unit_collision = ds_list_create();

unit_ready = room_speed;
unit_death = false;

unit_attack_enable = false;
unit_attack_target = noone;
unit_attack_amount = 10;
unit_attack_speed = 1;
unit_attack_delay = 0;
unit_attack_range = 0;
unit_attack_length = 512;
unit_attack_velocity = 10;
unit_attack_ignore = 0;

unit_effect_id = ds_list_create();
unit_effect_amount = ds_list_create();
unit_effect_amount_origin = ds_list_create();
unit_effect_tick = ds_list_create();
unit_effect_tick_origin = ds_list_create();
unit_effect_first = ds_list_create();
unit_effect_sender = ds_list_create();

effe_attack_amount = 0;
effe_attack_speed = 0;
effe_attack_range = 0;
effe_attack_length = 0;
effe_attack_ignore = 0;
effe_attack_velocity = 10;

calc_attack_amount = 0;
calc_attack_speed = 0;
calc_attack_range = 0;
calc_attack_length = 0;
calc_attack_ignore = 0;
calc_attack_velocity = 10;