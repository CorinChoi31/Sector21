if(mouse_check_button(mb_left))
{
	if(point_in_circle(x, y, mouse_x, mouse_y, 16))
	{
		clicked = true;
	}
}
else
{
	clicked = false;	
}

if(mouse_check_button_pressed(mb_right))
{
	if(point_in_circle(x, y, mouse_x, mouse_y, 16))
	{
		destroy = !destroy;
	}
}


if(clicked)
{
	x = mouse_x;
	y = mouse_y;	
}