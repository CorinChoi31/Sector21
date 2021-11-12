global.seq_time = delta_time/1000000;

switch(os_type)
{
	default:
	case os_windows:
		if(os_is_paused())
		{
			global.seq_time = 0;
		}
		break;
		
	case os_android:
		if(os_is_paused())
		{
			global.seq_time = 0;
			
			with(all)
			{
				event_user(0);
			}
		}
		break;
}

global.seq_tick = global.seq_time*room_speed;