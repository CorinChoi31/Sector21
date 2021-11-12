///@function hex_pathfinding_by_pos(grid, grid_tile, radius, q1, r1, q2, r2)
function hex_pathfinding_by_pos(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	///@param grid
	///@param grid_tile
	///@param radius
	///@param q1
	///@param r1
	///@param q2
	///@param r2

	var _return_pos = undefined;
	var _return_index = 0;

	var _grid = argument0;
	var _grid_tile = argument1;
	var _grid_rad = argument2;

	var _q1 = argument3;
	var _r1 = argument4;
	var _q2 = argument5;
	var _r2 = argument6;

	var _sector = ds_grid_create(ds_grid_width(_grid),ds_grid_height(_grid));
	var _sector_cost = ds_grid_create(ds_grid_width(_grid),ds_grid_height(_grid));

	var _path = ds_list_create();
	var _path_cost = ds_list_create();

	var _visit_node = ds_list_create();
	var _open_node = ds_priority_create();

	var _node_current = undefined;
	var _node_neighbor = undefined;

	var _node_next = undefined;
	var _node_cost = 0;

	var _path_done = false;
	var _path_index = 0;

	_node_cost = _grid_tile[# _q1+_grid_rad,_r1+_grid_rad].cost+hex_distance_by_pos(_q1,_r1,_q2,_r2);
	ds_priority_add(_open_node,[_q1,_r1],0);

	_path_cost[|_path_index] = 0;

	for(var i = 0; i < ds_grid_width(_grid); i++)
	{
		for(var j = 0; j < ds_grid_width(_grid); j++)
		{
			if(_grid[# i,j] > 0)
			{
				_sector_cost[# i,j] = hex_distance_by_pos(i-_grid_rad,j-_grid_rad,_q2,_r2);
			}
		}
	}
	while(!ds_priority_empty(_open_node))
	{
		_node_current = ds_priority_delete_min(_open_node);
		show_debug_message("Node : "+string(_node_current)+" / "+string(_node_cost));
	
		if(string(_node_current) == string([_q2,_r2]))
		{
			_path_done = true;
			break;	
		}
	
		var _nncost = _path_cost[|_path_index];
		_node_neighbor = hex_neighbor(_grid,_grid_rad,_node_current[0],_node_current[1]);
		if(_node_neighbor != undefined)
		{
			var __nneighbor, __ncost, __tcost, __index;
		
			__tcost = noone; __index = undefined;
			for(var i = 0; i < array_length_1d(_node_neighbor); i++)
			{
				__nneighbor = _node_neighbor[i];
				if(ds_list_find_index(_visit_node,string(__nneighbor)) == -1)
				{
					__ncost = _grid_tile[# __nneighbor[0]+_grid_rad,__nneighbor[1]+_grid_rad].cost;
					__ncost += hex_distance_by_pos(__nneighbor[0],__nneighbor[1],_q2,_r2);
				
					show_debug_message("Neighbor : "+string(__nneighbor)+" / "+string(__ncost));
				}
				else
				{
					continue;	
				}
			
				if(__tcost = noone or __ncost <= __tcost)
				{
					__tcost = __ncost;
					__index = i;
				}
			
				if(__ncost <= _node_cost)
				{
					ds_list_add(_visit_node, string(_node_neighbor[__index]));
					ds_priority_add(_open_node, _node_neighbor[__index], __ncost);
				}
			}
		
			if(__index != undefined)
			{
				ds_list_add(_visit_node, string(_node_neighbor[__index]));
				ds_priority_add(_open_node, _node_neighbor[__index], __ncost);
			
				_path[|_path_index] = _node_current;
			}
		}
	
		if(_node_cost-_nncost < _path_cost[|_path_index])
		{
			_path_index += 1;
			_path_cost[|_path_index] = _node_cost-_nncost;
		}
	}

	if(_path_done)
	{
		for(var i = 0; i < ds_list_size(_path); i++)
		{
			_return_pos[i] = _path[|i];
		}
	}

	ds_list_destroy(_path);
	ds_list_destroy(_visit_node);
	ds_priority_destroy(_open_node);

	return _return_pos;


}
