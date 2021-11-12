///@description database_item_add(item,<name>,contents)
///@function database_item_add(item,<name>,contents)
function database_item_add() {

	///@param item
	///@param <name>
	///@param contents

	var arg0 = argument[0];
	var arg1 = argument[1];

	var _w = database_item_get_width(arg0);
	var _h = database_item_get_height(arg0)+1;

	var _grid = ds_grid_create(_w,_h);

	ds_grid_copy(_grid,arg0);
	
	ds_grid_resize(arg0,_w+1,_h);
	ds_grid_clear(arg0,"");

	for(var _i = 0; _i < _w; _i++)
	{
		for(var _j = 0; _j < _h; _j++)
		{
			ds_grid_set(arg0,_i+1,_j,_grid[# _i,_j]);
		}
	}

	if(argument_count = 2)
	{
		if(is_real(arg1) or is_string(arg1) or is_bool(arg1))
		{
			ds_grid_set(arg0,0,1,arg1);
		}
		else if(is_array(arg1))
		{
			for(var _i = 1; _i < min(_h,array_length_1d(arg1)+1); _i++)
			{
				ds_grid_set(arg0,0,_i,arg1[_i-1]);
			}
		}
		else
		{
			for(var _i = 1; _i < min(_h,ds_list_size(arg1)+1); _i++)
			{
				ds_grid_set(arg0,0,_i,arg1[|_i-1]);
			}
		}
	}

	ds_grid_destroy(_grid);

	if(argument_count = 3)
	{
		var arg2 = argument[2];
	
		ds_grid_set(arg0,0,0,arg1);
		if(is_real(arg2) or is_string(arg2) or is_bool(arg2))
		{
			ds_grid_set(arg0,0,1,arg2);
		}
		else if(is_array(arg2))
		{
			for(var _i = 1; _i < min(_h,array_length_1d(arg2)+1); _i++)
			{
				ds_grid_set(arg0,0,_i,arg2[_i-1]);
			}
		}
		else
		{
			for(var _i = 1; _i < min(_h,ds_list_size(arg1)+1); _i++)
			{
				ds_grid_set(arg0,0,_i,arg2[|_i-1]);
			}
		}
	}


}
