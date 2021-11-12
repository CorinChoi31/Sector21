if(global.game == id)
{
	global.game = noone;
	
	os_powersave_enable(true);
}

global.grid_cursor = noone;
global.glitch = 0;

ds_list_destroy(game_enemy_list);
ds_list_destroy(game_enemy_entry);