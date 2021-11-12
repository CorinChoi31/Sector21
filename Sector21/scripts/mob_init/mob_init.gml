///@function tower_init
function mob_init() {
	if(!variable_global_exists("mob_info"))
	{
		global.mob_info = noone;
	}

	if(!ds_exists(global.mob_info,ds_type_map))
	{
		global.mob_info = ds_map_create();
	
	#region
		mob_define(100, 90, 0, [0, 0.35],
			c_blue, 15, 10, 1, 1,
			50);
		mob_define(105, 90, 0, [0.25, 0.5],
			c_blue, 100, 25, 0.5, 1,
			100,
			enemy.effect_defense_up,0.75,5,7.5,3);
	
		mob_define(110, 90, 0, [0.05, 0.25],
			c_aqua, 5, 5, 1, 0.1,
			50,
			enemy.effect_defense_up,0.9,5,0.1,5);
		mob_define(115, 90, 0, [0.4, 0.5],
			c_aqua, 10, 50, 1, 0.1,
			100,
			enemy.effect_defense_up,0.9,2,0.1,2);
	#endregion
	
	#region
		mob_define(200, 90, 0, [0, 0.25],
			c_red, 10, 10, 1.5, 3,
			50);
		mob_define(205, 90, 0, [0.25, 0.5],
			c_red, 50, 25, 0.75, 2,
			100,
			enemy.effect_speed_up,0.5,5,10,2);
	#endregion
	
	#region
		mob_define(300, 90, 0, [0, 0.25],
			c_green, 25, 10, 0.75, 1,
			50);
		mob_define(305, 90, 0, [0.25, 0.75],
			c_green, 200, 50, 0.25, 2,
			100,
			enemy.effect_heal,5,3,10,0);
	#endregion
	
	#region
		mob_define(400, 45, 0, [0, 0.25],
			c_white, 25, 10, 1, 1,
			50);
		mob_define(405, 45, 0, [0.75, 1],
			c_white, 100, 50, 0.5, 0.1,
			100,
			enemy.effect_destroy_projectTile,0,7.5,5,0);
	#endregion
	}


}
