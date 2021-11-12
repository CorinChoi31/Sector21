///@description database_item_find_by_value(item,value)
///@function database_item_find_by_value(item,value)
function database_item_find_by_value() {

	///@param item
	///@param value

	var _return = undefined;
	var _r = 0;

	var _forgms1array = 0;

	var _arg0 = argument[0];

	for(var _i = 0; _i < ds_grid_width(argument[0]); _i++)
	{
		for(var _j = 0; _j < ds_grid_height(argument[0]); _j++)
		{
			if(ds_grid_get(argument[0],_i,_j) = argument[1])
			{
				_forgms1array[0] = _i;
				_forgms1array[1] = _j;
			
				_return[_r] = _forgms1array;
				_r++;
			}
		}
	}

	if(array_length_1d(_return) = 1)
	{
		_return = _return[0];	
	}

	return _return;


}
