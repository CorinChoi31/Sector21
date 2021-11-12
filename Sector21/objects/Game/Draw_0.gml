var _alpha = 1;
var _color = c_white;
var _w, _h;
var _x, _y, _x1, _x2, _y1, _y2;

draw_set_alpha(game_alpha);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if(game_pause == 0)
{
	if(!game_start)
	{
		_w = WIDTH_8; _h = HEIGHT_32;
		_x = WIDTH_2; _y = HEIGHT_32-_h*4*game_interface_dy[0];
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_halign(fa_center); draw_set_valign(fa_middle);
		draw_set_font(GodoM_R32);
		draw_text(_x,_y,"웨이브 시작");
		
		_w = WIDTH_32; _h = HEIGHT_32;
		_x = WIDTH_32*30; _y = HEIGHT_16;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,true);
		draw_set_font(GodoM_R24);
		draw_text(_x,_y,"<");
	}
	else
	{
		draw_set_halign(fa_center); draw_set_valign(fa_middle);
		
		_w = WIDTH_32; _h = HEIGHT_32;
		_x = WIDTH_32*30; _y = HEIGHT_16;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,true);
		draw_set_font(GodoM_R24);
		draw_text(_x,_y,"||");
		
		if(game_interface_dy[0] != 1)
		{
			_w = WIDTH_8; _h = HEIGHT_32;
			_x = WIDTH_2; _y = HEIGHT_32-_h*4*game_interface_dy[0];
			draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
			draw_set_font(GodoM_R32);
			draw_text(_x,_y,"웨이브 시작");
		}
		_w = WIDTH_8; _h = HEIGHT_16;
		_x = WIDTH_2; _y = HEIGHT_16-_h*4*game_interface_dy[1];
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
	
		draw_set_font(GodoM_R24);
		if(game_enemy_wait > room_speed)
		{
			draw_text(_x,_y-_h*0.65,string(game_enemy_wave+2)+" 웨이브 시작까지 "+string_format(game_enemy_wait/room_speed,0,1)+"초 남음");
			draw_set_font(GodoM_R16);
			draw_text(_x,_y+_h*0.825,"즉시 시작");
		}
		else
		{
			draw_text(_x,_y-_h*0.65,"다음 웨이브 시작");
		}
	}
	
	draw_set_halign(fa_left); draw_set_valign(fa_bottom);
	draw_set_color(c_white); draw_set_alpha(game_alpha*0.75);
	draw_set_font(global.font);
	draw_text_transformed(WIDTH_64,HEIGHT_64*63,game_score,0.375,0.375,0);
	draw_text_transformed(WIDTH_64,HEIGHT_64*59,"BONUS "+string(game_score_bonus),0.15,0.15,0);
	draw_set_halign(fa_right);
	draw_set_alpha(game_alpha*0.5);
	draw_text_transformed(WIDTH_64*63,HEIGHT_64*63,string(game_enemy_wave+1)+" WAVE",0.325,0.325,0);
	
	draw_set_halign(fa_center); draw_set_valign(fa_top);
	for(var i = 0; i < 5; i++)
	{
		if(game_cursor_y[i] < 0.99)
		{
			var _r = sqrt(sqr(global.grid_length*0.9)-sqr(global.grid_length*0.9/2));
		
			var _xx = room_width/16*5+room_width/16*1.5*i;
			var _yy = room_height/64*61+room_height/4*game_cursor_y[i];
			var _rr = false;
		
			if(point_in_circle(mouse_x,mouse_y,_xx,_yy,_r))
			{
				_rr = true;
				draw_fan(_xx,_yy,global.grid_length*1,global.grid_length*1.1,180,0,60,c_white,1,false);
			}
			else
			{
				draw_fan(_xx,_yy,global.grid_length*0.9,global.grid_length*1,180,0,60,c_white,1,false);
			}
			
			if(global.grid_cursor != noone)
			{
				var _cost_buy = 0;
				var _x = global.grid_center[0]+(global.grid_length*((global.grid_horizontal)*global.grid_cursor[1]));
				var _y = global.grid_center[1]+(global.grid_length*((global.grid_vectical/2)*global.grid_cursor[1]+(global.grid_vectical)*global.grid_cursor[2]));
			
				switch(global.grid_cursor[0])
				{
					case "center":
						#region
						switch(i)
						{
							case 0:
								if(game_center.unit_upgrade_cost < 5)
								{
									_cost_buy = series(10,game_center.unit_upgrade_cost+2);
								
									draw_set_valign(fa_bottom); draw_set_font(GodoM_R24);
									draw_text(_xx,_yy,"자원 +");
								
									draw_set_valign(fa_top); draw_set_font(GodoM_R16);
									draw_text(_xx,_yy,"-"+string(_cost_buy)+"\nCOST");
								
									if(_rr = true and mouse_check_button_released(mb_left) and game_cost >= _cost_buy)
									{
										game_center.unit_upgrade_cost += 1;
									
										game_cost -= _cost_buy;
										
										draw_effect_bloom(_x,_y,_x,_y,12,[game_center.range[0],game_center.range[0]*1.25],[game_center.range[1]*0.9,game_center.range[1]],$BFFF00,c_white,1,0,room_speed/4);
									}
								}
								else
								{
									draw_set_valign(fa_bottom); draw_set_font(GodoM_R24);
									draw_text(_xx,_yy,"자원 +");
								
									draw_set_valign(fa_top); draw_set_font(GodoM_R16);
									draw_text(_xx,_yy,"MAX");
								}
								break;
							case 4:
								if(!game_center.unit_upgrade_tile)
								{
									_cost_buy = 100;
								
									draw_set_valign(fa_bottom); draw_set_font(GodoM_R24);
									draw_text(_xx,_yy,"타일 +");
								
									draw_set_valign(fa_top); draw_set_font(GodoM_R16);
									draw_text(_xx,_yy,"-"+string(_cost_buy)+"\nCOST");
								
									if(_rr = true and mouse_check_button_released(mb_left) and game_cost >= _cost_buy)
									{
										game_center.unit_upgrade_tile = true;
									
										var _p = 0;
										for(var q = -global.grid_radius; q <= global.grid_radius; q++)
										{
											var r1 = max(-global.grid_radius, -q-global.grid_radius);
											var r2 = min(global.grid_radius, -q+global.grid_radius);
	
											for(var r = r1; r <= r2; r++)
											{
												if(hex_distance_by_pos(0,0,q,r) = 2)
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
										
										game_cost -= _cost_buy;
										
										draw_effect_bloom(_x,_y,_x,_y,12,[game_center.range[0],game_center.range[0]*1.25],[game_center.range[1]*0.9,game_center.range[1]],$BFFF00,c_white,1,0,room_speed/4);
									}
								}
								else
								{
									draw_set_valign(fa_bottom); draw_set_font(GodoM_R24);
									draw_text(_xx,_yy,"타일 +");
								
									draw_set_valign(fa_top); draw_set_font(GodoM_R16);
									draw_text(_xx,_yy,"구매 완료");
								}
								break;
						}
						#endregion
						break;
					case "tile":
						#region
						if(global.tower_tech[i] != noone)
						{
							_cost_buy = global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"cost"];
					
							var _density = global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"density"];
							var _rotate = global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"rotate"];
							var _color = global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"color"];
						
							var _amount = global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"attack_amount"];
							var _speed = global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"attack_speed"];
							var _range = global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"attack_range"];
							var _length = global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"attack_length"];
							var _up_cost = 	global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"upgrade_cost"];
							var _up_amount = 	global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"upgrade_attack_amount"];
							var _up_speed = 	global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"upgrade_attack_speed"];
							var _up_range = 	global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"upgrade_attack_range"];
							var _up_length = 	global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"upgrade_attack_length"];
							var _description = global.tower_info[? string(i)+","+string(global.tower_tech[i])+"."+"description"];
					
							draw_set_color(c_white);						
							draw_set_halign(fa_center); draw_set_valign(fa_top); 
							draw_set_font(GodoM_R16);
							draw_text(_xx,_yy,string(_cost_buy)+"\nCOST");
					
							draw_fan(_xx,_yy-global.grid_length*0.3,global.grid_length*0.25*0.75,global.grid_length*0.25,180,0,_density,_color,1,false,_rotate);
						
							if(_rr = true)
							{
								draw_set_alpha(0.5); draw_set_color(c_black);
								draw_pr_rectangle(WIDTH_16*5-global.grid_length,HEIGHT_16*13-global.grid_length*2,WIDTH_16*11+global.grid_length,HEIGHT-global.grid_length*2,false);
								draw_set_alpha(0.75); draw_set_color(c_white);
								draw_pr_rectangle(WIDTH_16*5-global.grid_length,HEIGHT_16*13-global.grid_length*2,WIDTH_16*11+global.grid_length,HEIGHT-global.grid_length*2,true);
							
								draw_set_valign(fa_middle);
								draw_set_font(GodoM_R24);
		
								var _text = 0; _text = ["","","","","",""];
								var _value = 0; _value = ["","","","","",""];
								var _value_end = 0; _value_end = ["","","","","",""];
							
								switch(i)
								{
									default:
									case 0:
										switch(global.tower_tech[i])
										{
											default:
												_text = ["공격 피해량","공격 주기","","","","사거리"];
												_value = [string(_amount),string(_speed),"","","",string(_length/global.grid_length)];
												_value_end = ["","초","","","",""];
												break;
										}
										break;
									case 1:
										switch(global.tower_tech[i])
										{
											default:
												_text = ["공격 피해량","공격 주기","","","피해 범위","사거리"];
												_value = [string(_amount),string(_speed),"","",string(_range/global.grid_length),string(_length/global.grid_length)];
												_value_end = ["","초","","","",""];
												break;
										}
										break;
									case 2:
										switch(global.tower_tech[i])
										{
											default:
											case 0:
											case 4:
												_text = ["방어력 감소","적용 주기","","","","사거리"];
												_value = [string(_amount*100),string(_speed),"","","",string(_length/global.grid_length)];
												_value_end = ["%","초","","","",""];
												break;
											case 1:
												_text = ["공격 피해량","공격 주기","","","","사거리"];
												_value = [string(_amount),string(_speed),"","","",string(_length/global.grid_length)];
												_value_end = ["","초","","","",""];
												break;
											case 2:
											case 3:
												_text = ["","적용 주기","","","","사거리"];
												_value = ["",string(_speed),"","","",string(_length/global.grid_length)];
												_value_end = ["","초","","","",""];
												break;
										}
										break;
									case 3:
										switch(global.tower_tech[i])
										{
											default:
											case 0:
												_text = ["공격 피해량","공격 주기","","둔화량","피해 범위","사거리"];
												_value = [string(_amount),string(_speed),"",string((0.25)*100),string(_range/global.grid_length),string(_length/global.grid_length)];
												_value_end = ["","초","","%","",""];
												break;
											case 1:
												_text = ["공격 피해량","공격 주기","","지속시간","피해 범위","사거리"];
												_value = [string(_amount),string(_speed),"",string_format(0.125,0,3),string(_range/global.grid_length),string(_length/global.grid_length)];
												_value_end = ["","초","","초","",""];
												break;
											case 2:
												_text = ["공격 피해량","공격 주기","","둔화량","","사거리"];
												_value = [string(_amount),string(_speed),"",string((0.2)*100),"",string(_length/global.grid_length)];
												_value_end = ["","초","","%","",""];
												break;
											case 3:
												_text = ["공격 피해량","공격 주기","","지속시간","","사거리"];
												_value = [string(_amount),string(_speed),"",string_format(1.75,0,2),"",string(_length/global.grid_length)];
												_value_end = ["","초","","초","",""];
												break;
										}
										break;
									case 4:
										switch(global.tower_tech[i])
										{
											default:
											case 0:
												_text = ["효과 증가량","적용 주기","","","","사거리"];
												_value = [string(_amount*100),string(_speed),"","","",string(_length/global.grid_length)];
												_value_end = ["%","초","","","",""];
												break;
											case 1:
												_text = ["효과 증가량","적용 주기","","","","사거리"];
												_value = [string(_amount*100),string(_speed),"","","",string(_length/global.grid_length)];
												_value_end = ["%","초","","","",""];
												break;
											case 2:
												_text = ["효과 증가량","적용 주기","","","","사거리"];
												_value = [string(_amount*100),string(_speed),"","","",string(_length/global.grid_length)];
												_value_end = ["%","초","","","",""];
												break;
											case 3:
												_text = ["효과 증가량","적용 주기","","","","사거리"];
												_value = [string(_amount*100),string(_speed),"","","",string(_length/global.grid_length)];
												_value_end = ["%","초","","","",""];
												break;
											case 4:
												_text = ["효과 전환량","적용 주기","","","","사거리"];
												_value = [string(_amount*100),string(_speed),"","","",string(_length/global.grid_length)];
												_value_end = ["%","초","","","",""];
												break;
										}
										break;
								}
							
								draw_set_halign(fa_left);
								draw_text(WIDTH_64*21-global.grid_length,HEIGHT_64*57-global.grid_length*2,_text[0]);
								draw_text(WIDTH_64*21-global.grid_length,HEIGHT_64*60-global.grid_length*2,_text[1]);
								draw_text(WIDTH_64*21-global.grid_length,HEIGHT_64*63-global.grid_length*2,_text[2]);
	
								draw_text(WIDTH_64*37-global.grid_length,HEIGHT_64*57-global.grid_length*2,_value[3]+_value_end[3]);
								draw_text(WIDTH_64*37-global.grid_length,HEIGHT_64*60-global.grid_length*2,_value[4]+_value_end[4]);
								draw_text(WIDTH_64*37-global.grid_length,HEIGHT_64*63-global.grid_length*2,_value[5]+_value_end[5]);
	
								draw_set_halign(fa_right);
								draw_text(WIDTH_64*27+global.grid_length,HEIGHT_64*57-global.grid_length*2,_value[0]+_value_end[0]);
								draw_text(WIDTH_64*27+global.grid_length,HEIGHT_64*60-global.grid_length*2,_value[1]+_value_end[1]);
								draw_text(WIDTH_64*27+global.grid_length,HEIGHT_64*63-global.grid_length*2,_value[2]+_value_end[2]);
	
								draw_text(WIDTH_64*43+global.grid_length,HEIGHT_64*57-global.grid_length*2,_text[3]);
								draw_text(WIDTH_64*43+global.grid_length,HEIGHT_64*60-global.grid_length*2,_text[4]);
								draw_text(WIDTH_64*43+global.grid_length,HEIGHT_64*63-global.grid_length*2,_text[5]);
							
								draw_set_font(GodoM_R16);
							
								draw_set_halign(fa_left);
								draw_text(WIDTH_64*21-global.grid_length,HEIGHT_64*54-global.grid_length*2,"업그레이드 비용 : "+string(_up_cost));
							
								draw_set_halign(fa_right);
								draw_text(WIDTH_64*43+global.grid_length,HEIGHT_64*54-global.grid_length*2,_description);
							}
						
							if(_rr = true and mouse_check_button_released(mb_left) and game_cost >= _cost_buy)
							{
								var _ins = instance_create_layer(_x,_y,"Tower",Game_Tower);
								global.grid_hex_tower[# global.grid_cursor[1]+global.grid_radius,global.grid_cursor[2]+global.grid_radius] = _ins;
								_ins.unit_id = i; _ins.unit_type = global.tower_tech[i];
								_ins.point = [global.grid_cursor[1], global.grid_cursor[2], -global.grid_cursor[1]-global.grid_cursor[2]];
								_ins.pos = [global.grid_cursor[1], global.grid_cursor[2]];
						
								global.grid_cursor[0] = "tower";
						
								game_cost -= _cost_buy;
							}
						}
						#endregion
						break;
					case "tower":
						#region
						var _unit = global.grid_hex_tower[# global.grid_cursor[1]+global.grid_radius,global.grid_cursor[2]+global.grid_radius];
					
						var _id = _unit.unit_id;
						var _type = _unit.unit_type;
					
						var _up = _unit.unit_upgrade;
					
						var _cost = global.tower_info[? string(_id)+","+string(_type)+"."+"cost"];
						var _cost_up = global.tower_info[? string(_id)+","+string(_type)+"."+"upgrade_cost"];
					
						draw_set_color(c_white);
						draw_set_alpha(1);
					
						switch(i)
						{
							case 0:
								if(_up < 5)
								{
									_cost_buy = _cost_up*(_up+1);
									draw_set_valign(fa_bottom); draw_set_font(GodoM_R24);
									draw_text(_xx,_yy,"강화");
								
									draw_set_valign(fa_top); draw_set_font(GodoM_R16);
									draw_text(_xx,_yy,"-"+string(_cost_buy)+"\nCOST");
								
									if(_rr = true and mouse_check_button_released(mb_left) and game_cost >= _cost_buy)
									{
										if(_unit.unit_upgraded = _unit.unit_upgrade)
										{
											_unit.unit_upgrade += 1;
										
											game_cost -= _cost_buy;
										}
									}
								}
								else
								{
									draw_set_valign(fa_bottom); draw_set_font(GodoM_R24);
									draw_text(_xx,_yy,"강화");
								
									draw_set_valign(fa_top); draw_set_font(GodoM_R16);
									draw_text(_xx,_yy,"MAX");
								}
								break;
							case 4:
								draw_set_valign(fa_bottom); draw_set_font(GodoM_R24);
								draw_text(_xx,_yy,"회수");
							
								draw_set_valign(fa_top); draw_set_font(GodoM_R16);
								draw_text(_xx,_yy,"+"+string(round(_unit.unit_cost_return))+"\nCOST");
								if(_rr = true and mouse_check_button_released(mb_left))
								{
									if(_unit.unit_upgraded = _unit.unit_upgrade)
									{
										draw_effect_bloom(_x,_y,_x,_y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1,global.grid_length*1.125],c_red,c_white,1,0,room_speed/4);
									
										_unit.unit_death = true;
										global.grid_hex_tower[# global.grid_cursor[1]+global.grid_radius,global.grid_cursor[2]+global.grid_radius] = noone;
									
										global.grid_cursor[0] = "tile";
								
										game_cost += round(_unit.unit_cost_return);
									}
								}
								break;
							default:
								break;
						}
						#endregion
						break;
				}
			}
		}
	}
}
else
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_sprite_ext(game_pause_sprite,0,0,0,room_width/sprite_get_width(game_pause_sprite),room_height/sprite_get_height(game_pause_sprite),0,c_white,1);
	
	if(game_pause = room_speed)
	{
		_alpha = min(1,power(game_pause_tick/room_speed,3));
	}
	else
	{
		_alpha = min(1,power(game_pause/room_speed,3));
	}
	
	draw_set_alpha(_alpha*0.75);
	draw_set_color(c_black);
	draw_pr_rectangle(0,0,room_width,room_height,false);
	
	draw_set_color(c_white);
	
	draw_set_font(GodoM_R32);
	draw_set_alpha((_alpha-0.5)*2);
	
	_x = WIDTH_2; _y = HEIGHT_2-HEIGHT_16*3;
	_w = WIDTH_8; _h = HEIGHT_32;
	draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
	draw_text(_x,_y,"개시");
	
	_x = WIDTH_2; _y = HEIGHT_2-HEIGHT_16;
	_w = WIDTH_8; _h = HEIGHT_32;
	draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
	draw_text(_x,_y,"재시도");
	
	_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_16*3;
	_w = WIDTH_8; _h = HEIGHT_32;
	draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
	draw_text(_x,_y,"메뉴로 나가기");
	
	if(game_pause_select != 0)
	{
		draw_set_alpha(1-sqr(_alpha));
		draw_set_color(c_black);
		draw_pr_rectangle(0,0,room_width,room_height,false);
	}
}

