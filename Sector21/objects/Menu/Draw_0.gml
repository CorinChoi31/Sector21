var _alpha = menu_alpha[0];
var _color = c_white;
var _w, _h;
var _x, _y, _x1, _x2, _y1, _y2;

draw_set_alpha(menu_alpha[0]);

switch(menu_index)
{
	default:
		break;
	case menu.logo:
		#region
		if(is_array(logo_link))
		{
			logo_rotate += (0-logo_rotate)/(room_speed/4);
			logo_scale += (0.5-logo_scale)/(room_speed/4);
			
			for(var i = 0; i < logo_splice; i++)
			{
				logo_link[i] += (0-logo_link[i])/(room_speed/4);
				logo_flash[i] += (0-logo_flash[i])/(room_speed/4);
				if(!logo_flash_showed[i])
				{
					logo_alpha[i] += (1-logo_alpha[i])/(room_speed/8);
					if(menu_tick > room_speed*3+((room_speed/4)/logo_splice)*i)
					{
						logo_flash[i] = 1; logo_flash_showed[i] = true;
					}
				}
				else
				{
					if(menu_tick > room_speed*3.25+((room_speed/4)/logo_splice)*i)
					{
						logo_alpha[i] += (0-logo_alpha[i])/(room_speed/8);
					}
				}
			}
			
			var _spr_w = sprite_get_width(logo_sprite)*logo_scale;
			var _spr_h = sprite_get_height(logo_sprite)*logo_scale;
			var _w = _spr_w/logo_splice;
			var _h = min((menu_tick/room_speed*4),1);
			
			if(!surface_exists(logo_surface))
			{
				logo_surface = surface_create(_spr_w,_spr_h);
			}
			surface_resize(logo_surface,_spr_w,_spr_h);
			surface_set_target(logo_surface);
				draw_clear_alpha(c_white,0);
				
				draw_set_color(c_white);
				draw_set_font(global.font);
				draw_set_halign(fa_center); draw_set_valign(fa_center);
				
				draw_sprite_ext(logo_sprite,-1,_spr_w/2,_spr_h/2,logo_scale,logo_scale,logo_rotate,c_white,0.75);
				gpu_set_blendmode(bm_add);
				draw_text_transformed(_spr_w/2,_spr_h/2,"made by       \n\n     corin choi",0.25,0.25,0);
				gpu_set_blendmode(bm_normal);
				for(var i = 0; i < logo_splice; i++)
				{
					if(logo_flash[i] > 0)
					{
						draw_set_alpha(logo_flash[i]);
						draw_rectangle(i*_w,0,(i+1)*_w,_spr_h,false);
					}
				}
			surface_reset_target();
			
			draw_set_alpha(menu_alpha[0]);
			for(var i = 0; i < logo_splice; i++)
			{
				draw_surface_part_ext(logo_surface,_w*i,_spr_h*_h/4,_w,_spr_h-_spr_h*_h/2,room_width/2+_w*(i-logo_splice/2),room_height/2-_spr_h/2+_spr_h/4*_h+logo_link[i]*room_height/8,1,1,c_white,menu_alpha[0]*logo_alpha[i]);
			}
		}
		
		draw_set_color(c_white);
		draw_set_halign(fa_center); draw_set_valign(fa_bottom);
		draw_set_font(GodoM_R16);
		draw_text(room_width/2,room_height/64*63,"이 게임에는 NHN의 고도체와\n유미주의적 달필가의 Monopoly 폰트가 사용되었습니다.");
		#endregion
		break;
	case menu.title:
		#region
		draw_set_color(c_white);
		draw_set_alpha(menu_alpha[0]-0.9);
		
		draw_pr_rectangle(0,0,WIDTH,HEIGHT,false);
		
		var _r = min(WIDTH,HEIGHT)*(5-menu_alpha[0]*4)
		for(var q = -1; q <= 1; q++)
		{
			var r1 = max(-1, -q-1);
			var r2 = min(1, -q+1);
	
			for(var r = r1; r <= r2; r++)
			{
				var _x = WIDTH_2+(_r/2*((global.grid_horizontal)*q));
				var _y = HEIGHT_2+(_r/2*((global.grid_vectical/2)*q+(global.grid_vectical)*r));
				
				draw_fan(_x,_y,_r/2*0.925,_r/2*0.95,180,0,60,c_white,menu_alpha[0]/8,false);
				draw_fan(_x,_y,0,_r/2*0.925,180,0,60,c_black,menu_alpha[0]/4,false);
			}
		}
		
		draw_set_color(c_white);
		draw_set_alpha((menu_alpha[0]-0.5)*2);
		
		draw_set_halign(fa_center); draw_set_valign(fa_middle);
		draw_set_font(global.font);
		draw_text_transformed(WIDTH_2,HEIGHT_2-HEIGHT_16,"SECTOR 21",0.75,0.75,0);
		
		draw_set_font(GodoM_R36);
		draw_set_alpha((menu_alpha[0]-0.75)*3);
		_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_16*2;
		_w = WIDTH_8; _h = HEIGHT_32;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_alpha((menu_alpha[0]-0.75)*4);
		draw_text(_x,_y,"시작");
		
		draw_set_alpha((menu_alpha[0]-0.75)*3);
		_x = WIDTH_2; _y = HEIGHT_2+HEIGHT_16*4;
		_w = WIDTH_8; _h = HEIGHT_32;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_alpha((menu_alpha[0]-0.75)*4);
		draw_text(_x,_y,"타워 테크 선택");
		#endregion
		break;
	case menu.play_map:
		#region
		draw_set_color(c_white);
		draw_set_alpha(menu_alpha[0]-0.9);
		
		draw_pr_rectangle(0,0,WIDTH,HEIGHT,false);
		
		var _s = 1;
		var _r = min(WIDTH,HEIGHT)*0.625;
		draw_set_halign(fa_center); draw_set_valign(fa_middle);
		for(var i = 0; i < ds_list_size(game_stage); i++)
		{
			_s = 1-abs(drag_list_dx-i)/4;
			if(_s > 0)
			{
				_x = WIDTH_2-WIDTH_8*3*(drag_list_dx-i);
				_y = HEIGHT_2;
				draw_fan(_x,_y,_r/2*1.125*_s,_r/2*1.15*_s,180,0,60,c_white,(menu_alpha[0]-0.75)*4*sqr(_s),false);
				draw_set_font(global.font);
				draw_text_transformed(_x,_y-HEIGHT_8,game_stage[|i],0.25*_s,0.25*_s,0);
			}
		}
		
		draw_fan(WIDTH_2,HEIGHT_2,_r/2*1.125,max(WIDTH,HEIGHT)*2,180,0,60,c_black,menu_alpha[0]*0.25,false);
		
		_r = min(WIDTH,HEIGHT)*0.625*(10-menu_alpha[0]*9);
		draw_set_color(c_white);
		draw_set_alpha(menu_alpha[0]);
		draw_pr_rectangle(0,HEIGHT_2-HEIGHT_64/4,WIDTH_2-_r/2*0.975,HEIGHT_2+HEIGHT_64/4,false);
		draw_pr_rectangle(WIDTH_2+_r/2*0.975,HEIGHT_2-HEIGHT_64/4,WIDTH,HEIGHT_2+HEIGHT_64/4,false);
		draw_fan(WIDTH_2,HEIGHT_2,_r/2*0.975,_r/2,180,0,60,c_white,menu_alpha[0]*2,false);
		
		draw_fan(WIDTH_2,HEIGHT_2,_r/2,max(WIDTH,HEIGHT)*2,180,0,60,c_black,menu_alpha[0]*0.75,false);
		
		//draw_fan(WIDTH,HEIGHT_2,0,_r/2,180,0,60,c_black,menu_alpha[0]*0.5,false);
		
		draw_set_color(c_white);
		draw_set_font(GodoM_R32);
		draw_set_alpha((menu_alpha[0]-0.75)*3);
		_x = WIDTH_32*5; _y = HEIGHT_16*13;
		_w = WIDTH_32*3; _h = HEIGHT_16;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_alpha((menu_alpha[0]-0.75)*4);
		draw_text(_x,_y,"이전");
		
		draw_set_alpha((menu_alpha[0]-0.75)*3);
		_x = WIDTH_32*27; _y = HEIGHT_16*13;
		_w = WIDTH_32*3; _h = HEIGHT_16;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_alpha((menu_alpha[0]-0.75)*4);
		draw_text(_x,_y,"다음");
		
		draw_set_font(GodoM_R24);
		draw_set_alpha((menu_alpha[0]-0.75)*3);
		_x = WIDTH_32*5; _y = HEIGHT_16*15;
		_w = WIDTH_32*3; _h = HEIGHT_32;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_alpha((menu_alpha[0]-0.75)*4);
		draw_text(_x,_y,"뒤로");
		
		draw_set_alpha((menu_alpha[0]-0.75)*3);
		_x = WIDTH_32*27; _y = HEIGHT_16*15;
		_w = WIDTH_32*3; _h = HEIGHT_32;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_alpha((menu_alpha[0]-0.75)*4);
		draw_text(_x,_y,"타워 커스텀");
		
		draw_set_font(GodoM_R36);
		draw_set_alpha((menu_alpha[0]-0.75)*3);
		_x = WIDTH_2; _y = HEIGHT_32*29;
		_w = WIDTH_8; _h = HEIGHT_64*3;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_alpha((menu_alpha[0]-0.75)*4);
		draw_text(_x,_y,"캠페인 시작");
		#endregion
		break;
	case menu.play_tech:
		#region
		draw_set_alpha((menu_alpha[0]-0.5)*2); draw_set_color(c_white);
		draw_set_halign(fa_left); draw_set_valign(fa_middle);
		draw_set_font(GodoM_R48);
		draw_text(WIDTH_16,HEIGHT_8,"타워 테크 선택");
		
		draw_set_halign(fa_right);
		draw_set_font(GodoM_R24);
		
		for(var i = 0; i < array_length_1d(game_tech); i++)
		{
			var _tech_type = "";
			switch(i)
			{
				case 0:
					_tech_type = "적\n단일 피해";
					break;
				case 1:
					_tech_type = "적\n광역 피해";
					break;
				case 2:
					_tech_type = "적\n약화";
					break;
				case 3:
					_tech_type = "적\n이동 방해";
					break;
				case 4:
					_tech_type = "타워\강화";
					break;
			}
			
			draw_set_color(c_white);
			draw_set_alpha((menu_alpha[0]-0.5)*2);
			draw_text(WIDTH_4+WIDTH_32-WIDTH_32*3,HEIGHT_4+HEIGHT_8*0.75*i,_tech_type);
			
			for(var j = 0; j < game_tech[i]; j++)
			{
				var _str = string(i)+","+string(j)+".";
				
				draw_set_alpha((menu_alpha[0]-0.5));
				draw_set_color(c_white);
				if(game_tech_select[i] == j)
				{
					draw_set_color(global.tower_info[? _str+"color"]);
				}
				
				_x = WIDTH_4+WIDTH_32+WIDTH_8*j; _y = HEIGHT_4+HEIGHT_8*0.75*i;
				_w = WIDTH_16*0.875; _h = HEIGHT_16*0.75*0.875;
				draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h) || game_tech_select[i] == j));
				
				if(global.grid_cursor != noone)
				{
					if(global.grid_cursor[1] == i and global.grid_cursor[2] == j)
					{
						draw_set_color(c_white);
						draw_pr_rectangle(_x-_w*0.825,_y-_h*0.825,_x+_w*0.825,_y+_h*0.825,true);
						draw_pr_rectangle(_x-_w*1.125,_y-_h*1.125,_x+_w*1.125,_y+_h*1.125,true);
					}
				}
				
				draw_set_alpha((menu_alpha[0]-0.5)*2);
				if(game_tech_select[i] == j)
				{
					draw_fan(_x,_y,global.grid_length*0.25*0.75,global.grid_length*0.25,180,0,global.tower_info[? _str+"density"],c_white,draw_get_alpha(),false,global.tower_info[? _str+"rotate"]);
				}
				else
				{
					draw_fan(_x,_y,global.grid_length*0.25*0.75,global.grid_length*0.25,180,0,global.tower_info[? _str+"density"],global.tower_info[? _str+"color"],draw_get_alpha(),false,global.tower_info[? _str+"rotate"]);
				}
			}
		}
		
		if(global.grid_cursor != noone)
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
			
			var _cost_buy = global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"cost"];
			
			var _density = global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"density"];
			var _rotate = global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"rotate"];
			var _color = global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"color"];
						
			var _amount = global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"attack_amount"];
			var _speed = global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"attack_speed"];
			var _range = global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"attack_range"];
			var _length = global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"attack_length"];
			var _up_cost = 	global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"upgrade_cost"];
			var _up_amount = 	global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"upgrade_attack_amount"];
			var _up_speed = 	global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"upgrade_attack_speed"];
			var _up_range = 	global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"upgrade_attack_range"];
			var _up_length = 	global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"upgrade_attack_length"];
			var _description = global.tower_info[? string(global.grid_cursor[1])+","+string(global.grid_cursor[2])+"."+"description"];
			
			_amount = _amount+game_tech_upgrade*_up_amount;
			_speed = _speed+game_tech_upgrade*_up_speed;
			_range = _range+game_tech_upgrade*_up_range;
			_length = _length+game_tech_upgrade*_up_length;
			
			switch(global.grid_cursor[1])
			{
				default:
				case 0:
					switch(global.grid_cursor[2])
					{
						default:
							_text = ["공격 피해량","공격 주기","","","","사거리"];
							_value = [string(_amount),string(_speed),"","","",string(_length/global.grid_length)];
							_value_end = ["","초","","","",""];
							break;
					}
					break;
				case 1:
					switch(global.grid_cursor[2])
					{
						default:
							_text = ["공격 피해량","공격 주기","","","피해 범위","사거리"];
							_value = [string(_amount),string(_speed),"","",string(_range/global.grid_length),string(_length/global.grid_length)];
							_value_end = ["","초","","","",""];
							break;
					}
					break;
				case 2:
					switch(global.grid_cursor[2])
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
					switch(global.grid_cursor[2])
					{
						default:
						case 0:
							_text = ["공격 피해량","공격 주기","","둔화량","피해 범위","사거리"];
							_value = [string(_amount),string(_speed),"",string((0.25+0.1*game_tech_upgrade)*100),string(_range/global.grid_length),string(_length/global.grid_length)];
							_value_end = ["","초","","%","",""];
							break;
						case 1:
							_text = ["공격 피해량","공격 주기","","지속시간","피해 범위","사거리"];
							_value = [string(_amount),string(_speed),"",string_format(0.125+0.125*game_tech_upgrade,0,3),string(_range/global.grid_length),string(_length/global.grid_length)];
							_value_end = ["","초","","초","",""];
							break;
						case 2:
							_text = ["공격 피해량","공격 주기","","둔화량","","사거리"];
							_value = [string(_amount),string(_speed),"",string((0.2+0.05*game_tech_upgrade)*100),"",string(_length/global.grid_length)];
							_value_end = ["","초","","%","",""];
							break;
						case 3:
							_text = ["공격 피해량","공격 주기","","지속시간","","사거리"];
							_value = [string(_amount),string(_speed),"",string_format(1.75+0.25*game_tech_upgrade,0,2),"",string(_length/global.grid_length)];
							_value_end = ["","초","","초","",""];
							break;
					}
					break;
				case 4:
					switch(global.grid_cursor[2])
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
			
			draw_text(WIDTH_64*21-global.grid_length,HEIGHT_64*54-global.grid_length*2,string(game_tech_upgrade)+"LV");
			if(game_tech_upgrade = 0)
			{
				draw_text(WIDTH_64*23-global.grid_length,HEIGHT_64*54-global.grid_length*2,"설치 : "+string(_cost_buy));
				draw_text(WIDTH_64*27-global.grid_length,HEIGHT_64*54-global.grid_length*2,"강화 : "+string(_up_cost));
			}
			else
			{
				draw_text(WIDTH_64*23-global.grid_length,HEIGHT_64*54-global.grid_length*2,"최종 : "+string(_cost_buy+series(_up_cost,game_tech_upgrade+1)));
				
				if(game_tech_upgrade < 5)
				{
					draw_text(WIDTH_64*27-global.grid_length,HEIGHT_64*54-global.grid_length*2,"강화 : "+string(_up_cost*(game_tech_upgrade+1)));
				}
			}
							
			draw_set_halign(fa_right);
			draw_text(WIDTH_64*43+global.grid_length,HEIGHT_64*54-global.grid_length*2,_description);
		}
		
		draw_set_color(c_white);
		draw_set_alpha((menu_alpha[0]-0.5)*2);
		_x = WIDTH_4+WIDTH_32-WIDTH_64/2*9; _y = HEIGHT_2-HEIGHT_16;
		_w = WIDTH_64/16; _h = HEIGHT_4;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,false);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		if(global.grid_cursor != noone)
		{
			draw_set_font(GodoM_R32);
			
			draw_set_alpha((menu_alpha[0]-0.75)*2);
			if(game_tech_upgrade > 0)
			{
				_x = WIDTH_32*8; _y = HEIGHT_64*50;
				_w = WIDTH_64; _h = HEIGHT_16;
				draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
				draw_text(_x,_y,"-");
			}
			
			if(game_tech_upgrade < 5)
			{
				_x = WIDTH_32*24; _y = HEIGHT_64*50;
				_w = WIDTH_64; _h = HEIGHT_16;
				draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
				draw_text(_x,_y,"+");
			}
		}
		
		draw_set_font(GodoM_R24);
		draw_set_alpha((menu_alpha[0]-0.75)*3);
		_x = WIDTH_32*5; _y = HEIGHT_16*15;
		_w = WIDTH_32*3; _h = HEIGHT_32;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_alpha((menu_alpha[0]-0.75)*4);
		draw_text(_x,_y,"뒤로");
		
		draw_set_alpha((menu_alpha[0]-0.75)*3);
		_x = WIDTH_32*27; _y = HEIGHT_16*15;
		_w = WIDTH_32*3; _h = HEIGHT_32;
		draw_pr_rectangle(_x-_w,_y-_h,_x+_w,_y+_h,!(mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,_x-_w,_y-_h,_x+_w,_y+_h)));
		draw_set_alpha((menu_alpha[0]-0.75)*4);
		draw_text(_x,_y,"저장");
		#endregion
		break;
}