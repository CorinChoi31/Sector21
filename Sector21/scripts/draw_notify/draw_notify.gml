///@function draw_notify(x,y,text,font,color,alpha,width,height,color,alpha,tick,step,<x>,<y>,<target>)
function draw_notify() {

	///@param x,y,text,font,color,alpha,width,height,color,alpha,tick,step,<x>,<y>,<target>)

	var _ins = instance_create_layer(argument[0],argument[1],"Effect",Effect_Notify);
	with(_ins)
	{
		text = argument[2];
		text_color = argument[4];
		text_font = argument[3];
		text_alpha = argument[5];

		back_width = argument[6];
		back_height = argument[7];
		back_color = argument[8];
		back_alpha = argument[9];
	
		reaming = argument[10];
		step = argument[11];
	
		if(argument_count > 12)
		{
			target_x = argument[12];
			target_y = argument[13];
		}
		if(argument_count > 14)
		{
			target_instance = argument[14];
		}
	}

	return _ins;


}
