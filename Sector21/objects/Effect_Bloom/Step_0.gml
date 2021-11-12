x += (x_dest-x)/step;
y += (y_dest-y)/step;

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

if(abs(range_dest[0]-range[0]) <= 0.01 and abs(range_dest[1]-range[1]) <= 0.01)
{
	instance_destroy();	
}