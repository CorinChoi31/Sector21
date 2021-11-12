global.seq_fpsc = Frame/room_speed;
mouse_check_step(types.MOUSE_LEFT);

if(keyboard_check_released(ord("5")))
{
	game_restart();
}