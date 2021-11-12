///@description display_correction(ini,section,key[executed/w/h],w,h,room)
///@function display_correction(ini,section,key[executed/w/h],w,h,room)
///@param ini
///@param section
///@param key[executed/w/h]
///@param w
///@param h
///@param room
///@param view
///@param camera
function display_correction(argument0, argument1, argument2, argument3, argument4, argument5) {

	ini_open(argument0);
	var _read = ini_read_real(argument1,argument2[0],true);
	ini_close();

	if(_read)
	{
		var _w = argument3;
		var _h = argument4;
	
		var _dw = display_get_width();
		var _dh = display_get_height();
		var _sw = _dw/_w;
		var _sh = _dh/_h;
	
		var _rw = _w;
		var _rh = _h;
	
		ini_open(argument0);
	
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
	
		ini_write_real(argument1,argument2[1],_rw);
		ini_write_real(argument1,argument2[2],_rh);
		ini_write_real(argument1,argument2[0],false);
		ini_close();
	
		room_set_width(argument5,_rw);
		room_set_height(argument5,_rh);
	
		room = argument5;
	
		return [true,_rw,_rh];
	}
	else
	{
		ini_open(argument0);
	
		var _w = argument3;
		var _h = argument4;
	
		var _rw = ini_read_real(argument1,argument2[1],_w);
		var _rh = ini_read_real(argument1,argument2[2],_h);
	
		ini_close();
	
		room_set_width(argument5,_rw);
		room_set_height(argument5,_rh);
	
		room = argument5;
	
		return [false,_rw,_rh];
	}



}
