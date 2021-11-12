///@description database_item_set_line(item,x,y,contents)
///@function database_item_set_list(item,x,y,contents)
function database_item_set_line() {

	///@param item
	///@param x
	///@param y
	///@param contents

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];
	var arg3 = argument[3];

	if(is_real(arg3) or is_string(arg3) or is_bool(arg3))
	{
		ds_grid_set(arg0,arg1,arg2,arg3);
	}
	else if(is_array(arg3))
	{
		for(var _i = arg1; _i < min(ds_grid_height(arg0),array_length_1d(arg3)); _i++)
		{
			ds_grid_set(arg0,_i,arg2,arg3[_i]);
		}
	}
	else
	{
		for(var _i = arg2; _i < min(ds_grid_height(arg0),array_length_1d(arg3)); _i++)
		{
			ds_grid_set(arg0,_i,arg2,arg3[|_i]);
		}
	}


}
