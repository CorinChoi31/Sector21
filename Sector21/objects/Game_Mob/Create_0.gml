range = [0,global.grid_length];
color = c_white;
alpha = 0;
rotate = 0;

range_dest = [global.grid_length*0.25,global.grid_length*0.875];
color_dest = c_white;
alpha_dest = 1;

color_array = [255,255,255];

step = room_speed/5;
density = 90;

unit_id = 0;

unit_score = 0;

unit_collision = ds_list_create();

unit_enable = true;
unit_ready = false;
unit_death = false;

unit_inAttack = 0;

unit_health = 0;
unit_health_max = 0;
unit_health_soft = 0;

unit_skill_id = noone;
unit_skill_amount = 0;
unit_skill_length = 5;

unit_attack_amount = 0;
unit_attack_speed = 5;
unit_attack_delay = 0;
unit_attack_length = 0;

unit_ratio_send = 1;
unit_ratio_recive = 1;

unit_moveable = true;
unit_speed = 0;
unit_speed_max = 0;
unit_speed_accel = 0;

unit_effect_id = ds_list_create();
unit_effect_amount = ds_list_create();
unit_effect_amount_origin = ds_list_create();
unit_effect_tick = ds_list_create();
unit_effect_tick_origin = ds_list_create();
unit_effect_first = ds_list_create();
unit_effect_sender = ds_list_create();

effe_health_max = 0;

effe_attack_amount = 0;
effe_attack_speed = 0;
effe_attack_length = 0;

effe_ratio_send = 0;
effe_ratio_recive = 0;

effe_speed_max = 0;
effe_speed_accel = 0;

calc_health_max = 0;

calc_attack_amount = 0;
calc_attack_speed = 0;
calc_attack_length = 0;

calc_ratio_send = 0;
calc_ratio_recive = 0;

calc_speed_max = 0;
calc_speed_accel = 0;

unit_damage_id = ds_list_create();
unit_damage_amount = ds_list_create();
unit_damage_amount_origin = ds_list_create();