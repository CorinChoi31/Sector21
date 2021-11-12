if(unit_health > 0)
{
	var _value = unit_health/unit_health_max;
	var _scolor = $BFFF00; var _dcolor = $0040FF;
	var _h = color_get_hue(_scolor)-color_get_hue(_dcolor);
	var _s = color_get_saturation(_scolor)-color_get_saturation(_dcolor);
	var _v = color_get_value(_scolor)-color_get_value(_dcolor);
	var _color = make_color_hsv(color_get_hue(_dcolor)+_h*_value,color_get_saturation(_dcolor)+_s*_value,color_get_value(_dcolor)+_v*_value);
	
	color_dest = _color;
}
else
{
	color_dest = $585858;
}

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

if(mouse_check_button_released(mb_left))
{
	var _r = sqrt(sqr(range[1])-sqr(range[1]/2));
	if(point_in_circle(mouse_x,mouse_y,x,y,_r))
	{
		if(global.grid_cursor = noone)
		{
			global.grid_cursor = ["center",0,0];
		}
		else
		{
			if(string(global.grid_cursor) == string(["center",0,0]))
			{
				global.grid_cursor = noone;
			}
			else
			{
				global.grid_cursor = ["center",0,0];
			}
		}
	}
}

if(string(global.grid_cursor) == string(["center",0,0]))
{
	alpha = 2;
}

var _ins = noone; var _hurt = false;
collision_circle_list(x,y,range[0]/2,Game_Mob,true,false,unit_collision,true)
for(var i = ds_list_size(unit_collision)-1; i >= 0; i--)
{
	_ins = unit_collision[|i];
	if(!_ins.unit_death)
	{
		_hurt = true;
		unit_health -= _ins.calc_attack_amount;
		
		_ins.unit_death = true;
	}
}

if(_hurt)
{
	global.glitch = 1;
	
	draw_effect_bloom(x,y,x,y,6,[range[0],range[0]],[global.grid_length*10*0.975,global.grid_length*10],c_white,$0040FF,1,0,room_speed/4);
	draw_effect_bloom(x,y,x,y,12,[range[0],range[0]],[global.grid_length*10*0.975,global.grid_length*10],c_white,c_white,1,0,room_speed/2);
	
	draw_effect_bloom(x,y,x,y,12,[range[0],range[0]*1.125],[range[1]*0.875,range[1]],c_white,$0040FF,1,0,room_speed/2);
	
	collision_circle_list(x,y,global.grid_length*10,Game_Mob,true,false,unit_collision,true)
	for(var i = ds_list_size(unit_collision)-1; i >= 0; i--)
	{
		_ins = unit_collision[|i];
		if(!_ins.unit_death)
		{
			//mob_damage_add(_ins,0,5);
			_ins.unit_speed = 0;
		}
	}
}

ds_list_clear(unit_collision);