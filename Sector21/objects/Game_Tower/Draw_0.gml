if(unit_ready)
{
	draw_fan(x,y,0,range[1],180,0,60,color,alpha*0.125,false);
	draw_fan(x,y,range[1]*0.875,range[1],180,0,60,color,alpha,false);
	//draw_fan(x,y,range[1]*0.5,range[1]*0.625,180,0,18,c_white,alpha*0.5,false);
	
	draw_fan(x,y,range[0]*0.75,range[0],180,0,density,color,alpha,false,rotate);
}
else
{
	draw_fan(x,y,0,range[1],180,0,60,color,alpha*0.125,false);
	draw_fan(x,y,range[1]*0.875,range[1],180,0,60,color,alpha,false);
	//draw_fan(x,y,range[1]*0.5,range[1]*0.625,180,0,18,c_white,alpha*0.5,false);
	
	if(unit_upgrade)
	{
		draw_set_alpha(0.75*alpha);
		draw_set_color(c_white);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(Monopoly_R24);
		
		if(unit_upgrade < 5)
		{
			draw_text(x,y+room_height/64,unit_upgrade);
		}
		else
		{
			draw_text(x,y+room_height/64,"MAX");
		}
	}
	
	draw_fan(x,y-y_pos,range[0]*0.75,range[0],180,0,density,color,alpha,false,rotate);
	
	if(!unit_death)
	{
		if(global.grid_cursor != noone and global.grid_cursor[0] = "tower" and global.grid_cursor[1] = pos[0] and global.grid_cursor[2] = pos[1])
		{
			depth = 499;
		
			draw_fan(x,y,calc_attack_length*0.975,calc_attack_length*1,180,0,12,color,0.25,false);
		
			draw_set_alpha(0.5); draw_set_color(c_black);
			draw_pr_rectangle(WIDTH_16*5-global.grid_length,HEIGHT_16*13-global.grid_length*2,WIDTH_16*11+global.grid_length,HEIGHT-global.grid_length*2,false);
			draw_set_alpha(0.75); draw_set_color(c_white);
			draw_pr_rectangle(WIDTH_16*5-global.grid_length,HEIGHT_16*13-global.grid_length*2,WIDTH_16*11+global.grid_length,HEIGHT-global.grid_length*2,true);
		
			draw_set_valign(fa_middle);
			draw_set_font(GodoM_R24);
		
			var _text = 0; _text = ["","","","","",""];
			var _value = 0; _value = ["","","","","",""];
			var _value_end = 0; _value_end = ["","","","","",""];
		
			switch(unit_id)
			{
				default:
				case 0:
					switch(unit_type)
					{
						default:
							_text = ["공격 피해량","공격 주기","방어 관통","","","사거리"];
							_value = [string(calc_attack_amount),string(calc_attack_speed),string(calc_attack_ignore*100),"","",string(calc_attack_length/global.grid_length)];
							_value_end = ["","초","%","","",""];
							break;
					}
					break;
				case 1:
					switch(unit_type)
					{
						default:
							_text = ["공격 피해량","공격 주기","방어 관통","","피해 범위","사거리"];
							_value = [string(calc_attack_amount),string(calc_attack_speed),string(calc_attack_ignore*100),"",string(calc_attack_range/global.grid_length),string(calc_attack_length/global.grid_length)];
							_value_end = ["","초","%","","",""];
							break;
					}
					break;
				case 2:
					switch(unit_type)
					{
						default:
						case 0:
						case 4:
							_text = ["방어력 감소","적용 주기","","","","사거리"];
							_value = [string(calc_attack_amount*100),string(calc_attack_speed),"","","",string(calc_attack_length/global.grid_length)];
							_value_end = ["%","초","","","",""];
							break;
						case 1:
							_text = ["공격 피해량","공격 주기","","","","사거리"];
							_value = [string(calc_attack_amount),string(calc_attack_speed),"","","",string(calc_attack_length/global.grid_length)];
							_value_end = ["","초","","","",""];
							break;
						case 2:
						case 3:
							_text = ["","적용 주기","","","","사거리"];
							_value = ["",string(calc_attack_speed),"","","",string(calc_attack_length/global.grid_length)];
							_value_end = ["","초","","","",""];
							break;
					}
					break;
				case 3:
					switch(unit_type)
					{
						default:
						case 0:
							_text = ["공격 피해량","공격 주기","방어 관통","둔화량","피해 범위","사거리"];
							_value = [string(calc_attack_amount),string(calc_attack_speed),string(calc_attack_ignore*100),string((0.25+0.1*unit_upgraded)*100),string(calc_attack_range/global.grid_length),string(calc_attack_length/global.grid_length)];
							_value_end = ["","초","%","%","",""];
							break;
						case 1:
							_text = ["공격 피해량","공격 주기","방어 관통","지속시간","피해 범위","사거리"];
							_value = [string(calc_attack_amount),string(calc_attack_speed),string(calc_attack_ignore*100),string_format(0.125+0.125*unit_upgraded,0,3),string(calc_attack_range/global.grid_length),string(calc_attack_length/global.grid_length)];
							_value_end = ["","초","%","초","",""];
							break;
						case 2:
							_text = ["공격 피해량","공격 주기","방어 관통","둔화량","","사거리"];
							_value = [string(calc_attack_amount),string(calc_attack_speed),string(calc_attack_ignore*100),string((0.2+0.05*unit_upgraded)*100),"",string(calc_attack_length/global.grid_length)];
							_value_end = ["","초","%","%","",""];
							break;
						case 3:
							_text = ["공격 피해량","공격 주기","방어 관통","지속시간","","사거리"];
							_value = [string(calc_attack_amount),string(calc_attack_speed),string(calc_attack_ignore*100),string_format(1.75+0.25*unit_upgraded,0,2),"",string(calc_attack_length/global.grid_length)];
							_value_end = ["","초","%","초","",""];
							break;
					}
					break;
				case 4:
					switch(unit_type)
					{
						default:
						case 0:
							_text = ["효과 증가량","적용 주기","","","","사거리"];
							_value = [string(calc_attack_amount*100),string(calc_attack_speed),"","","",string(calc_attack_length/global.grid_length)];
							_value_end = ["%","초","","","",""];
							break;
						case 1:
							_text = ["효과 증가량","적용 주기","","","","사거리"];
							_value = [string(calc_attack_amount*100),string(calc_attack_speed),"","","",string(calc_attack_length/global.grid_length)];
							_value_end = ["%","초","","","",""];
							break;
						case 2:
							_text = ["효과 증가량","적용 주기","","","","사거리"];
							_value = [string(calc_attack_amount*100),string(calc_attack_speed),"","","",string(calc_attack_length/global.grid_length)];
							_value_end = ["%","초","","","",""];
							break;
						case 3:
							_text = ["효과 증가량","적용 주기","","","","사거리"];
							_value = [string(calc_attack_amount*100),string(calc_attack_speed),"","","",string(calc_attack_length/global.grid_length)];
							_value_end = ["%","초","","","",""];
							break;
						case 4:
							_text = ["효과 전환량","적용 주기","","","","사거리"];
							_value = [string(calc_attack_amount*100),string(calc_attack_speed),"","","",string(calc_attack_length/global.grid_length)];
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
			draw_text(WIDTH_64*43+global.grid_length,HEIGHT_64*54-global.grid_length*2,unit_description);
		}
		else
		{
			depth = 500;
		}
	}
}