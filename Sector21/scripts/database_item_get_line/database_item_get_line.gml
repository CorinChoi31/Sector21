///@description database_item_get_line(item,y)
///@funtion database_item_get_line(item,y)
function database_item_get_line() {

	///@param item
	///@param y

	var _array = 0;
	var _index = 0;

	for(var _i = 0; _i < ds_grid_width(argument[0]); _i++)
	{
		_array[_index] = ds_grid_get(argument[0],_i,argument[1]);
		_index++;
	}

	return _array;


}
