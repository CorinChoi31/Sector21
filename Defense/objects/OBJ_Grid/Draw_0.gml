draw_set_color(c_white);
draw_set_alpha(0.25);

var _l = 2 * grid_size_magnifying;

var _w = grid_size_width * grid_size_magnifying;
var _h = grid_size_height * grid_size_magnifying;

var _x1 = x;
var _y1 = y;
var _x2 = _x1 + _w * grid_pos_x_max;
var _y2 = _y1 + _h * grid_pos_y_max;

draw_rectangle_line_vertex(_x1 - 8, _y1 - 8, _x2 + 8, _y2 + 8, 4, c_white, c_white, c_white, c_white, 1, 1, 1, 1);

_x1 = x - _l;
_y1 = y;
_x2 = x + _l;
_y2 = _y1 + _h * grid_pos_y_max;
for(var _x = 1; _x < grid_pos_x_max; _x += 1)
{
	_x1 += _w;
	_x2 += _w;
	
	draw_rectangle_vertex(_x1, _y1, _x2, _y2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1, 1, 1, 1, false);
}

_x1 = x;
_y1 = y - _l;
_x2 = _x1 + _w * grid_pos_x_max;
_y2 = y + _l;
for(var _y = 1; _y < grid_pos_y_max; _y += 1)
{
	_y1 += _h;
	_y2 += _h;
	
	draw_rectangle_vertex(_x1, _y1, _x2, _y2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1, 1, 1, 1, false);
}

if(mouse_check_button(mb_left))
{
	var _mouse_x = mouse_x;
	var _mouse_y = mouse_y;
	
	_mouse_x = floor((_mouse_x - x)/_w)*_w;
	_mouse_y = floor((_mouse_y - y)/_h)*_h;
	
	var _x1 = x + _mouse_x;
	var _y1 = y + _mouse_y;
	var _x2 = _x1 + _w;
	var _y2 = _y1 + _h;
	
	draw_rectangle_vertex(_x1, _y1, _x2, _y2, c_white, c_white, c_white, c_white, 0.25, 0.25, 0.25, 0.25, false);
	draw_rectangle_line_vertex(_x1, _y1, _x2, _y2, _l * 1.5, c_white, c_white, c_white, c_white, 1, 1, 1, 1);
}
