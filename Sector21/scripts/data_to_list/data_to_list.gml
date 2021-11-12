///@description data_to_list(item,index)
///@funtion data_to_list(item,index)
function data_to_list() {

	///@param item
	///@param index

	var _array = ds_list_create();
	var _value = "";

	var _err = false;

	for(var _i = 1; _i < ds_grid_height(argument[0]); _i++)
	{
		_value = ds_grid_get(argument[0],argument[1],_i);
		if(_value != "")
		{
			if(_value = "-nan(ind)" or _value = "nan(ind)")
			{
				ds_list_add(_array,0);
				_err = true;
			}
			else
			{
				if(_err)
				{
					_err = false;
					ds_list_add(_array,0);
				}
				else
				{
					ds_list_add(_array,real(_value));	
				}
			}
		}
	}

	return _array;


}
