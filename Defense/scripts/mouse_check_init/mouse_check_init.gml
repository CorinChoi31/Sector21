/// @function mouse_check_init(index);
/// @param index

function mouse_check_init(_index)
{
	global.mouse_index = max(1, _index);

	global.mouse_left_press = array_create(global.mouse_index, false);
	global.mouse_left_release = array_create(global.mouse_index, false);
	global.mouse_left = array_create(global.mouse_index, false);
	global.mouse_mid_press = array_create(global.mouse_index, false);
	global.mouse_mid_release = array_create(global.mouse_index, false);
	global.mouse_mid = array_create(global.mouse_index, false);
	global.mouse_right_press = array_create(global.mouse_index, false);
	global.mouse_right_release = array_create(global.mouse_index, false);
	global.mouse_right = array_create(global.mouse_index, false);

	global.mouse_pos_x = array_create(global.mouse_index, 0);
	global.mouse_pos_y = array_create(global.mouse_index, 0);
}