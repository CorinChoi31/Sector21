///@description data_add_score(data,accuracy,combo,perfect,great,nice,score,max)
///@function data_add_score(data,accuracy,combo,perfect,great,nice,score,max)
function data_add_score(argument0, argument1, argument2, argument3) {

	///@param data
	///@param accuracy
	///@param combo
	///@param perfect
	///@param great
	///@param nice
	///@param score
	///@param max

	var _search = database_item_find_by_name(argument0,argument1,true);

	if(!is_undefined(_search))
	{
		var _list = data_to_list(argument0,_search);
		var _nlist = ds_list_create();
		for(var k = 0; k < ds_list_size(_list); k += 2)
		{
			ds_list_add(_nlist,_list[|k]);
		}
		ds_list_add(_nlist,real(argument2));
		ds_list_sort(_nlist,false);
	
		var _array = 0;
	
		for(var k = 0; k < ds_list_size(_nlist); k++)
		{
			_array[k*2] = string_format(_nlist[|k],0,4);
		}
	
		for(var k = 0; k < ds_list_size(_nlist); k++)
		{
			for(var l = 0; l < ds_list_size(_list); l += 2)
			{
				if(_array[k*2] = string_format(_list[|l],0,4))
				{
					_array[k*2+1] = _list[|l+1];
					break;
				}
				else
				{
					_array[k*2+1] = argument3;
				}
			}
		}
	
		ds_list_destroy(_list);
		ds_list_destroy(_nlist);
	
		database_item_set_list(argument0,_search,_array);
	}
	else
	{
		database_item_add(argument0,argument1,[argument2,argument3]);
	}


}
