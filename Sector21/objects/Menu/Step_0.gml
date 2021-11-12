var _w, _h;
var _x, _y, _x1, _x2, _y1, _y2;

switch(menu_index)
{
	default:
		if(menu_change == 0)
		{
			menu_change = 1; menu_next = menu.title;
			menu_alpha[1] = 1;
		}
		break;
	case menu.load:
		if(menu_change == 0)
		{
			menu_change = 1; menu_next = menu.logo;
			menu_alpha[1] = 1;
			
			for(var i = 0; i < logo_splice; i++)
			{
				logo_link[i] = random_range(-1,1);
				logo_alpha[i] = 0;
				logo_flash[i] = 0; logo_flash_showed[i] = false;
			}
		}
		break;
	case menu.logo:
		if(menu_change == 0)
		{
			if(menu_tick > room_speed*4)
			{
				menu_change = 1; menu_next = menu.title;
			}
		}
		break;
	case menu.title:
		if(menu_change == 0)
		{
			if(menu_alpha[0] > 0.75)
			{
				if(mouse_check_button_released(mb_left))
				{
					_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_16*2;
					_w = WIDTH_8; _h = HEIGHT_32;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						menu_change = 1; menu_next = menu.play_map;
					}
					
					_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_16*4;
					_w = WIDTH_8; _h = HEIGHT_32;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						menu_change = 1; menu_next = menu.play_tech;
					}
				}
			}
		}
		break;
	case menu.play_map:
		if(menu_change == 0)
		{
			if(menu_alpha[0] > 0.75)
			{
				//drag_enable = true;
				drag_list = game_stage;
				
				if(mouse_check_button_released(mb_left))
				{
					_x = WIDTH_32*5; _y = HEIGHT_16*13;
					_w = WIDTH_32*3; _h = HEIGHT_16;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						drag_list_x -= 1;
					}
					
					_x = WIDTH_32*27; _y = HEIGHT_16*13;
					_w = WIDTH_32*3; _h = HEIGHT_16;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						drag_list_x += 1;
					}
					
					_x = WIDTH_32*5; _y = HEIGHT_16*15;
					_w = WIDTH_32*3; _h = HEIGHT_32;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						menu_change = 1; menu_next = menu.title;
					}
					
					_x = WIDTH_32*27; _y = HEIGHT_16*15;
					_w = WIDTH_32*3; _h = HEIGHT_32;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						menu_change = 1; menu_next = menu.play_tech;
					}
					
					_x = WIDTH_2; _y = HEIGHT_32*29;
					_w = WIDTH_8; _h = HEIGHT_64*3;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						var _r = min(WIDTH,HEIGHT)*0.625/2;
						draw_effect_bloom(WIDTH_2,HEIGHT_2,WIDTH_2,HEIGHT_2,60,[_r,_r*1.125],[_r*4,_r*4.5],c_white,c_white,1,0,ROOMSPEED_D4);
						menu_change = 1; menu_next = menu.game;
					}
				}
			}
		}
		break;
	case menu.play_tech:
		if(menu_change == 0)
		{
			if(mouse_check_button_released(mb_left))
			{
				for(var i = 0; i < array_length_1d(game_tech); i++)
				{
					for(var j = 0; j < game_tech[i]; j++)
					{
						_x = WIDTH_4+WIDTH_32+WIDTH_8*j; _y = HEIGHT_4+HEIGHT_8*0.75*i;
						_w = WIDTH_16*0.875; _h = HEIGHT_16*0.75*0.875;
					
						if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
						{
							game_tech_select[i] = j;
							
							if(global.grid_cursor = noone)
							{
								global.grid_cursor = [noone,i,j];
							}
							else
							{
								if(global.grid_cursor[1] == i and global.grid_cursor[2] == j)
								{
									global.grid_cursor = noone;	
								}
								else
								{
									global.grid_cursor = [noone,i,j];
								}
							}
						}
					}
				}
				
				if(global.grid_cursor != noone)
				{
					if(game_tech_upgrade > 0)
					{
						_x = WIDTH_32*8; _y = HEIGHT_64*50;
						_w = WIDTH_64; _h = HEIGHT_16;
						if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
						{
							game_tech_upgrade--;
						}
					}
					
					if(game_tech_upgrade < 5)
					{
						_x = WIDTH_32*24; _y = HEIGHT_64*50;
						_w = WIDTH_64; _h = HEIGHT_16;
						if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
						{
							game_tech_upgrade++;
						}
					}
				}
			
				_x = WIDTH_32*5; _y = HEIGHT_16*15;
				_w = WIDTH_32*3; _h = HEIGHT_32;
				if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
				{
					menu_change = 1; menu_next = menu.title;
					
					global.grid_cursor = noone;
					game_tech_select = global.tower_tech;
					
					game_tech_upgrade = 0;
				}
			
				_x = WIDTH_32*27; _y = HEIGHT_16*15;
				_w = WIDTH_32*3; _h = HEIGHT_32;
				if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
				{
					menu_change = 1; menu_next = menu.title;
					
					global.tower_tech = game_tech_select;
					global.grid_cursor = noone;
					
					game_tech_upgrade = 0;
				}
			}
		}
		break;
	case menu.game:
		if(menu_change == 0)
		{
			if(menu_tick == 0)
			{
				game_instance = instance_create_layer(WIDTH_2,HEIGHT_2,"Game",Game);
				game_instance.game_enemy_pattern = Game_Pattern_Stage1;
				global.game = game_instance;
			}
		}
		break;
}

