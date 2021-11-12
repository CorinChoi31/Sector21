///@description database_item_get_height(item)
///@function database_item_get_height(item)
function database_item_get_height() {

	///@param item

	var _height = ds_grid_height(argument[0]);
	var _return = 0;

	_return = _height-1;

	return _return;


}
