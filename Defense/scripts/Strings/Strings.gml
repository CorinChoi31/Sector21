function string_strip(_string)
{
	/// @funct string_strip
	/// @descr 
	/// @param {string} string
	
	var _l = string_length(_string);
	var _s = string_copy(_string, 1, 1);
	while(_s == " " || _s == "\n" || _s == "\r" ||_s == "\r\n")
	{
		_string = string_delete(_string, 1, 1);
		_l -= 1;
		
		_s = string_copy(_string, 1, 1);
	}
	
	_s = string_copy(_string, _l, 1);
	while(_s == " " || _s == "\n" || _s == "\r" || _s == "\r\n")
	{
		_string = string_delete(_string, _l, 1);
		_l -= 1;
		
		_s = string_copy(_string, _l, 1);
	}
	
	return _string;
}

function buffer_copy_from_block(_src_buffer, _src_start, _src_end, _dst_buffer)
{
	var _block_size = _src_end - _src_start;
	if(_block_size > 0)
	{
		var _size = buffer_get_size(_dst_buffer);
		var _position = buffer_tell(_dst_buffer);
		var _request = _position + _block_size;
		 
		if(_size < _request)
		{
			do
			{
				_size *= 2;
			}
			until(_size >= _request);
			buffer_resize(_dst_buffer, _size);
		}
		
		buffer_copy(_src_buffer, _src_start, _block_size, _dst_buffer, _position);
		buffer_seek(_dst_buffer, buffer_seek_relative, _block_size);
	}
}

function json_rewrite(_json)
{
	var _bufson = buffer_create(1024, buffer_grow, 1);
	
	buffer_seek(_bufson, buffer_seek_start, 0);
	buffer_write(_bufson, buffer_string, _json);
	
	var _size = buffer_tell(_bufson) - 1;
	
	var _bufast = buffer_create(_size, buffer_fast, 1);
	buffer_copy(_bufson, 0, _size, _bufast, 0);
	buffer_seek(_bufson, buffer_seek_start, 0);
	
	var _block_begin = 0;
	var _block_end = 0;
	var _block_tabs = 0;
	
	var _c = 0;
	while(_block_end < _size)
	{
		_c = buffer_peek(_bufast, _block_end, buffer_u8); _block_end += 1;
		switch(_c)
		{
			case 9:		// \t
			case 10:	// \n
			case 13:	// \r
			case 32:	// (blank)
				buffer_copy_from_block(_bufast, _block_begin, _block_end - 1, _bufson);
				while(_block_end < _size)
				{
					switch(buffer_peek(_bufast, _block_end, buffer_u8))
					{
						case 9:
						case 10:
						case 13:
						case 32:
							_block_end += 1;
							continue;
						default:
							break;
					}
					break;
				}
				_block_begin = _block_end;
				break;
			case 34:	// "
				while(_block_end < _size)
				{
					switch(buffer_peek(_bufast, _block_end++, buffer_u8))
					{
						case 92:	// \
							_block_end += 1;
							continue;
						case 34:	// "
							break;
						default:
							continue;
					}
					break;
				}
				break;
			case 91:	// [
			case 123:	// {
				buffer_copy_from_block(_bufast, _block_begin, _block_end, _bufson);
				while(_block_end < _size)
				{
					switch(buffer_peek(_bufast, _block_end, buffer_u8))
					{
						case 9:
						case 10:
						case 13:
						case 32:
							_block_end += 1;
							continue;
						default:
							break;
					}
					break;
				}
				_c = buffer_peek(_bufast, _block_end, buffer_u8);
				switch(_c)
				{
					case 93:	// ]
					case 125:	// }
						buffer_write(_bufson, buffer_u8, _c);
						_block_end += 1;
						break;
					default:
						buffer_write(_bufson, buffer_u16, 2573);
						repeat(++_block_tabs)
						{
							buffer_write(_bufson, buffer_u8, 9);
						}
						break;
				}
				_block_begin = _block_end;
				break;
			case 93:	// ]
			case 125:	// }
				buffer_copy_from_block(_bufast, _block_begin, _block_end - 1, _bufson);
				buffer_write(_bufson, buffer_u16, 2573);
				repeat(--_block_tabs)
				{
					buffer_write(_bufson, buffer_u8, 9);
				}
				buffer_write(_bufson, buffer_u8, _c);
				_block_begin = _block_end;
				break;
			case 44:	// ,
				buffer_copy_from_block(_bufast, _block_begin, _block_end, _bufson);
				buffer_write(_bufson, buffer_u16, 2573);
				repeat(_block_tabs)
				{
					buffer_write(_bufson, buffer_u8, 9);
				}
				_block_begin = _block_end;
				break;
			case 58:	// :
				if(buffer_peek(_bufast, _block_end, buffer_u8) != 32)
				{
					buffer_copy_from_block(_bufast, _block_begin, _block_end, _bufson);
					buffer_write(_bufson, buffer_u8, 32);
					_block_begin = _block_end;
				}
				else
				{
					_block_end += 1;	
				}
				break;
			default:
				break;
		}
	}
	
	var _result = "";
	
	if(_block_begin == 0)
	{
		_result = _json;
	}
	else
	{
		buffer_copy_from_block(_bufast, _block_begin, _block_end, _bufson);
		buffer_write(_bufson, buffer_u8, 0);
		buffer_seek(_bufson, buffer_seek_start, 0);
		
		_result = buffer_read(_bufson, buffer_string);
	}
	
	buffer_delete(_bufson);
	buffer_delete(_bufast);
	
	return _result;
}
