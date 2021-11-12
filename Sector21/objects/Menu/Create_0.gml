menu_tick = 0;
menu_index = menu.load;
menu_next = 0; menu_change = false;
menu_alpha = [0,1,room_speed*1];

#region
game_instance = noone;
game_pattern = noone;
game_stage = ds_list_create();
	ds_list_add(game_stage,"Loop Stage");

game_tech = [5,3,5,4,5];
game_tech_select = global.tower_tech;
game_tech_upgrade = 0;
#endregion

#region
logo_sprite = choose(S_Reality_Album,S_Aftermath_Album,S_BeforeTheFiction_Album,S_CorinChoi_Album_FinallyIFoundYou,S_CorinChoi_Album_TheAcceleration);
logo_surface = noone;
logo_splice = 8;
logo_link = 0;
logo_rotate = -60;
logo_scale = 2; logo_alpha = 0;
logo_flash = 0; logo_flash_showed = 0
#endregion

#region
draging = false;
drag_list = noone;
drag_list_x = 0;
drag_list_dx = 0;
drag_list_y = 0;
drag_list_dy = 0;
drag_mouse_x = 0;
drag_mouse_y = 0;
drag_dis = 0;
drag_dis_x = 0;
drag_dis_y = 0;
drag_enable = true;
#endregion