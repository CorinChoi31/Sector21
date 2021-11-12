///@description database_item_find_by_name(item,name,quick_search)
///@function database_item_find_by_name(item,name,quick_search)
function database_item_find_by_name() {

	///@param item
	///@param name
	///@param quick_search

	var _arr = database_item_get_line(argument[0],0);

	var _return = undefined;
	var _r = 0;

	if(is_array(_arr))
	{
		for(var _i = 0; _i < array_length_1d(_arr); _i++)
		{
			if(_arr[_i] = argument[1])
			{
				if(argument[2] = false)
				{
					_return[_r] = _i;
					_r++;
				}
				else
				{
					_return = _i;
					break;
				}
			}
		}
	}

	if(array_length_1d(_return) = 1)
	{
		_return = _return[0];	
	}

	return _return;


}
