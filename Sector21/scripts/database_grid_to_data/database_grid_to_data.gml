///@description database_to_data(version,seperator,content,grid,file_name)
///@funtion database_to_data(version,seperator,content,grid,file_name)
function database_grid_to_data() {

	///@param version
	///@param seperator
	///@param content
	///@param grid
	///@param file_name

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];
	if(argument_count > 3)
	{
		var arg3 = argument[3];
	}
	if(argument_count > 4)
	{
		var arg4 = argument[4];
	}

	var _n = 0;
	var _array = 0;
	var _return = 0;

	if(ds_exists(arg3,ds_type_grid))
	{
		_array[_n] = "version : "+arg0; _n += 1;
		_array[_n] = "separator : "+arg1; _n += 1;
		_array[_n] = "contents : ";
		for(var _a = 0; _a < array_length_1d(arg2); _a++)
		{
			_array[_n] += arg1;
			_array[_n] += string(arg2[_a]);
		}
		_return = _array;
	
		if(argument_count > 3)
		{
			_n += 1;
			for(var _w = 0; _w < ds_grid_width(arg3); _w++)
			{
				_array[_n] = "";
				for(var _h = 0; _h < ds_grid_height(arg3); _h++)
				{
					if(_h != 0)
					{
						_array[_n] += arg1;
					}
					_array[_n] += string(arg3[# _w,_h]);
				}
				_n += 1;
			}
			_return = _array;
		}
	
		if(argument_count > 4)
		{
			var _file = file_text_open_write(arg4);
			for(var _i = 0; _i < _n; _i++)
			{
				file_text_write_string(_file,_array[_i]);
				if(_i != _n-1)
				{
					file_text_writeln(_file);
				}
			}
			file_text_close(_file);
		}
	}
	else
	{
		_return = -1;
	}

	return _return;


}
