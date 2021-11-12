for(var i = 0; i < 2; i++)
{
	range[i] += (range_dest[i]-range[i])/step;
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

if(unit_ready > 0)
{
	unit_description = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"description"];
	
	unit_cost = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"cost"];
	unit_cost_return = unit_cost;
	
	color_dest = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"color"];
	density = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"density"];
	rotate = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"rotate"];
	
	unit_attack_amount = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"attack_amount"];
	unit_attack_speed = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"attack_speed"];
	unit_attack_range = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"attack_range"];
	unit_attack_length = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"attack_length"];
	unit_attack_velocity = global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"attack_velocity"];
	
	
	unit_ready -= global.d_time;
	
	if(unit_ready <= 1)
	{
		unit_attack_enable = true;
	}
}
else
{
	if(global.game.game_start)
	{
		tick += global.d_time;
	
		if(round(tick)%(room_speed*2) < room_speed)
		{
			y_pos += (room_height/64-y_pos)/(room_speed/2);
		}
		else
		{
			y_pos += (-y_pos)/(room_speed/2);
		}
	}
	
	if(tick > room_speed*15)
	{
		if(unit_cost_reduce <= 0)
		{
			unit_cost_return = max(unit_cost_return-unit_cost*0.12,unit_cost*0.4);
			
			unit_cost_reduce += room_speed*10;
		}
		else
		{
			unit_cost_reduce -= global.d_time;
		}
	}
	
	if(unit_upgraded < unit_upgrade)
	{
		if(unit_upgrade_tick = 0)
		{
			unit_upgrade_tick = room_speed;
		}
		
		if(unit_upgrade_tick%(room_speed/4) == 0)
		{
			unit_upgraded += 0.25;
			
			unit_cost += global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"upgrade_cost"]*unit_upgrade*0.25;
			unit_cost_return += global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"upgrade_cost"]*unit_upgrade*0.25;
		
			unit_attack_amount += global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"upgrade_attack_amount"]*0.25;
			unit_attack_speed += global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"upgrade_attack_speed"]*0.25;
			unit_attack_range += global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"upgrade_attack_range"]*0.25;
			unit_attack_length += global.tower_info[? string(unit_id)+","+string(unit_type)+"."+"upgrade_attack_length"]*0.25;
		
			var _r1 = random_range(-global.grid_length*0.5,global.grid_length*0.5); var _r2 = random_range(-global.grid_length*0.5,global.grid_length*0.5);
		
			draw_effect_bloom(x,y,x,y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1,global.grid_length*1.25],c_blue,c_white,1,0,room_speed/4);
		}
		
		unit_upgrade_tick--;
	}
	else
	{
		unit_upgraded = unit_upgrade;
	}
	
	tower_effect();
}

if(unit_death)
{
	depth = 501;
	
	unit_attack_enable = false;
	
	color_dest = c_black;
	alpha_dest = 0;
	
	if(alpha <= 0.001)
	{
		instance_destroy();	
	}
}

if(unit_attack_enable)
{
	tower_attack();
}