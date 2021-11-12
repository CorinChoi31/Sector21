///@description database_item_set_content(item,x,y,<name>,contents)
///@function database_item_set_contents(item,x,y,<name>,contents)
function database_item_set_content() {

	///@param item
	///@param x
	///@param y
	///@param <name>
	///@param contents

	var arg0 = argument0;
	var arg1 = argument1;
	var arg2 = argument2;
	var arg3 = argument3;

	if(argument_count = 4)
	{
		if(is_real(arg3) or is_string(arg3) or is_bool(arg3))
		{
			ds_grid_set(arg0,arg1,arg2,arg3);
		}
		else if(is_array(arg3))
		{
			for(var _i = 0; _i < min(ds_grid_height(arg0),array_length_1d(arg3)); _i++)
			{
				ds_grid_set(arg0,arg1,_i+arg2,arg3[_i]);
			}
		}
		else
		{
			for(var _i = 0; _i < min(ds_grid_height(arg0),ds_list_size(arg3)); _i++)
			{
				ds_grid_set(arg0,arg1,_i+arg2,arg3[|_i]);
			}
		}
	}
	if(argument_count = 5)
	{
		var arg4 = argument[4];
	
		ds_grid_set(arg0,arg1,0,arg3);
		if(is_real(arg4) or is_string(arg4) or is_bool(arg4))
		{
			ds_grid_set(arg0,arg1,arg2,arg4);
		}
		else if(is_array(arg4))
		{
			for(var _i = 0; _i < min(ds_grid_height(arg0),array_length_1d(arg4)); _i++)
			{
				ds_grid_set(arg0,arg1,_i+arg2,arg4[_i]);
			}
		}
		else
		{
			for(var _i = 0; _i < min(ds_grid_height(arg0),ds_list_size(arg4)); _i++)
			{
				ds_grid_set(arg0,arg1,_i+arg2,arg4[|_i]);
			}
		}
	}


}
