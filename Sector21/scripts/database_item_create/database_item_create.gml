///@description database_item_create(w,h)
///@function database_item_create(w,h)
function database_item_create(argument0, argument1) {

	///@param w
	///@param h

	var arg0 = argument0;
	var arg1 = argument1;

	var _array = 0;

	_array = ds_grid_create(arg0,arg1+1);
	ds_grid_clear(_array, "");

	return _array;


}