if(menu_change > 0)
{
	if(menu_change = 1)
	{
		drag_enable = false;
		
		menu_change += menu_alpha[2];	
	}
	else
	{
		menu_change -= global.d_time;
		if(menu_change <= 1)
		{
			menu_change = 0;
			menu_tick = 0;
			
			drag_list = noone;
		
			drag_list_x = 0;
			drag_list_y = 0;
			drag_list_dx = 0;
			drag_list_dy = 0;
			
			menu_index = menu_next;
		}
		
		menu_alpha[0] += min(abs(-menu_alpha[0]),1/menu_alpha[2])*sign(-menu_alpha[0]);
	}
}
else
{
	menu_tick += global.d_time;
	
	menu_alpha[0] += (menu_alpha[1]-menu_alpha[0])/(menu_alpha[2]/2);
}

repeat(round(global.d_time))
{
	drag_list_x += (drag_dis_x*sign(mouse_x-drag_mouse_x)/(room_width/16));
	drag_list_y += (drag_dis_y*sign(mouse_y-drag_mouse_y)/(room_height/16));
}
if(drag_list != noone)
{
	drag_list_x = median(0,drag_list_x,ds_list_size(drag_list)-1);
	drag_list_y = median(0,drag_list_y,ds_list_size(drag_list)-1);
}
repeat(round(global.d_time))
{
	drag_list_dx += ((drag_list_x-drag_list_dx)/(room_speed/10));
	drag_list_dy += ((drag_list_y-drag_list_dy)/(room_speed/10));
}
if(drag_enable)
{
	if(mouse_check_button_pressed(mb_left))
	{
		drag_mouse_x = mouse_x;
		drag_mouse_y = mouse_y;
	}
	
	if(mouse_check_button(mb_left))
	{
		drag_dis = point_distance(mouse_x,mouse_y,drag_mouse_x,drag_mouse_y);
	
		if(draging = false)
		{
			if(drag_dis > 4)
			{
				drag_dis_x = point_distance(mouse_x,0,drag_mouse_x,0);
				drag_dis_y = point_distance(0,mouse_y,0,drag_mouse_y);
		
				draging = true;
			}
			else
			{
				drag_dis_x = 0;
				drag_dis_y = 0;
			}
		}
		else
		{
			drag_dis_x = point_distance(mouse_x,0,drag_mouse_x,0);
			drag_dis_y = point_distance(0,mouse_y,0,drag_mouse_y);
		}
	
		drag_mouse_x = mouse_x;
		drag_mouse_y = mouse_y;
	}

	if(mouse_check_button_released(mb_left))
	{
		draging = false;
	
		drag_dis = 0;
		
		drag_dis_x = 0;
		drag_dis_y = 0;
	
		drag_list_x = round(drag_list_x);
		drag_list_y = round(drag_list_y);
	}
}