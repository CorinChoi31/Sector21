if(target_instance != noone)
{
	if(!instance_exists(target_instance))
	{
		target_x = x;
		target_y = y;
			
		target_instance = noone;
	}
	else
	{
		repeat(round(global.d_time))
		{
			x += (target_instance.x+target_x-x)/step;
			y += (target_instance.y+target_y-y)/step;
		}
	}
}
else
{
	repeat(round(global.d_time))
	{
		x += (target_x-x)/step;
		y += (target_y-y)/step;
	}
}

if(reaming > 0)
{
	reaming -= global.d_time;
}
else
{
	repeat(round(global.d_time))
	{
		text_alpha += (0-text_alpha)/step;
		back_alpha += (0-back_alpha)/step;
	}
	
	if(text_alpha <= 0.01)
	{
		instance_destroy();
	}
}