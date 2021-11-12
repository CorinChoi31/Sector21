///@description database_item_clear(item,x)
///@function database_item_clear(item,x)
function database_item_clear() {

	///@param item
	///@param x

	var arg0 = argument[0];
	var arg1 = argument[1];

	for(var _i = 0; _i < ds_grid_height(arg0); _i++)
	{
		ds_grid_set(arg0,arg1,_i,"");
	}


}
