///@description database_create(file_name,version,contents[0~29999],separator,<encryption>)
///@funtion database_create(file_name,version,contents[0~29999],separator,<encryption>)
function database_create() {

	///@param file_name
	///@param version
	///@param contents[0~29999]
	///@param separator
	///@param <encryption>

	var arg0 = argument0;
	var arg1 = argument1;
	var arg2 = argument2;
	var arg3 = argument3;

	var _return = 0;

	if(file_exists(arg0))
	{
		_return = -1;
	}
	else
	{
		_return = 1;
	
		var _file = file_text_open_write(arg0);
	
		file_text_write_string(_file,"version : "+string(arg1));
		file_text_writeln(_file);

		file_text_write_string(_file,"separator : "+string(arg3));
		file_text_writeln(_file);

		file_text_write_string(_file,"contents : ");
		for(var _re = 0; _re < array_length_1d(arg2); _re++)
		{
			file_text_write_string(_file,string(arg3));
			file_text_write_string(_file,string(arg2[_re]));
		}
	
		if(argument_count = 5)
		{
			var arg4 = argument[4];
		}
	
		file_text_close(_file);
	}

	return _return;


}
