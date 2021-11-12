///@description database_item_get(item,x,y,<real>)
///@funtion database_item_get(item,x,y,<real>)
function database_item_get() {

	///@param item
	///@param x
	///@param y
	///@param real

	var _return = ds_grid_get(argument[0],argument[1],argument[2]+1);
	if(argument_count = 4)
	{
		if(argument[3])
		{
			_return = real(_return);
		}
		else
		{
			_return = string(_return);
		}
	}

	return _return;


}
