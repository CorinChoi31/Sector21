for(var i = 0; i < 2; i++)
{
	range[i] += (range_dest[i]-range[i])/step;
}

if(color != color_dest)
{
	color_array[0] += (color_get_red(color_dest)-color_array[0])/step;
	color_array[1] += (color_get_green(color_dest)-color_array[1])/step;
	color_array[2] += (color_get_blue(color_dest)-color_array[2])/step;

	color = make_color_rgb(color_array[0],color_array[1],color_array[2]);
}

alpha += (alpha_dest-alpha)/step;

if(unit_attack_target = noone)
{
	unit_death = true;
}

if(unit_ready > 0)
{
	unit_ready -= 1;	
}
else
{
	if(!unit_death)
	{
		unit_speed += min(abs(unit_speed_max-unit_speed),unit_speed_accel/room_speed*global.d_time)*sign(unit_speed_max-unit_speed);
		
		if(unit_attack_range = 0)
		{
			if(is_array(unit_attack_target))
			{
				unit_attack_target = noone; 
			}
			else
			{
				if(unit_attack_target != noone)
				{
					if(instance_exists(unit_attack_target))
					{
						if(unit_attack_target.unit_death)
						{
							unit_attack_target = [unit_attack_target.x,unit_attack_target.y];
						}
						else
						{
							direction = point_direction(x,y,unit_attack_target.x,unit_attack_target.y);
							var _pdir = degtorad(direction);
							x += min(abs(unit_attack_target.x-x),unit_speed*abs(cos(_pdir))*global.d_time)*sign(unit_attack_target.x-x);
							y += min(abs(unit_attack_target.y-y),unit_speed*abs(sin(_pdir))*global.d_time)*sign(unit_attack_target.y-y);
							
							if(point_distance(x,y,unit_attack_target.x,unit_attack_target.y) <= range_dest[0]+unit_attack_target.range_dest[1]/2)
							{
								projectTile_apply(unit_attack_target);
								
								unit_attack_target = noone;
							}
						}
					}
					else
					{
						unit_attack_target = noone;	
					}
				}
			}
		}
		else
		{
			if(is_array(unit_attack_target))
			{
				direction = point_direction(x,y,unit_attack_target[0],unit_attack_target[1]);
				var _pdir = degtorad(direction);
				x += min(abs(unit_attack_target[0]-x),unit_speed*abs(cos(_pdir))*global.d_time)*sign(unit_attack_target[0]-x);
				y += min(abs(unit_attack_target[1]-y),unit_speed*abs(sin(_pdir))*global.d_time)*sign(unit_attack_target[1]-y);
				
				if(point_distance(x,y,unit_attack_target[0],unit_attack_target[1]) <= range_dest[0])
				{
					collision_circle_list(x,y,unit_attack_range,Game_Mob,true,false,unit_collision,true)
				
					var _ins = noone;
					for(var i = 0; i < ds_list_size(unit_collision); i++)
					{
						_ins = unit_collision[|i];
						if(!_ins.unit_death)
						{
							projectTile_apply(_ins);
						}
					}
					
					unit_attack_target = noone;
				}
			}
			else
			{
				if(unit_attack_target != noone)
				{
					if(instance_exists(unit_attack_target))
					{
						if(unit_attack_target.unit_death)
						{
							unit_attack_target = [unit_attack_target.x,unit_attack_target.y];
						}
						else
						{
							direction = point_direction(x,y,unit_attack_target.x,unit_attack_target.y);
							var _pdir = degtorad(direction);
							x += min(abs(unit_attack_target.x-x),unit_speed*abs(cos(_pdir))*global.d_time)*sign(unit_attack_target.x-x);
							y += min(abs(unit_attack_target.y-y),unit_speed*abs(sin(_pdir))*global.d_time)*sign(unit_attack_target.y-y);
							
							if(point_distance(x,y,unit_attack_target.x,unit_attack_target.y) <= range_dest[0]+unit_attack_target.range_dest[1]/2)
							{
								collision_circle_list(x,y,unit_attack_range,Game_Mob,true,false,unit_collision,true)
				
								var _ins = noone;
								for(var i = 0; i < ds_list_size(unit_collision); i++)
								{
									_ins = unit_collision[|i];
									if(!_ins.unit_death)
									{
										projectTile_apply(_ins);
									}
								}
								
								unit_attack_target = noone;
							}
						}
					}
					else
					{
						unit_attack_target = noone;	
					}
				}
			}
		}
	}
	else
	{
		alpha_dest = 0;
		if(abs(alpha_dest-alpha) < 0.01)
		{
			instance_destroy();	
		}
	}
}