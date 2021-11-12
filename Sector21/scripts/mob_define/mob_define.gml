///@function mob_define(id,density,rotate,range,color,health,damage,speed,accel,score,<id>,<amount>,<speed>,<range>,<length>);
///@param id,density,rotate,range,color,health,damage,speed,accel,score,<id>,<amount>,<speed>,<range>,<length>
function mob_define() {
	var _id = argument[0];

	global.mob_info[? string(_id)+"."+"density"] = argument[1];
	global.mob_info[? string(_id)+"."+"rotate"] = argument[2];
	var _v = argument[3];
	global.mob_info[? string(_id)+"."+"range"] = [global.grid_length*_v[0],global.grid_length*_v[1]];
	global.mob_info[? string(_id)+"."+"color"] = argument[4];
	global.mob_info[? string(_id)+"."+"health"] = argument[5];
	global.mob_info[? string(_id)+"."+"damage"] = argument[6];
	global.mob_info[? string(_id)+"."+"speed"] = argument[7];
	global.mob_info[? string(_id)+"."+"accel"] = argument[8];

	global.mob_info[? string(_id)+"."+"score"] = argument[9];

	if(argument_count > 10)
	{
		global.mob_info[? string(_id)+"."+"skill_id"] = argument[10];
		global.mob_info[? string(_id)+"."+"skill_amount"] = argument[11];
		global.mob_info[? string(_id)+"."+"skill_speed"] = argument[12];
		global.mob_info[? string(_id)+"."+"skill_range"] = argument[13];
		global.mob_info[? string(_id)+"."+"skill_length"] = argument[14];
	}


}
