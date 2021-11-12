///@description database_get_version(data)
///@funtion database_get_version(data)
function database_get_version(argument0) {

	///@param data

	var arg0_dgv = argument0;

	var _return_dgv = 0;

	if(is_array(arg0_dgv))
	{
		for(var _dgv0 = 0; _dgv0 < string_length("version : "); _dgv0++)
		{
			arg0_dgv[0] = string_delete(arg0_dgv[0],1,1);
		}
		_return_dgv = arg0_dgv[0];
	}
	else
	{
		/*
		if(!file_exists(arg0_dgv))
		{
			_return_dgv = -1;
		}
		else
		{
			var _read_dgv = database_read(arg0_dgv);
		
			for(var _dgv0 = 0; _dgv0 < string_length("version : "); _dgv0++)
			{
				_read_dgv[0] = string_delete(_read_dgv[0],1,1);
			}
			_return_dgv = _read_dgv[0];
		}
		*/
	}

	return _return_dgv;


}
