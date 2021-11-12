//point = hex_pos2point(pos[0], pos[1]);
pos = hex_point2pos(point[0],point[1],point[2]);

x += (global.grid_center[0]+(global.grid_length*((global.grid_horizontal)*pos[0]))-x)/step;
y += (global.grid_center[1]+(global.grid_length*((global.grid_vectical/2)*pos[0]+(global.grid_vectical)*pos[1]))-y)/step;

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

var _r = sqrt(sqr(range[1])-sqr(range[1]/2));
if(point_in_circle(mouse_x,mouse_y,x,y,_r))
{
	range[1] = global.grid_length;
	
	if(mouse_check_button(mb_left))
	{
		color_array = [color_get_red(c_black),color_get_green(c_black),color_get_blue(c_black)];
		color = c_black;
	}
	
	if(mouse_check_button_pressed(mb_left))
	{
		if(global.grid_cursor = noone)
		{
			if(global.grid_hex_tower[# pos[0]+global.grid_radius,pos[1]+global.grid_radius] == noone)
			{
				global.grid_cursor = ["tile",pos[0],pos[1]];
			}
			else
			{
				global.grid_cursor = ["tower",pos[0],pos[1]];
			}
		}
		else
		{
			if(string(global.grid_cursor) = string(["tile",pos[0],pos[1]]) or string(global.grid_cursor) = string(["tower",pos[0],pos[1]]))
			{
				global.grid_cursor = noone;
			}
			else
			{
				if(global.grid_hex_tower[# pos[0]+global.grid_radius,pos[1]+global.grid_radius] == noone)
				{
					global.grid_cursor = ["tile",pos[0],pos[1]];
				}
				else
				{
					global.grid_cursor = ["tower",pos[0],pos[1]];
				}
			}
		}
	}
}
else
{
	
}

if(global.grid_cursor != noone)
{
	if(global.grid_cursor[1] = pos[0] and global.grid_cursor[2] = pos[1])
	{
		color = c_white;
	}
}

if(global.grid_hex_tower[# pos[0]+global.grid_radius,pos[1]+global.grid_radius] == noone)
{
	alpha_dest = 1;
}
else
{
	alpha_dest = 0;	
}