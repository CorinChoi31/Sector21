
if(mouse_check_button(mb_middle))
{
	x += (mouse_x-mouse_previous_x)/1;
	y += (mouse_y-mouse_previous_y)/1;
}

if(mouse_wheel_up())
{
	grid_size_magnifying += 0.1;	
}

if(mouse_wheel_down())
{
	grid_size_magnifying -= 0.1;	
}

mouse_previous_x = mouse_x;
mouse_previous_y = mouse_y;
