///@description database_to_grid(data)
///@funtion database_to_grid(data)
function database_data_to_grid(argument0) {

	///@param data

	var arg0 = argument0;

	var _return = 0;

	if(is_array(arg0))
	{	
		var _contents = database_get_contents(arg0);
		var _seperator = database_get_seperator(arg0);
		var _items = database_get_items(arg0);
	
		var _grid = ds_grid_create(database_get_items_length(_items),database_get_content_length(_contents)+1);
		ds_grid_clear(_grid,"");
	
		var _h = 0;
		var _v = 0;
	
		var _order = 0;
		var _str = "";
	
		ds_grid_set(_grid,_h,_v,"");
		for(var _i = 3; _i < array_length_1d(arg0); _i++)
		{
			_order = 0;
			_str = "";
			while(_order <= string_length(arg0[_i]))
			{
				_order++;
				_str = string_char_at(arg0[_i],_order);
				if(_str = _seperator)
				{
					_v++;
					ds_grid_set(_grid,_h,_v,"");
				}
				else
				{
					var _gvalue = _grid[# _h,_v];
					ds_grid_set(_grid,_h,_v,string(_gvalue)+_str);
				}
			}
		
			if(_i < array_length_1d(arg0)-1)
			{
				_v = 0;
				_h++;
				ds_grid_set(_grid,_h,_v,"");
			}
		}
		_return = _grid;
	}
	else
	{
		/*
		if(!file_exists(arg0))
		{
			_return = -1;
		}
		else
		{
			var _read = database_read(arg0);
			var _contents = database_get_contents(_read);
			var _seperator = database_get_seperator(_read);
	
			var _grid = 0;
			var _h = 0;
			var _v = 0;
	
			var _order = 0;
			var _str = "";
	
			_grid[_h,_v] = "";
			for(var _i = 3; _i < array_length_1d(_read); _i++)
			{
				_order = 0;
				_str = "";
				while(_order <= string_length(_read[_i]))
				{
					_order++;
					_str = string_char_at(_read[_i],_order);
					if(_str = _seperator)
					{
						_v++;
						_grid[_h,_v] = "";
					}
					else
					{
						_grid[_h,_v] += _str;
					}
				}
		
				if(_i < array_length_1d(_read)-1)
				{
					_v = 0;
					_h++;
					_grid[_h,_v] = "";
				}
			}
			_return = _grid;
		}
		*/
	}

	return _return;


}
