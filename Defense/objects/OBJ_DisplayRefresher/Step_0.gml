switch(os_type)
{
	default:
	case os_windows:
	case os_macosx:
		window_center();
		break;
	case os_android:
	case os_ios:
		
		break;
}

instance_destroy();