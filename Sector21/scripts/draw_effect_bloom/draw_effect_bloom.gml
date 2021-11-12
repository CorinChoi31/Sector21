///@function draw_effect_bloom(x,y,x,y,density,range,range,color,color,alpha,alpha,step,<rotation>)
function draw_effect_bloom() {

	///@param x,y,x,y,density,range,range,color,color,alpha,alpha,step,<rotation>

	var _ins = instance_create_layer(argument[0],argument[1],"Effect",Effect_Bloom);
	with(_ins)
	{
		x_dest = argument[2];
		y_dest = argument[3];
	
		density = argument[4];
	
		range = argument[5];
		color = argument[7];
		alpha = argument[9];

		range_dest = argument[6];
		color_dest = argument[8];
		alpha_dest = argument[10];

		color_array = [color_get_red(argument[7]),color_get_green(argument[7]),color_get_blue(argument[7])];

		step = argument[11];
	
		if(argument_count > 12)
		{
			rotation = argument[12];
		}
	}

	return _ins;


}
