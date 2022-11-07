mouse_pos_x = mouse_x;
mouse_pos_y = mouse_y;

if(mouse_pos_x_previous != mouse_pos_x or mouse_pos_y_previous != mouse_pos_y)
{
	mouse_is_moved = true;
}


var _line = 2 * grid_size_magnify;

var _grid_w = grid_size_width * grid_size_magnify;
var _grid_h = grid_size_height * grid_size_magnify;

var _mouse_x = mouse_pos_x + (_grid_w * grid_pos_x_max)/2;
var _mouse_y = mouse_pos_y + (_grid_h * grid_pos_y_max)/2;;

_mouse_x = floor((_mouse_x - x)/_grid_w);
_mouse_y = floor((_mouse_y - y)/_grid_h);


if(mouse_check_button(mb_middle))
{
	x += (mouse_x - mouse_pos_x_previous)/1;
	y += (mouse_y - mouse_pos_y_previous)/1;
}

if(mouse_wheel_up())
{
	grid_size_magnify_target = min(grid_size_magnify_target + 0.1, 4);
}
if(mouse_wheel_down())
{
	grid_size_magnify_target = max(0.5, grid_size_magnify_target - 0.1);	
}


grid_size_magnify += (grid_size_magnify_target-grid_size_magnify)/(room_speed/10);


if(_mouse_x >= 0 and _mouse_y >= 0 and _mouse_x < grid_pos_x_max and _mouse_y < grid_pos_y_max)
{
	var _gi = grid_information[_mouse_x][_mouse_y];
	
	_gi.alpha += (0.5 - _gi.alpha)/(room_speed/10);
}

if(mouse_check_button_released(mb_left))
{
	var _result = false;
	if(_mouse_x >= 0 and _mouse_y >= 0 and _mouse_x < grid_pos_x_max and _mouse_y < grid_pos_y_max)
	{
		_result = true;
		if(grid_information[_mouse_x][_mouse_y].select)
		{
			_result = false;
		}
	}
	
	if(_result)
	{
		if(grid_pos_select_x != -1 and grid_pos_select_y != -1)
		{
			grid_information[grid_pos_select_x][grid_pos_select_y].select = false;
		}
		
		grid_pos_select = true;
		grid_pos_select_x = _mouse_x;
		grid_pos_select_y = _mouse_y;
		
		grid_information[grid_pos_select_x][grid_pos_select_y].select = true;
	}
	else
	{
		if(grid_pos_select_x != -1 and grid_pos_select_y != -1)
		{
			grid_information[grid_pos_select_x][grid_pos_select_y].select = false;
		}
		
		grid_pos_select = false;
		grid_pos_select_x = -1;
		grid_pos_select_y = -1;
	}
}

if(grid_pos_select)
{
		
}
	
if(mouse_is_moved)
{
	mouse_is_moved = false;
}


for(var _gi_x = 0; _gi_x < grid_pos_x_max; _gi_x++)
{
	for(var _gi_y = 0; _gi_y < grid_pos_y_max; _gi_y++)
	{
		var _gi = grid_information[_gi_x][_gi_y];
		
		if(_gi.select)
		{
			_gi.alpha_target = 0.5;
		}
		else
		{
			_gi.alpha_target = 0;
		}
		
		_gi.alpha += (_gi.alpha_target-_gi.alpha)/(room_speed/4);
	}
}

mouse_pos_x_previous = mouse_pos_x;
mouse_pos_y_previous = mouse_pos_y;

mouse_is_moved = false;
