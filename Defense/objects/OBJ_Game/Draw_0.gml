draw_set_color(c_white);
draw_set_alpha(1);


draw_set_alpha(0.25);

var _border = 8;
var _line = 2 * grid_size_magnify;

var _grid_w = grid_size_width * grid_size_magnify;
var _grid_h = grid_size_height * grid_size_magnify;

var _x = x - (_grid_w * grid_pos_x_max)/2;
var _y = y - (_grid_h * grid_pos_y_max)/2;

var _x1 = _x - _border;
var _y1 = _y - _border;
var _x2 = _x + _grid_w * grid_pos_x_max + _border;
var _y2 = _y + _grid_h * grid_pos_y_max + _border;

draw_rectangle_line_vertex(_x1, _y1, _x2, _y2, 4, c_white, c_white, c_white, c_white, 1, 1, 1, 1);

_x1 = _x - _line;
_y1 = _y + _line;
_x2 = _x + _line;
_y2 = _y + _grid_h * grid_pos_y_max - _line;
for(var _i = 1; _i < grid_pos_x_max; _i += 1) {
	_x1 += _grid_w;
	_x2 += _grid_w;
	
	draw_rectangle_vertex(_x1, _y1, _x2, _y2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1, 1, 1, 1, false);
}

_x1 = _x + _line;
_y1 = _y - _line;
_x2 = _x + _grid_w * grid_pos_x_max - _line;
_y2 = _y + _line;
for(var _i = 1; _i < grid_pos_y_max; _i += 1) {
	_y1 += _grid_h;
	_y2 += _grid_h;
	
	draw_rectangle_vertex(_x1, _y1, _x2, _y2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1, 1, 1, 1, false);
}

for(var _gi_x = 0; _gi_x < grid_pos_x_max; _gi_x++) {
	for(var _gi_y = 0; _gi_y < grid_pos_y_max; _gi_y++)
	{
		var _gi = grid_information[_gi_x][_gi_y];
		
		_x1 = _x + _grid_w * _gi_x;
		_y1 = _y + _grid_h * _gi_y;
		
		_x2 = _x1 + _grid_w;
		_y2 = _y1 + _grid_h;
		
		draw_rectangle_vertex(_x1 + _line, _y1 + _line, _x2 - _line, _y2 - _line, c_white, c_white, c_white, c_white, _gi.alpha, _gi.alpha, _gi.alpha, _gi.alpha, false);
	}
}

var _mouse_x = mouse_pos_x;
var _mouse_y = mouse_pos_y;
	
_mouse_x = floor((_mouse_x - x)/_grid_w);
_mouse_y = floor((_mouse_y - y)/_grid_h);

//draw_set_alpha(1);
//draw_text(mouse_x, mouse_y, string(_mouse_x) + " " + string(_mouse_y));
