///@function draw_effect_line(x,y,x,y,range,range,color,alpha,alpha,step,type)
function draw_effect_line() {

	///@param x,y,x,y,range,range,color,alpha,alpha,step,type

	var _ins = instance_create_layer(argument[0],argument[1],"Effect",Effect_Line);
	with(_ins)
	{
		startX = argument[0];
		startY = argument[1];
		endX = argument[2];
		endY = argument[3];
	
		range = argument[4];
		destRange = argument[5];
	
		color = argument[6];
	
		alpha = argument[7];
		destAlpha = argument[8];
	
		step = argument[9];
	
		drawType = argument[10];
	}

	return _ins;


}
