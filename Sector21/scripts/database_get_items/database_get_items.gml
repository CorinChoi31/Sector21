///@description database_get_items(data)
///@funtion database_get_items(data)
function database_get_items(argument0) {

	///@param data

	var arg0_dgi = argument0;

	var _return_dgi = 0;

	if(is_array(arg0_dgi))
	{
		var _seperator_dgi = database_get_seperator(arg0_dgi);
		var _items_dgi = 0;
		var _num_dgi = -1;
		var _dgi1 = 0;
	
		for(var _dgi0 = 3; _dgi0 < array_length_1d(arg0_dgi); _dgi0++)
		{
			_num_dgi++;
			_dgi1 = 1;
		
			_items_dgi[_num_dgi] = "";

			while(string_char_at(arg0_dgi[_dgi0],_dgi1) != _seperator_dgi)
			{
				_items_dgi[_num_dgi] += string_char_at(arg0_dgi[_dgi0],_dgi1);
				_dgi1++;
			}
		}
	
		_return_dgi = _items_dgi;
	}
	else
	{
		/*
		if(!file_exists(arg0_dgi))
		{
			_return_dgi = -1;
		}
		else
		{
			var _read_dgi = database_read(arg0_dgi);
			var _seperator_dgi = database_get_seperator(_read_dgi);
			var _items_dgi = 0;
			var _num_dgi = -1;
			var _dgi1 = 0;
	
			for(var _dgi0 = 3; _dgi0 < array_length_1d(_read_dgi); _dgi0++)
			{
				_num_dgi++;
				_dgi1 = 1;
		
				_items_dgi[_num_dgi] = "";

				while(string_char_at(_read_dgi[_dgi0],_dgi1) != _seperator_dgi)
				{
					_items_dgi[_num_dgi] += string_char_at(_read_dgi[_dgi0],_dgi1);
					_dgi1++;
				}
			}
	
			_return_dgi = _items_dgi;
		}
		*/
	}

	return _return_dgi;


}
