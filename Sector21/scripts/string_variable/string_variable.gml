///@function string_variable(string);
function string_variable(argument0) {

	///@param string

	var _string = argument0;
	var _str = "";
	var _str_str = "";

	var _result = "";

	var _command = 0; var _commander = "";
	var _argument = 0; var _argument_index = 0;
	var _uncommand = "";

	_string = string(_string);

	for(var _s = 1; _s <= string_length(_string); _s++)
	{
		_str = string_char_at(_string,_s);
	
		if(_command > 0)
		{
			if(_str = "}")
			{
				_uncommand += _str;
			
				switch(_commander)
				{
					case "find":
						_str = global.lang[?_argument[0]];
						break;
					default:
						_str = _uncommand;
						break;
				}
			
				_commander = "";
				_uncommand = "";
				_argument = 0;
				_argument_index = 0;
				_command = 0;
			}
			else if(_str = "|")
			{
				_command = 2;
			
				_argument[_argument_index] = "";
				_argument_index += 1;
			}
			else
			{
				if(_command = 1)
				{
					_commander += _str;
				}
				else if(_command = 2)
				{
					if(_str = "`")
					{
						_argument[_argument_index] = "";
						_argument_index += 1;
					}
					else
					{
						_argument[_argument_index-1] += _str;
					}
				}
			}
		}
	
		if(_command <= 0)
		{
			if(_str = "{")
			{
				_command = 1;
			}
			else
			{
				for(var _u = 1; _u <= string_length(_str); _u++)
				{
					_str_str = string_char_at(_str,_u);
					if(_str_str != " " and _str_str != "\n")
					{
						if(string_width(_str_str) > 0)
						{
							_result += _str_str;
						}
						else
						{
							_result += string(ord(_str_str));
						}
					}
					else
					{
						_result += _str_str;
					}
				}
			}
		}
	}

	return _result;


}
