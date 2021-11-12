///@description data_get(item,name,y,real)
///@function data_get(item,name,y,real)
function data_get() {

	///@param item
	///@param name
	///@param y
	///@param <real>

	var _search = undefined;
	_search = database_item_find_by_name(argument[0],argument[1],true);

	return database_item_get(argument[0],_search,argument[2],argument[3]);


}
