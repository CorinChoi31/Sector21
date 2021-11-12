/// @function mouse_check_step(mouse_button);
/// @param mouse_button

function mouse_check_step(_mouse_button)
{
	for(var _m = 0; _m < global.mouse_index; _m++)
	{
		if(_mouse_button == types.MOUSE_LEFT or _mouse_button == all)
		{
			global.mouse_left_press[_m] = device_mouse_check_button_pressed(_m,mb_left);
			global.mouse_left_release[_m] = device_mouse_check_button_released(_m,mb_left);
			global.mouse_left[_m] = device_mouse_check_button(_m,mb_left);
		}
		if(_mouse_button == types.MOUSE_MIDDLE or _mouse_button == all)
		{
			global.mouse_mid_press[_m] = device_mouse_check_button_pressed(_m,mb_middle);
			global.mouse_mid_release[_m] = device_mouse_check_button_released(_m,mb_middle);
			global.mouse_mid[_m] = device_mouse_check_button(_m,mb_middle);
		}
		if(_mouse_button == types.MOUSE_RIGHT or _mouse_button == all)
		{
			global.mouse_right_press = device_mouse_check_button_pressed(_m,mb_right);
			global.mouse_right_release = device_mouse_check_button_released(_m,mb_right);
			global.mouse_right = device_mouse_check_button(_m,mb_right);
		}
	
		global.mouse_pos_x[_m] = device_mouse_x(_m);
		global.mouse_pos_y[_m] = device_mouse_y(_m);
	}
}