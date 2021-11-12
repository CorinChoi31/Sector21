function display_initializator(_storage, _display_width, _display_height, _display_scale, _display_orientation)
{
	var _display_auto_resize = false;
	if(!ds_map_exists(_storage, "display.default.auto_resize") or _storage[? "display.default.auto_resize"])
	{
		_display_auto_resize = true;
	}
	
	if(_display_auto_resize)
	{
		var _display = display_calculate(_display_width, _display_height, _display_scale, _display_orientation);
		
		_display_width = _display[0];
		_display_height = _display[1];
		_display_scale = _display[2];
		
		_storage[? "display.default.auto_resize"] = false;
		_storage[? "display.default.width"] = _display_width;
		_storage[? "display.default.height"] = _display_height;
		_storage[? "display.default.scale"] = _display_scale;
	}
	else
	{
		_storage[? "display.default.auto_resize"] = false;
		
		if(!is_undefined(_storage[? "display.default.width"]))
			_display_width = _storage[? "display.default.width"];
		if(!is_undefined(_storage[? "display.default.height"]))
			_display_height = _storage[? "display.default.height"];
		if(!is_undefined(_storage[? "display.default.scale"]))
			_display_scale = _storage[? "display.default.scale"];
	}
	
	return [_display_auto_resize, _display_width, _display_height, _display_scale, -1];
}

function display_calculate(_display_width, _display_height, _display_scale, _display_orientation)
{
	var _display_width_ratio = display_get_width()/_display_width;
	var _display_height_ratio = display_get_height()/_display_height;
	
	if(_display_orientation%2 != display_get_orientation()%2)
	{
		var _temp = _display_width;
		_display_width = _display_height;
		_display_height = _temp;
		
		_display_width_ratio = display_get_width()/_display_width;
		_display_height_ratio = display_get_height()/_display_height;
		
		_display_width = _display_width * ((_display_width_ratio > _display_height_ratio) ? (_display_width_ratio/_display_height_ratio) : 1);
		_display_height = _display_height * ((_display_width_ratio < _display_height_ratio) ? (_display_height_ratio/_display_width_ratio) : 1);
		
		var _temp = _display_width;
		_display_width = _display_height;
		_display_height = _temp;
		
		_display_width = round(_display_width);
		_display_height = round(_display_height);
		_display_scale = min(_display_scale, _display_width_ratio, _display_height_ratio);
	}
	else
	{
		_display_width = _display_width * ((_display_width_ratio > _display_height_ratio) ? (_display_width_ratio/_display_height_ratio) : 1);
		_display_height = _display_height * ((_display_width_ratio < _display_height_ratio) ? (_display_height_ratio/_display_width_ratio) : 1);
		
		_display_width = round(_display_width);
		_display_height = round(_display_height);
		_display_scale = min(_display_scale, _display_width_ratio, _display_height_ratio);
	}
	
	return [_display_width, _display_height, _display_scale];
}

function display_patch(_display_width, _display_height, _display_scale, _surface, _viewport, _camera)
{
	display_set_gui_size(_display_width, _display_height);
	
	if(!is_undefined(_surface))
	{
		surface_resize(_surface, _display_width, _display_height);
	}
	if(!is_undefined(_viewport))
	{
		view_set_wport(_viewport, _display_width);
		view_set_hport(_viewport, _display_height);
	}
	if(!is_undefined(_camera))
	{
		camera_set_view_size(_camera, _display_width, _display_height);
		camera_set_view_border(_camera, _display_width/2, _display_height/2);
	}
	
	switch(os_type)
	{
		default:
		case os_windows:
		case os_macosx:
			window_set_size(_display_width*_display_scale, _display_height*_display_scale);
			window_center();
			break;
		case os_android:
		case os_ios:
			break;
	}
}