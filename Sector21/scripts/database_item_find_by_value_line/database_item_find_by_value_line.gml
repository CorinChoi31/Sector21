///@description database_item_find_by_value_line(item,y,value)
///@function database_item_find_by_value_line(item,y,value)
function database_item_find_by_value_line() {

	///@param item
	///@param y
	///@param value

	var _return = undefined;
	var _r = 0;

	for(var _i = 0; _i < ds_grid_width(argument[0]); _i++)
	{
		if(ds_grid_get(argument[0],_i,argument[1]) = argument[2])
		{
			_return[_r] = _i;
			_r++;
		}
	}

	if(array_length_1d(_return) = 1)
	{
		_return = _return[0];	
	}

	return _return;


}
