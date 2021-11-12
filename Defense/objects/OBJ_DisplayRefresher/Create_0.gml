display_width = global.display[1];
display_height = global.display[2];
display_scale = global.display[3];

display_viewport = 0;


display_set_gui_size(display_width, display_height);
surface_resize(application_surface, display_width, display_height);

view_set_wport(display_viewport, display_width);
view_set_hport(display_viewport, display_height);

camera_set_view_size(view_camera[display_viewport], display_width, display_height);
camera_set_view_border(view_camera[display_viewport], display_width/2, display_height/2);


switch(os_type)
{
	default:
	case os_windows:
	case os_macosx:
		window_set_size(display_width*display_scale, display_height*display_scale);
		break;
		
	case os_android:
	case os_ios:
		display_scale = 1;
		global.display[3] = 1;
		break;
}