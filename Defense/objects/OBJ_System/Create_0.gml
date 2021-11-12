randomize();

//global.__display = display_initializator(global.__data_shared, room_width, room_height, 0.5, display_portrait);


global.seq_time = 0;
global.seq_tick = 0;
global.seq_fpsc = 0;

//global.screen_width = global.__display[1];
//global.screen_height = global.__display[2];
//global.screen_orientate = false;

global.__font = font_add_sprite_ext(SPR_Font,"!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~", true, 4);

//room_set_width(ROM_Main, global.__display[1] >= global.__display[2] ? global.__display[1] : global.__display[2]);
//room_set_height(ROM_Main, global.__display[1] >= global.__display[2] ? global.__display[1] : global.__display[2]);

//camera_set_view_size(global.__camera, global.screen_width, global.screen_height);

switch(os_type)
{
	default:
	case os_windows:
		mouse_check_init(1);
		break;
	
	case os_android:
		mouse_check_init(1);
		break;
}

room_goto(ROM_Main);

//display_patch(global.__display[1], global.__display[2], global.__display[3], application_surface, 0, undefined);