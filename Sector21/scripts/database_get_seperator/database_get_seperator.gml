///@description database_get_seperator(data)
///@funtion database_get_seperator(data)
function database_get_seperator(argument0) {

	///@param data

	var arg0_dgs = argument0;

	var _return_dgs = 0;

	if(is_array(arg0_dgs))
	{
		for(var _dgs0 = 0; _dgs0 < string_length("separator : "); _dgs0++)
		{
			arg0_dgs[1] = string_delete(arg0_dgs[1],1,1);
		}
		_return_dgs = arg0_dgs[1];
	}
	else
	{
		/*
		if(!file_exists(arg0_dgs))
		{
			_return_dgs = -1;
		}
		else
		{
			var _read_dgs = database_read(arg0_dgs);
		
			for(var _dgs0 = 0; _dgs0 < string_length("separator : "); _dgs0++)
			{
				_read_dgs[1] = string_delete(_read_dgs[1],1,1);
			}
			_return_dgs = _read_dgs[1];
		}
		*/
	}

	return _return_dgs;


}
