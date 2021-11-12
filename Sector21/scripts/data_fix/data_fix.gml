///@description data_fix(item,name,contents)
///@function data_fix(item,name,contents)
function data_fix(argument0, argument1, argument2) {

	///@param item
	///@param name
	///@param contents

	var _searched = undefined;

	if(is_undefined(database_item_find_by_name(argument0,argument1,true)))
	{
		_searched = database_item_find_by_name(argument0,"",true);
		if(is_undefined(_searched))
		{
			database_item_add(argument0,argument1,argument2);
		}
		else
		{
			database_item_set_list(argument0,_searched,argument1,argument2);
		}
	
		return true;
	}
	else
	{
		return false;	
	}


}
