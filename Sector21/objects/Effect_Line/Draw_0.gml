gpu_set_blendmode(bm_add);
draw_set_color(color);
draw_set_alpha(alpha);
if(drawType = 0)
{
	var _shotAngle = point_direction(startX,startY,endX,endY);
	
	var _drawX1 = startX+lengthdir_x(range,_shotAngle+90);
	var _drawY1 = startY+lengthdir_y(range,_shotAngle+90);
	
	var _drawX2 = startX-lengthdir_x(range,_shotAngle+90);
	var _drawY2 = startY-lengthdir_y(range,_shotAngle+90);
	
	var _drawX3 = endX+lengthdir_x(range,_shotAngle+90);
	var _drawY3 = endY+lengthdir_y(range,_shotAngle+90);
	
	var _drawX4 = endX-lengthdir_x(range,_shotAngle+90);
	var _drawY4 = endY-lengthdir_y(range,_shotAngle+90);
	
	draw_primitive_begin(pr_trianglestrip);
		draw_vertex(_drawX1,_drawY1);
		draw_vertex(_drawX2,_drawY2);
		draw_vertex(_drawX3,_drawY3);
		draw_vertex(_drawX4,_drawY4);
	draw_primitive_end();
}
else if(drawType = 1)
{
	var _shotAngle = point_direction(startX,startY,endX,endY);
	
	var _drawX1 = drawSX+lengthdir_x(range,_shotAngle+90);
	var _drawY1 = drawSY+lengthdir_y(range,_shotAngle+90);
	
	var _drawX2 = drawSX-lengthdir_x(range,_shotAngle+90);
	var _drawY2 = drawSY-lengthdir_y(range,_shotAngle+90);
	
	var _drawX3 = drawEX+lengthdir_x(range,_shotAngle+90);
	var _drawY3 = drawEY+lengthdir_y(range,_shotAngle+90);
	
	var _drawX4 = drawEX-lengthdir_x(range,_shotAngle+90);
	var _drawY4 = drawEY-lengthdir_y(range,_shotAngle+90);
	
	draw_primitive_begin(pr_trianglestrip);
		draw_vertex(_drawX1,_drawY1);
		draw_vertex(_drawX2,_drawY2);
		draw_vertex(_drawX3,_drawY3);
		draw_vertex(_drawX4,_drawY4);
	draw_primitive_end();	
}
else
{

}
gpu_set_blendmode(bm_normal);