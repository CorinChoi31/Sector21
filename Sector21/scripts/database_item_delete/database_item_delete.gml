///@description database_item_delete(item,x)
///@function database_item_delete(item,x)
function database_item_delete() {

	///@param item
	///@param x

	var arg0 = argument[0];
	var arg1 = argument[1];

	var _w = ds_grid_width(arg0);
	var _h = ds_grid_height(arg0);

	var _grid = ds_grid_create(_w,_h);
	ds_grid_copy(_grid,arg0);

	if(_w-1 != 0)
	{
		ds_grid_resize(arg0,_w-1,_h);
		ds_grid_clear(arg0,"");
	
		for(var _i = 0; _i < _w-1; _i++)
		{
			for(var _j = 0; _j < _h; _j++)
			{
				if(_i < arg1)
				{
					ds_grid_set(arg0,_i,_j,_grid[# _i,_j]);
				}
				else if(_i >= arg1)
				{
					ds_grid_set(arg0,_i,_j,_grid[# _i+1,_j]);
				}
			}
		}
	}
	else
	{
		ds_grid_clear(arg0,"");
	}


	ds_grid_destroy(_grid);


}
