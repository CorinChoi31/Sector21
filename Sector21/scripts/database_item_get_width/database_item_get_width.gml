///@description database_item_get_width(item)
///@function database_item_get_width(item)
function database_item_get_width() {

	///@param item

	var _width = ds_grid_width(argument[0]);
	var _return = 0;

	if(_width = 1)
	{
		for(var _i = 0; _i < ds_grid_height(argument[0]); _i++)
		{
			if(ds_grid_get(argument[0],0,_i) != "")
			{
				_return = _width;
				break;
			}
		}
	}
	else
	{
		_return = _width;	
	}

	return _return;


}
