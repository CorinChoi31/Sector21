if(global.glitch > 0)
{
	global.glitch += (0-global.glitch)/(room_speed);	
}

if(!game_ready)
{
	ds_grid_clear(global.grid_hex,noone);
	ds_grid_clear(global.grid_hex_tile,noone);
	ds_grid_clear(global.grid_hex_tower,noone);
	
	for(var q = -global.grid_radius; q <= global.grid_radius; q++)
	{
		var r1 = max(-global.grid_radius, -q-global.grid_radius);
		var r2 = min(global.grid_radius, -q+global.grid_radius);
	
		for(var r = r1; r <= r2; r++)
		{
			if(hex_distance_by_pos(0,0,q,r) = 3)
			{
				var _ins = instance_create_layer(room_width/2,room_height/2,"Tile",Game_Tile);
					_ins.point = [q, r, -q-r];
					_ins.pos = [q, r];
				
					_ins.color_dest = c_dkgray;
			
					_ins.cost = 1;
					
				global.grid_hex[# global.grid_radius+q,global.grid_radius+r] = 1;
				global.grid_hex_tile[# global.grid_radius+q,global.grid_radius+r] = _ins;
			}
		}
	}
	
	game_center = instance_create_layer(room_width/2,room_height/2,"Tower",Game_Center);
	
	if(game_enemy_pattern != noone)
	{
		instance_create_layer(x,y,layer,game_enemy_pattern);
	}
	
	game_ready = true;
}
else
{
	var _w, _h;
	var _x, _y, _x1, _x2, _y1, _y2;
	
	game_alpha += (1-game_alpha)/(room_speed/4);
	
	if(game_done == 0)
	{
		if(!game_start)
		{
			game_interface_y[0] = 0;
		
			if(mouse_check_button_released(mb_left))
			{
				_w = WIDTH_8; _h = HEIGHT_32;
				_x = WIDTH_2; _y = HEIGHT_32-_h*4*game_interface_dy[0];
				if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
				{
					game_start = true;
				
					game_enemy_wait = room_speed*5;
				
					game_interface_y[0] = 1;
				
					game_interface_y[1] = 0;
					game_interface_dy[1] = 1;
				}
				
				_w = WIDTH_16; _h = HEIGHT_32;
				_x = WIDTH_32*29; _y = HEIGHT_16;
				if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
				{
					global.menu.menu_change = 1;
					global.menu.menu_next = menu.title;
					
					layer_destroy_instances("Effect");
					
					with(Game_Center)
						instance_destroy();
					with(Game_Tile)
						instance_destroy();
					with(Game_ProjectTile)
						instance_destroy();
					with(Game_Tower)
						instance_destroy();
					with(Game_Mob)
						instance_destroy();
						
					instance_destroy();
				}
			}
		}
		else
		{
			if(game_pause == 0)
			{
				game_tick_frame = global.d_time;
				
				if(os_type == os_android)
				{
					game_pause = global.d_pause;
				}
				
				if(mouse_check_button_released(mb_left))
				{
					_w = WIDTH_16; _h = HEIGHT_32;
					_x = WIDTH_32*29; _y = HEIGHT_16;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						game_pause = 1;
					}
				}
				
				if(game_pause)
				{
					game_pause_sprite = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),false,false,0,0);
					game_pause = room_speed; game_pause_tick = 0;
						
					game_tick_frame = 0;
					
					instance_deactivate_layer("Effect");
					
					instance_deactivate_object(Game_Center);
					instance_deactivate_object(Game_ProjectTile);
					instance_deactivate_object(Game_Mob);
					instance_deactivate_object(Game_Tower);
					instance_deactivate_object(Game_Tile);
				}
				
				game_tick += game_tick_frame;
			}
			
			if(game_pause == 0)
			{
				if(mouse_check_button_released(mb_left))
				{
					if(game_enemy_wait > room_speed)
					{
						_w = WIDTH_8; _h = HEIGHT_16;
						_x = WIDTH_2; _y = HEIGHT_16-_h*4*game_interface_dy[1];
						if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
						{
							var _v = floor(((game_enemy_wait+room_speed/2)/room_speed)/2);
							game_score_bonus += _v;
							
							draw_set_font(GodoM_R16);
							draw_notify(_x,_y,string(_v)+"%",GodoM_R16,c_white,1,16+string_width(_v),string_height(_v)/4,c_black,0.25,room_speed,room_speed,WIDTH_64,HEIGHT_64*59,noone);
							
							game_enemy_wait = room_speed;
						}
					}
					else
					{
			
					}
				}
				
				if(game_enemy_next)
				{
					game_enemy_wait = 0;
					game_enemy_wave++;
			
					game_interface_y[1] = 1;
			
					var _n, _r;
					for(var i = ds_list_size(game_enemy_list)-1; i >= 0; i--)
					{
						_n = game_enemy_list[|i];
						if(_n[0] <= game_enemy_wave)
						{
							for(var j = 0; j < _n[3]; j++)
							{
								switch(_n[1])
								{
									default:
									case 0:
										_r = choose(random_range(point_direction(room_width/2,room_height/2,0,0),point_direction(room_width/2,room_height/2,0,room_height)),
											random_range(point_direction(room_width/2,room_height/2,room_width,room_height),point_direction(room_width/2,room_height/2,room_width,0)+360));
										break;
									case 1:
										_r = random_range(point_direction(room_width/2,room_height/2,room_width,room_height),point_direction(room_width/2,room_height/2,room_width,0)+360);
										break;
									case -1:
										_r = random_range(point_direction(room_width/2,room_height/2,0,0),point_direction(room_width/2,room_height/2,0,room_height));
										break;
								}
								_x = room_width/2+lengthdir_x((room_width+room_height)/2,_r);
								_y = room_height/2+lengthdir_y((room_width+room_height)/2,_r);
						
								ds_list_add(game_enemy_entry,[_x,_y,_n[2]]);
							}
							ds_list_delete(game_enemy_list,i);
						}
					}
			
					game_enemy_next = false;
				}
		
				if(game_enemy_wait == 0)
				{
					if(game_enemy_create <= 0)
					{
						var _n = 0;
						if(ds_list_size(game_enemy_entry) > 0)
						{
							_n = game_enemy_entry[|0];
							mob_spawn(_n[0],_n[1],_n[2]);
					
							ds_list_delete(game_enemy_entry,0);
							
							if(ds_list_size(game_enemy_entry) > 15)
							{
								game_enemy_create += room_speed*0.5;
							}
							else
							{
								game_enemy_create += room_speed;	
							}
						}
						else
						{
							if(ds_list_size(game_enemy_list) > 0)
							{
								game_interface_y[1] = 0;
								game_enemy_wait = room_speed*20;
							}
						}
					}
					else
					{
						game_enemy_create -= global.d_time;	
					}
				}
				else
				{
					game_enemy_wait -= global.d_time;
					if(game_enemy_wait <= 0)
					{
						game_enemy_next = true;
					}
				}
		
				if(game_cost_recharge <= 0)
				{
					game_cost_recharge += game_cost_recharge_speed-game_center.unit_upgrade_cost*(game_cost_recharge_speed/7);
				}
				else
				{
					game_cost_recharge -= global.d_time;
					if(game_cost_recharge <= 0)
					{
						if(game_cost < 255)
						{
							game_cost = game_cost+1;
						}
					}
				}
				
				if(game_center.unit_health <= 0)
				{
					with(Game_Tower)
					{
						if(!unit_death)
						{
							unit_death = true;
						}
					}
					
					with(Game_Tile)
					{
						point = [0,0,0];
						color_dest = c_black;
					}
					
					game_done = room_speed;
					game_done_type = -1;
					
					game_cost = 0;
				}
				else
				{
					if(game_center.unit_health < game_center.unit_health_max)
					{
						game_score_center = false;
						
						game_center.unit_health += min(abs(game_center.unit_health_max-game_center.unit_health),(1/room_speed)*game_tick_frame)*sign(game_center.unit_health_max-game_center.unit_health);
					}
					
					if(!instance_exists(Game_Mob) and ds_list_size(game_enemy_list) == 0 and ds_list_size(game_enemy_entry) == 0)
					{
						game_done = room_speed;
						game_done_type = 1;
					}
				}
			}
			else
			{
				game_tick = 0;
				game_pause_tick += global.d_time;
			
				if(game_pause = room_speed)
				{
					if(mouse_check_button_released(mb_left))
					{
						_x = WIDTH_2; _y = HEIGHT_2-HEIGHT_16*3;
						_w = WIDTH_8; _h = HEIGHT_32;
						if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
						{
							game_pause_select = 0;
							game_pause = room_speed-1;
						}
					
						_x = WIDTH_2; _y = HEIGHT_2-HEIGHT_16;
						_w = WIDTH_8; _h = HEIGHT_32;
						if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
						{
							game_pause_select = 1;
							game_pause = room_speed-1;
						}
					
						_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_16*3;
						_w = WIDTH_8; _h = HEIGHT_32;
						if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
						{
							global.menu.menu_change = 1;
							global.menu.menu_next = menu.title;
							
							game_pause_select = 2;
							game_pause = room_speed-1;
						}
					}
				}
				else
				{
					game_pause -= global.d_time;
				
					if(game_pause <= 0)
					{
						game_pause = 0;
					
						instance_activate_layer("Effect");
						
						instance_activate_object(Game_Center);
						instance_activate_object(Game_ProjectTile);
						instance_activate_object(Game_Mob);
						instance_activate_object(Game_Tower);
						instance_activate_object(Game_Tile);
						
						switch(game_pause_select)
						{
							default:
							case 0:
							
								break;
							case 1:
								layer_destroy_instances("Effect");
								
								with(Game_Center)
									instance_destroy();
								with(Game_Tile)
									instance_destroy();
								with(Game_ProjectTile)
									instance_destroy();
								with(Game_Tower)
									instance_destroy();
								with(Game_Mob)
									instance_destroy();
								
								var _ins = instance_create_layer(WIDTH_2,HEIGHT_2,"Game",Game);
								global.menu.game_instance = _ins; global.game = _ins;
								_ins.game_enemy_pattern = game_enemy_pattern;
								
								instance_destroy();
								break;
							case 2:
								layer_destroy_instances("Effect");
								
								with(Game_Center)
									instance_destroy();
								with(Game_Tile)
									instance_destroy();
								with(Game_ProjectTile)
									instance_destroy();
								with(Game_Tower)
									instance_destroy();
								with(Game_Mob)
									instance_destroy();
							
								instance_destroy();
								break;
						}
						sprite_delete(game_pause_sprite);
					}
				}
			}
		}
	}
	else
	{
		global.grid_cursor = noone;
		if(game_done_tick == 0)
		{
			var _score = game_score;
			if(game_score_center)
			{
				_score += floor(game_score*0.25);
			}
			_score += floor(game_score*(game_score_bonus/100));
			
			game_score = _score;
		}
		
		game_done_tick += global.d_time;
		
		if(game_done_tick > room_speed*3)
		{
			repeat(round(global.d_time))
			{
				game_score_soft += (game_score-game_score_soft)/(room_speed/4);
			}
		}
		
		if(game_done = room_speed)
		{
			if(game_done_tick > room_speed*3)
			{
				if(mouse_check_button_released(mb_left))
				{
					_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_32*9;
					_w = WIDTH_8; _h = HEIGHT_32;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						game_done_select = 1;
						game_done = room_speed-1;
					}
					
					_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_16*6;
					_w = WIDTH_8; _h = HEIGHT_32;
					if(point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h))
					{
						global.menu.menu_change = 1;
						global.menu.menu_next = menu.title;
						
						game_done_select = 2;
						game_done = room_speed-1;
					}
				}
			}
		}
		else
		{
			game_done -= global.d_time;
			
			if(game_done <= 1)
			{
				switch(game_done_select)
				{
					default:
					case 0:
							
						break;
					case 1:
						layer_destroy_instances("Effect");
						
						with(Game_Center)
							instance_destroy();
						with(Game_Tile)
							instance_destroy();
						with(Game_ProjectTile)
							instance_destroy();
						with(Game_Tower)
							instance_destroy();
						with(Game_Mob)
							instance_destroy();
								
						var _ins = instance_create_layer(WIDTH_2,HEIGHT_2,"Game",Game);
						global.menu.game_instance = _ins; global.game = _ins;
						_ins.game_enemy_pattern = game_enemy_pattern;
								
						instance_destroy();
						break;
					case 2:
						layer_destroy_instances("Effect");
						
						with(Game_Center)
							instance_destroy();
						with(Game_Tile)
							instance_destroy();
						with(Game_ProjectTile)
							instance_destroy();
						with(Game_Tower)
							instance_destroy();
						with(Game_Mob)
							instance_destroy();
							
						instance_destroy();
						break;
				}
			}
		}
	}

	if(game_pause == 0)
	{
		repeat(round(global.d_time))
		{
			for(var i = 0; i < array_length_1d(game_interface_y); i++)
			{
				game_interface_dy[i] += (game_interface_y[i]-game_interface_dy[i])/(room_speed/4);
			}
		}
		
		repeat(round(global.d_time))
		{
			game_cost_soft += (game_cost-game_cost_soft)/(room_speed/10);
		}
		if(global.grid_cursor = noone)
		{
			repeat(round(global.d_time))
			{
				for(var i = 0; i < 5; i++)
				{
					game_cursor_y[i] += (1-game_cursor_y[i])/(room_speed/5);
				}
			}
		}
		else
		{
			switch(global.grid_cursor[0])
			{
				case "center":
					repeat(round(global.d_time))
					{
						game_cursor_y[0] += (-game_cursor_y[0])/(room_speed/4);
						game_cursor_y[1] += (1-game_cursor_y[1])/(room_speed/4);
						game_cursor_y[2] += (1-game_cursor_y[2])/(room_speed/5);
						game_cursor_y[3] += (1-game_cursor_y[3])/(room_speed/5);
						game_cursor_y[4] += (-game_cursor_y[4])/(room_speed/5);
					}
					break;
				case "tile":
					repeat(round(global.d_time))
					{
						for(var i = 0; i < 5; i++)
						{
							game_cursor_y[i] += ((global.tower_tech[i] == noone)-game_cursor_y[i])/(room_speed/4);
						}
					}
					break;
				case "tower":
					repeat(round(global.d_time))
					{
						game_cursor_y[0] += (-game_cursor_y[0])/(room_speed/4);
						game_cursor_y[1] += (1-game_cursor_y[1])/(room_speed/5);
						game_cursor_y[2] += (1-game_cursor_y[2])/(room_speed/5);
						game_cursor_y[3] += (1-game_cursor_y[3])/(room_speed/5);
						game_cursor_y[4] += (-game_cursor_y[4])/(room_speed/4);
					}
					break;
			}
		}
	}
	else
	{
		
	}
}

/*
if(keyboard_check_pressed(vk_space))
{
	game_cost += 100;	
}
*/