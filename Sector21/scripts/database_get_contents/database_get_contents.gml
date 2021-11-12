///@description database_get_contents(data)
///@funtion database_get_contents(data)
function database_get_contents(argument0) {

	///@param data

	var arg0_dgc = argument0;

	var _return_dgc = 0;

	if(is_array(arg0_dgc))
	{
		var _sperator_dgc = database_get_seperator(arg0_dgc);
		var _contents_dgc = 0;
		var _num_dgc = -1;
		var _char = "";
	
		for(var _dgc0 = 0; _dgc0 < string_length("contents : "); _dgc0++)
		{
			arg0_dgc[2] = string_delete(arg0_dgc[2],1,1);
		}
		for(var _dgc0 = 1; _dgc0 <= string_length(arg0_dgc[2]); _dgc0++)
		{
			_char = string_char_at(arg0_dgc[2],_dgc0);
			if(_char != _sperator_dgc)
			{
				_contents_dgc[_num_dgc] += _char;
			}
			if(_char = _sperator_dgc)
			{
				_num_dgc++;
				_contents_dgc[_num_dgc] = "";
			}
		}
	
		_return_dgc = _contents_dgc;
	}
	else
	{
		/*
		if(!file_exists(arg0_dgc))
		{
			_return_dgc = -1;
		}
		else
		{
			var _read_dgc = database_read(arg0_dgc);
			var _sperator_dgc = database_get_seperator(_read_dgc);
			var _contents_dgc = 0;
			var _num_dgc = -1;
			var _char = "";
	
			for(var _dgc0 = 0; _dgc0 < string_length("contents : "); _dgc0++)
			{
				_read_dgc[2] = string_delete(_read_dgc[2],1,1);
			}
			for(var _dgc0 = 1; _dgc0 <= string_length(_read_dgc[2]); _dgc0++)
			{
				_char = string_char_at(_read_dgc[2],_dgc0);
				if(_char != _sperator_dgc)
				{
					_contents_dgc[_num_dgc] += _char;
				}
				if(_char = _sperator_dgc)
				{
					_num_dgc++;
					_contents_dgc[_num_dgc] = "";
				}
			}
	
			_return_dgc = _contents_dgc;
		}
		*/
	}

	return _return_dgc;


}
