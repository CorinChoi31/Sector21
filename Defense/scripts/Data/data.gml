function datafile_load(_directory)
{
	var _result = -1;
	
	if(file_exists(_directory))
	{
		_result = json_parse(datafile_read(_directory));
	}
	else
	{
		_result = { };	
	}
	
	return _result;
}

function datafile_read(_directory)
{
	var _result = "";
	
	if(file_exists(_directory))
	{
		var _file = file_text_open_read(_directory);
		while(!file_text_eof(_file))
		{
			_result += file_text_readln(_file);
		}
		file_text_close(_file);
	}
	return _result;
}

function datafile_save(_directory, _data)
{
	var _file = file_text_open_write(_directory);
	if(_file != -1)
	{
		file_text_write_string(_file, json_rewrite(json_stringify(_data)));
		file_text_close(_file);
	}
}

function datafile_saves(_directory, _data)
{
	datafile_save(_directory, _data);
	datafile_close(_data);
}

function datafile_close(_data)
{
	delete _data;
}

function datafile_data_set(_data, _key, _value)
{
	var _struct = _data;
	var _array = datafile_key_parse(_key);
	
	var _i = 0;
	repeat(array_length(_array)-1)
	{
		var _val = variable_struct_get(_struct, _array[_i]);
		if(is_undefined(_val))
		{
			var __struct = { };
			variable_struct_set(_struct, _array[_i], __struct);
			
			_struct = __struct;
		}
		else
		{
			_struct = variable_struct_get(_struct, _array[_i]);
		}
		_i += 1;
	}
	
	variable_struct_set(_struct, _array[_i], _value);
}

function datafile_data_get_keys(_data)
{
	var _result = variable_struct_get_names(_data);
	
	return _result;
}

function datafile_data_get(_data, _key)
{
	var _result = undefined;
	var _struct = _data;
	var _array = datafile_key_parse(_key);
	
	var _i = 0;
	repeat(array_length(_array)-1)
	{
		var _val = variable_struct_get(_struct, _array[_i]);
		if(is_undefined(_val))
		{
			break;
		}
		else
		{
			_struct = variable_struct_get(_struct, _array[_i]);
		}
		_i += 1;
	}
	
	_result = variable_struct_get(_struct, _array[_i]);
	
	return _result;
}

function datafile_data_gets(_data, _key)
{
	var _result = datafile_data_get(_data, _key);
	if(is_undefined(_result))
	{
		_result = _key;
	}
	
	return _result;
}

function datafile_data_fix(_data, _key, _value)
{
	var _struct = _data;
	var _array = datafile_key_parse(_key);
	
	var _i = 0;
	repeat(array_length(_array)-1)
	{
		var _val = variable_struct_get(_struct, _array[_i]);
		if(is_undefined(_val))
		{
			var __struct = { };
			variable_struct_set(_struct, _array[_i], __struct);
			
			_struct = __struct;
		}
		else
		{
			_struct = variable_struct_get(_struct, _array[_i]);
		}
		_i += 1;
	}
	
	if(is_undefined(variable_struct_get(_struct, _array[_i])))
	{
		variable_struct_set(_struct, _array[_i], _value);
	}
}

function datafile_key_parse(_key)
{
	var _array = [];
	var _size = 1;
	
	var _length = string_length(_key);
	var _index = 0;
	
	var _cpy = "";
	var _str = "";
	
	var _i = 1;
	repeat(_length)
	{
		_cpy = string_copy(_key, _i, 1);
		if(_cpy == ".")
		{
			_array[_size-1] = _str;
			_size += 1;
			
			_str = "";
		}
		else if(_i == _length)
		{
			_str += _cpy;
			_array[_size-1] = _str;
		}
		else
		{
			_str += _cpy;
		}
		_i += 1;
	}
	
	return _array;
}
