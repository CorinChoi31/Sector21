///@function data_version(version)
///@param version
function data_version(argument0) {

	var _str = ""; var _ver = 0; var _ver_i = 0;
	var _return = 0;

	_ver[_ver_i] = "";
	for(var i = 1; i <= string_length(argument0); i++)
	{
		_str = string_char_at(argument0,i);
		if(_str = ".")
		{
			_ver_i++;
			_ver[_ver_i] = "";
		}
		else
		{
			_ver[_ver_i] += _str;
		}
	}
	for(var i = 0; i <= _ver_i; i++)
	{
		_ver[i] = real(_ver[i]);
		_return += (_ver[i]*power(100,_ver_i-i));
	}

	return _return;


}
