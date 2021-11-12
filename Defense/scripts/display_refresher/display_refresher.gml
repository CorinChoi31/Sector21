/// @function display_refresher(ini, section, key[executed/w/h/ratio], width, height, ratio, room)
/// @param ini
/// @param section
/// @param key[executed/w/h/ratio]
/// @param width
/// @param height
/// @param ratio
/// @param room

function display_refresher(_ini, _section, _key, _w, _h, _r, _room) {

	ini_open(_ini);
	var _read = ini_read_real(_section, _key[0], true);
	ini_close();

	if(_read)
	{
		var _dw = display_get_width();
		var _dh = display_get_height();
		var _sw = _dw/_w;
		var _sh = _dh/_h;
	
		var _rw = _w;
		var _rh = _h;
		
		ini_open(_ini);
	
		if(_sw == _sh)
		{
			_rw = _w;
			_rh = _h;
		}
		else if(_sw > _sh)
		{
			_rw = _w*(_sw/_sh);
			_rh = _h;
		}
		else if(_sw < _sh)
		{
			_rw = _w;
			_rh = _h*(_sh/_sw);
		}
	
		_rw = round(_rw);
		_rh = round(_rh);
	
		ini_write_real(_section, _key[1], _rw);
		ini_write_real(_section, _key[2], _rh);
		ini_write_real(_section, _key[0], false);
		ini_write_real(_section, _key[3], _r);
		ini_close();
	
		room_set_width(_room, _rw);
		room_set_height(_room, _rh);
		
		if(_r <= 0)
		{
			_r = min(_sw, _sh);
		}
		
		room_goto(_room);
	
		return [true, _rw, _rh, _r];
	}
	else
	{
		ini_open(_ini);
	
		var _rw = ini_read_real(_section, _key[1], _w);
		var _rh = ini_read_real(_section, _key[2], _h);
		var _rr = ini_read_real(_section, _key[3], _r);
	
		ini_close();
	
		room_set_width(_room, _rw);
		room_set_height(_room, _rh);
		
		room_goto(_room);
		
		return [false, _rw, _rh, _rr];
	}
}
