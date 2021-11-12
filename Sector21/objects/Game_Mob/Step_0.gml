if(x >= 0 and x <= room_width and y >= 0 and y <= room_height)
{
	visible = true;	
}
else
{
	
}

if(visible)
{
	repeat(round(global.d_time))
	{
		for(var i = 0; i < 2; i++)
		{
			range[i] += (range_dest[i]-range[i])/step;
		}
	}

	if(color != color_dest)
	{
		repeat(round(global.d_time))
		{
			color_array[0] += (color_get_red(color_dest)-color_array[0])/step;
			color_array[1] += (color_get_green(color_dest)-color_array[1])/step;
			color_array[2] += (color_get_blue(color_dest)-color_array[2])/step;
		}

		color = make_color_rgb(color_array[0],color_array[1],color_array[2]);
	}
	
	repeat(round(global.d_time))
	{
		alpha += (alpha_dest-alpha)/step;
	}

	if(unit_inAttack > 0)
	{
		unit_inAttack -= 1;
	}
	unit_health_soft += (unit_health-unit_health_soft)/(room_speed/8);
}

if(!unit_ready)
{
	var _plus = (global.game.game_enemy_wave/10);
	
	unit_ready = true;
	
	density = global.mob_info[? string(unit_id)+"."+"density"];
	rotate = global.mob_info[? string(unit_id)+"."+"rotate"];
	
	range_dest = global.mob_info[? string(unit_id)+"."+"range"];
	color_dest = global.mob_info[? string(unit_id)+"."+"color"];
	
	unit_health_max = global.mob_info[? string(unit_id)+"."+"health"];
	unit_health_max += (unit_health_max*_plus);
	unit_health = unit_health_max;
	
	unit_attack_amount = global.mob_info[? string(unit_id)+"."+"damage"];
	unit_attack_amount += (unit_attack_amount*(_plus*0.25));
	
	unit_speed_max = global.mob_info[? string(unit_id)+"."+"speed"];
	unit_speed_accel = global.mob_info[? string(unit_id)+"."+"accel"];
	
	unit_score = global.mob_info[? string(unit_id)+"."+"score"];
	unit_score += floor(unit_score*_plus);
	
	if(global.mob_info[? string(unit_id)+"."+"skill_id"] != undefined)
	{
		unit_skill_id = global.mob_info[? string(unit_id)+"."+"skill_id"];
		unit_attack_speed = global.mob_info[? string(unit_id)+"."+"skill_speed"];
		unit_attack_length = global.mob_info[? string(unit_id)+"."+"skill_range"]*global.grid_length;
		unit_skill_amount = global.mob_info[? string(unit_id)+"."+"skill_amount"];
		unit_skill_amount += (unit_skill_amount*(_plus*0.75));
		unit_skill_length = global.mob_info[? string(unit_id)+"."+"skill_length"];
	}
	
	unit_attack_delay = room_speed*2;
}
else
{
	if(!unit_death)
	{
		mob_damage();
		mob_effect();
		
		if(unit_skill_id != noone)
		{
			mob_attack();
		}
		
		if(unit_speed < calc_speed_max)
		{
			unit_speed += min(abs(calc_speed_max-unit_speed),calc_speed_accel/room_speed*global.d_time)*sign(calc_speed_max-unit_speed);
		}
		else
		{
			unit_speed = calc_speed_max;
		}
		
		if(unit_moveable)
		{
			speed = unit_speed*global.d_time;
		}
		else
		{
			speed = 0;
		}
		
		direction = point_direction(x,y,room_width/2,room_height/2);
		
		if(unit_health = 0)
		{
			unit_death = true;
		}
	}
	else
	{
		if(unit_health <= 0)
		{
			draw_set_font(Monopoly_R24)
			draw_notify(x,y,unit_score,Monopoly_R24,c_white,1,16+string_width(unit_score),string_height(unit_score)/4,c_black,0.25,room_speed/2,room_speed,WIDTH_64,HEIGHT_64*63,noone);
			
			global.game.game_score += unit_score;
		}
		
		draw_effect_bloom(x,y,x,y,density,range,[range[0]*2,range[1]*4],color,c_white,1,0,step,direction);
		instance_destroy();
	}
}