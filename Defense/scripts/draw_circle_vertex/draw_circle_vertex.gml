/// @function draw_circle_vertex(x, y, angle, density, range, weight, color, alpha, rot, outline)
/// @param x
/// @param y
/// @param angle
/// @param density
/// @param range
/// @param weight
/// @param color
/// @param alpha
/// @param rotate
/// @param outline

function draw_circle_vertex(_x, _y, _angle, _density, _range, _weight, _color, _alpha, _rot, _outline)
{
	_angle = _angle <= 360 ? _angle : 360;
	_density = _density >= 2 ? _density : 2;
	
	var _i = 0;
	var _a = _angle/_density;
	
	var _out_range = _range;
	var _in_range = _range-_weight;
	
	if(_outline)
	{
		if(_in_range == 0)
		{
			draw_primitive_begin(pr_linestrip);
				for(_i = 0; _i <= _angle; _i += _a)
				{
					draw_vertex_color(_x+lengthdir_x(_out_range, _i+_rot), _y+lengthdir_y(_out_range, _i+_rot), _color, _alpha);
				}
			draw_primitive_end();
		}
		else
		{
			draw_primitive_begin(pr_linestrip);
				draw_vertex_color(_x+lengthdir_x(_in_range, _rot), _y+lengthdir_y(_in_range, _rot), _color, _alpha);
				for(_i = 0; _i <= _angle; _i += _a)
				{
					draw_vertex_color(_x+lengthdir_x(_out_range, _i+_rot), _y+lengthdir_y(_out_range, _i+_rot), _color, _alpha);
				}
			draw_primitive_end();
			draw_primitive_begin(pr_linestrip);
				draw_vertex_color(_x+lengthdir_x(_in_range, _angle+_rot), _y+lengthdir_y(_in_range, _angle+_rot), _color, _alpha);
				for(_i = _angle-_a; _i >= 0; _i -= _a)
				{
					draw_vertex_color(_x+lengthdir_x(_in_range, _i+_rot), _y+lengthdir_y(_in_range, _i+_rot), _color, _alpha);
				}
			draw_primitive_end();
		}
	}
	else
	{
		if(_in_range == 0)
		{
			draw_primitive_begin(pr_trianglelist);
				for(_i = 0; _i < _angle; _i += _a)
				{
					draw_vertex_color(_x+lengthdir_x(_out_range, _i+_rot), _y+lengthdir_y(_out_range, _i+_rot), _color, _alpha);
					draw_vertex_color(_x, _y, _color, _alpha);
					draw_vertex_color(_x+lengthdir_x(_out_range, _i+_a+_rot), _y+lengthdir_y(_out_range, _i+_a+_rot), _color, _alpha);
				}
				for(_i = 0; _i < _angle; _i += _a)
				{
					draw_vertex_color(_x, _y, _color, _alpha);
					draw_vertex_color(_x+lengthdir_x(_out_range, _i+_a+_rot), _y+lengthdir_y(_out_range, _i+_a+_rot), _color, _alpha);
					draw_vertex_color(_x, _y, _color, _alpha);
				}
			draw_primitive_end();
		}
		else
		{
			draw_primitive_begin(pr_trianglelist);
				for(_i = 0; _i < _angle; _i += _a)
				{
					draw_vertex_color(_x+lengthdir_x(_out_range, _i+_rot), _y+lengthdir_y(_out_range, _i+_rot), _color, _alpha);
					draw_vertex_color(_x+lengthdir_x(_in_range, _i+_rot), _y+lengthdir_y(_in_range, _i+_rot), _color, _alpha);
					draw_vertex_color(_x+lengthdir_x(_out_range, _i+_a+_rot), _y+lengthdir_y(_out_range, _i+_a+_rot), _color, _alpha);
				}
				for(_i = 0; _i < _angle; _i += _a)
				{
					draw_vertex_color(_x+lengthdir_x(_in_range, _i+_rot), _y+lengthdir_y(_in_range, _i+_rot), _color, _alpha);
					draw_vertex_color(_x+lengthdir_x(_out_range, _i+_a+_rot), _y+lengthdir_y(_out_range, _i+_a+_rot), _color, _alpha);
					draw_vertex_color(_x+lengthdir_x(_in_range, _i+_a+_rot), _y+lengthdir_y(_in_range, _i+_a+_rot), _color, _alpha);
				}
			draw_primitive_end();
		}
	}
}