///@description database_item_set_list(item,x,<name>,contents)
///@function database_item_set_list(item,x,<name>,contents)
function database_item_set_list() {

	///@param item
	///@param x
	///@param <name>
	///@param contents

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];

	if(argument_count = 3)
	{
		if(is_real(arg2) or is_string(arg2) or is_bool(arg2))
		{
			ds_grid_set(arg0,arg1,1,arg2);
		}
		else if(is_array(arg2))
		{
			for(var _i = 1; _i < min(ds_grid_height(arg0),array_length_1d(arg2)+1); _i++)
			{
				ds_grid_set(arg0,arg1,_i,arg2[_i-1]);
			}
		}
		else
		{
			for(var _i = 1; _i < min(ds_grid_height(arg0),ds_list_size(arg2)+1); _i++)
			{
				ds_grid_set(arg0,arg1,_i,arg2[|_i-1]);
			}
		}
	}
	if(argument_count = 4)
	{
		var arg3 = argument[3];
	
		ds_grid_set(arg0,arg1,0,arg2);
		if(is_real(arg3) or is_string(arg3) or is_bool(arg3))
		{
			ds_grid_set(arg0,arg1,1,arg3);
		}
		else if(is_array(arg3))
		{
			for(var _i = 1; _i < min(ds_grid_height(arg0),array_length_1d(arg3)+1); _i++)
			{
				ds_grid_set(arg0,arg1,_i,arg3[_i-1]);
			}
		}
		else
		{
			for(var _i = 1; _i < min(ds_grid_height(arg0),ds_list_size(arg3)+1); _i++)
			{
				ds_grid_set(arg0,arg1,_i,arg3[|_i-1]);
			}
		}
	}


}