if(game_done)
{
	global.grid_cursor = noone;
	
	_alpha = min(1,power(game_done_tick/(room_speed),3));
	
	draw_set_alpha(_alpha*0.95);
	draw_set_color(c_black);
	draw_pr_rectangle(0,0,room_width,room_height,false);
	
	draw_fan(WIDTH_2,HEIGHT_2,min(room_width,room_height)/2*0.975,min(room_width,room_height)/2,180,0,60,c_white,_alpha,false);
	
	var _text = "";
	switch(game_done_type)
	{
		default:
		case 1:
			_text = "방어 성공!";
			break;
		case -1:
			_text = "방어 실패";
			break;
	}
	
	draw_set_halign(fa_center); draw_set_valign(fa_middle);
	draw_set_color(c_white); draw_set_alpha(_alpha);
	
	draw_set_font(GodoM_R52);
	draw_text(WIDTH_2,HEIGHT_4,_text);
	
	_alpha = min(1,power((game_done_tick-room_speed*3)/(room_speed),3));
	
	draw_set_font(global.font); draw_set_alpha(_alpha);
	draw_text_transformed(WIDTH_2,HEIGHT_2-HEIGHT_16,round(game_score_soft),0.75,0.75,0);
	
	draw_set_halign(fa_center); draw_set_font(GodoM_R24);
	if(game_score_bonus > 0)
	{
		draw_text(WIDTH_2,HEIGHT_2+HEIGHT_32,"+"+string(game_score_bonus)+"% 추가 보너스");
	}
	if(game_score_center)
	{
		draw_text(WIDTH_2,HEIGHT_2+HEIGHT_64*5,"+"+string(25)+"% 데이터 안전 보너스");
	}
	
	draw_set_halign(fa_center);
	draw_set_font(GodoM_R32);
	draw_set_alpha((_alpha-0.5)*2);
	
	_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_32*9;
	_w = WIDTH_8; _h = HEIGHT_32;
	draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
	draw_text(_x,_y,"재시도");
	
	_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_16*6;
	_w = WIDTH_8; _h = HEIGHT_32;
	draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
	draw_text(_x,_y,"메뉴로 나가기");
	
	if(game_done_select != 0)
	{
		_alpha = min(1,game_done/room_speed);
		
		draw_set_alpha(1-power(_alpha,3));
		draw_set_color(c_black);
		draw_pr_rectangle(0,0,room_width,room_height,false);
	}
}