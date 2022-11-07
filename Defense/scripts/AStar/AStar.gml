function ASGrid(_w, _h, _wd) constructor
{
	world_pos_x_max = _w;
	world_pos_y_max = _h;
	
	world_data = ds_grid_create(world_pos_x_max, world_pos_y_max);
	
	move_direction = [0, 90, 180, 270];
	
	static Initialize = function()
	{
		
	}
	
	static Run = function(_start_x, _start_y, _end_x, _end_y)
	{
		var _open = ds_grid_create(world_pos_x_max, world_pos_y_max);
		var _close = ds_grid_create(world_pos_x_max, world_pos_y_max);
		
		var _parent = ds_grid_create(world_pos_x_max, world_pos_y_max);
		var _queue = ds_priority_create();
		
		var _node = noone;
		var _size_move = array_length(move_direction);
		
		ds_grid_clear(_open, -1);
		ds_grid_clear(_close, false);
		ds_grid_clear(_parent, noone);
		
		var _x = _start_x;
		var _y = _start_y;
		
		var _distance = point_distance(_x, _y, _end_x, _end_y);
		var _distance_tile = abs(_end_x - _x) + abs(_end_y - _y);
		
		_open[# _x, _y] = _distance_tile;
		_parent[# _x, _y] = new ASPosition(_x, _y);
		
		ds_priority_add(_queue, new ASNode(_distance_tile, 0, _x, _y), _distance_tile);
		
		while(ds_priority_size(_queue) > 0)
		{
			_node = ds_priority_delete_min(_queue);
			
			_x = _node.x;
			_y = _node.y;
			
			if(_close[# _x, _y])
				continue;
			
			//show_debug_message("Check Node with: "+ string(_x) + ", " + string(_y));
			
			_close[# _x, _y] = true;
			if(_x == _end_x and _y == _end_y)
			{
				//show_debug_message("Successfully Found");
				break;	
			}
			
			for(var _i = 0; _i < _size_move; _i++)
			{
				var _lx = lengthdir_x(1, move_direction[_i]);
				_lx = round(abs(_lx)) * sign(_lx);
						
				var _ly = lengthdir_y(1, move_direction[_i]);
				_ly = round(abs(_ly)) * sign(_ly);
					
				var _next_x = _x + _lx;
				var _next_y = _y + _ly;
					
				if(_next_x < 0 || _next_x >= world_pos_x_max || _next_y < 0 || _next_y >= world_pos_y_max)
					continue;
						
				//if(world_data[# _next_x, _next_y].solid || world_data[# _next_x, _next_y].instance != noone and world_data[# _next_x, _next_y].instance.solid)
					//continue;
				
				if(_close[# _next_x, _next_y])
					continue;
						
				_distance = point_distance(_next_x, _next_y, _end_x, _end_y);
				_distance_tile = abs(_end_x - _next_x) + abs(_end_y - _next_y);
					
				var _c = 10 //world_data[# _next_x, _next_y].cost;
					
				var _g = _node.G + _c;
				var _h = _distance_tile;
					
				var _v = _g + _h;
					
				if(_open[# _next_x, _next_y] != -1 and _open[# _next_x, _next_y] < _v)
				{
					continue;
				}
					
				_open[# _next_x, _next_y] = _v;
				_parent[# _next_x, _next_y] = new ASPosition(_x, _y);
					
				ds_priority_add(_queue, new ASNode(_v, _g, _next_x, _next_y), _distance_tile);
			}
		}
		
		var _path = [];
		var _result = [];
		
		_x = _end_x;
		_y = _end_y;
		
		var _p = _parent[# _x, _y];
		while(_p != noone and !(_p.x == _x and _p.y == _y))
		{
			array_push(_path, new ASPosition(_x, _y));
			
			_x = _p.x;
			_y = _p.y;
			
			_p = _parent[# _x, _y];
		}
		array_push(_path, new ASPosition(_x, _y));
		array_push(_path, !(_p == noone));
		
		repeat(array_length(_path))
		{
			array_push(_result, array_pop(_path));
		}
		
		return _result;
	}
	
	static Clear = function()
	{
		ds_grid_destroy(world);	
	}
}

function ASPosition(_x, _y) constructor
{
	x = _x;
	y = _y;
	
	static toString = function()
	{
		return string(x) + ", " + string(y);
	}
}

function ASNode(_F, _G, _x, _y): ASPosition(_x, _y) constructor 
{
	F = _F;
	G = _G;
	H = _F - _G;
	
	static Compare = function(_asnode)
	{
		var _result = 0;
		if(F == _asnode.F)
		{
			_result = 0;
		}
		else
		{
			_result = F < _asnode.F ? 1 : -1;	
		}
		
		return _result;
	}
}
