///@description data_set(item,name,y,value)
///@function data_set(item,name,y,value)
function data_set(argument0, argument1, argument2, argument3) {

	///@param item
	///@param name
	///@param y
	///@param value

	var _search = undefined;
	_search = database_item_find_by_name(argument0,argument1,true);

	database_item_set(argument0,_search,argument2,argument3);


}
