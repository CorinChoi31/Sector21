target_instance = noone;
if(instance_exists(global.game))
{
	target_instance = global.game;
}
else
{
	if(instance_exists(global.menu))
	{
		target_instance = global.menu;
	}
}

alarm[0] = 1;