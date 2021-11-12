///@description database_read(file_name)
///@funtion database_read(file_name)
function database_read(argument0) {

	///@param file_name

	var arg0_dr = argument0;

	var _return_dr = 0;

	if(!file_exists(arg0_dr))
	{
		_return_dr = -1;
	}
	else
	{
		var _file_dr = file_text_open_read(arg0_dr);
		var _read_dr = 0;
		var _dr0 = 0;
	
		while(!file_text_eoln(_file_dr))
		{
			_read_dr[_dr0] = file_text_read_string(_file_dr);
			_dr0++;
		
			file_text_readln(_file_dr);
		}
		file_text_close(_file_dr);
	
		_return_dr = _read_dr;
	}

	return _return_dr;


}
