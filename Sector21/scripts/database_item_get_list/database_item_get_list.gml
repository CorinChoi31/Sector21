///@description database_item_get_list(item,x)
///@funtion database_item_get_list(item,x)
function database_item_get_list() {

	///@param item
	///@param x

	var _array = 0;
	var _index = 0;

	for(var _i = 0; _i < ds_grid_height(argument[0]); _i++)
	{
		_array[_index] = ds_grid_get(argument[0],argument[1],_i);
		_index++;
	}

	return _array;


}
