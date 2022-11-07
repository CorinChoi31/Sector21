///@function mob_spawn(x,y,id)
function mob_spawn(argument0, argument1, argument2) {

	///@param x,y,id

	var _ins = instance_create_layer(argument0,argument1,"Mob",Game_Mob);
	with(_ins)
	{
		unit_id = argument2;
	
		/*
		density = argument3;
		rotate = argument4;
	
		range_dest = argument5;
		color_dest = argument6;
	
		unit_health_max = argument7;
		unit_attack_amount = argument8;
		unit_speed_max = argument9;
		unit_speed_accel = argument10;
		*/
	}

	return _ins;


}
