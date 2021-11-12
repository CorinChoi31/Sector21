///@function projectTile_fire(x,y,id,target,density,rotate,range,color,damage,range,speed,accel)
function projectTile_fire(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {

	///@param x,y,id,target,density,rotate,range,color,damage,range,speed,accel

	var _ins = instance_create_layer(argument0,argument1,"ProjectTile",Game_ProjectTile);
	with(_ins)
	{
		unit_id = argument2;
	
		unit_attack_target = argument3;
	
		density = argument4;
		rotate = argument5;
	
		range_dest = argument6;
		color_dest = argument7;
	
		unit_attack_amount = argument8;
		unit_attack_range = argument9;
	
		unit_speed_max = argument10;
		unit_speed_accel = argument11;
	}

	return _ins;


}
