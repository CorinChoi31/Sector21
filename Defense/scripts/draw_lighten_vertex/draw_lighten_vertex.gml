/// @fuction draw_lighten_vertex(x, y, range, ltlength, ltangle, color, ltcolor, alpha, ltalpha, rotate)
/// @description
/// @param x
/// @param y
/// @param range
/// @param ltlength
/// @param ltangle
/// @param color
/// @param ltcolor
/// @param alpha
/// @param ltalpha
/// @param rotate

function draw_lighten_vertex(_x, _y, _range, _ltlength, _ltangle, _color, _ltcolor, _alpha, _ltalpha, _rotate)
{
	var _angle = 0;
	
	var _sx, _sy;
	var _ex, _ey;
	
	//var _lplength = _ltlength*_tlength;
	//var _lpalpha = lerp(_alpha, _ltalpha, _ltratio);
	
	for(_angle = _rotate; _angle < 360+_rotate; _angle += 90)
	{
		_sx = lengthdir_x(_range, _angle-45); _sy = lengthdir_y(_range, _angle-45);
		_ex = lengthdir_x(_range, _angle+45); _ey = lengthdir_y(_range, _angle+45);
		
		draw_primitive_begin(pr_trianglelist);
			draw_vertex_color(_x, _y, _color, _alpha);
			draw_vertex_color(_x + _sx, _y + _sy, _color, _alpha);
			draw_vertex_color(_x + _ex, _y + _ey, _color, _alpha);
		draw_primitive_end();
	}
	
	for(_angle = _rotate; _angle < 360+_rotate; _angle += 90)
	{
		_sx = lengthdir_x(_range, _angle-45); _sy = lengthdir_y(_range, _angle-45);
		_ex = lengthdir_x(_range, _angle+45); _ey = lengthdir_y(_range, _angle+45);
		
		draw_primitive_begin(pr_trianglelist);
			draw_vertex_color(_x + _sx, _y + _sy, _color, _alpha);
			draw_vertex_color(
				_x + _sx + lengthdir_x(_ltlength, _angle+_ltangle), 
				_y + _sy + lengthdir_y(_ltlength, _angle+_ltangle), 
				_ltcolor, _ltalpha
			);
			draw_vertex_color(_x + _ex, _y + _ey, _color, _alpha);
		draw_primitive_end();
		
		draw_primitive_begin(pr_trianglelist);
			draw_vertex_color(_x + _ex, _y + _ey, _color, _alpha);
			draw_vertex_color(
				_x + _ex + lengthdir_x(_ltlength, _angle-_ltangle), 
				_y + _ey + lengthdir_y(_ltlength, _angle-_ltangle), 
				_ltcolor, _ltalpha
			);
			draw_vertex_color(
				_x + _sx + lengthdir_x(_ltlength, _angle+_ltangle), 
				_y + _sy + lengthdir_y(_ltlength, _angle+_ltangle), 
				_ltcolor, _ltalpha
			);
		draw_primitive_end();
	}
}