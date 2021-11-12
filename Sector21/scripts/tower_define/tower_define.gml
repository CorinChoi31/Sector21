///@function tower_define(id,type,color,density,rotate,cost,atk_amount,atk_speed,atk_range,atk_length,atk_velocity,cost,atk_amount,atk_speed,atk_range,atk_length);
///@param id,type,color,density,rotate,cost,atk_amount,atk_speed,atk_range,atk_length,atk_velocity,cost,atk_amount,atk_speed,atk_range,atk_length
function tower_define(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14, argument15) {
	var _id = argument0;
	var _type = argument1;

	global.tower_info[? string(_id)+","+string(_type)+"."+"color"] = argument2;
	global.tower_info[? string(_id)+","+string(_type)+"."+"density"] = argument3;
	global.tower_info[? string(_id)+","+string(_type)+"."+"rotate"] = argument4;
	global.tower_info[? string(_id)+","+string(_type)+"."+"cost"] = argument5;
	global.tower_info[? string(_id)+","+string(_type)+"."+"attack_amount"] = argument6;
	global.tower_info[? string(_id)+","+string(_type)+"."+"attack_speed"] = argument7;
	global.tower_info[? string(_id)+","+string(_type)+"."+"attack_range"] = global.grid_length*argument8;
	global.tower_info[? string(_id)+","+string(_type)+"."+"attack_length"] = global.grid_length*argument9;
	global.tower_info[? string(_id)+","+string(_type)+"."+"attack_velocity"] = argument10;
		global.tower_info[? string(_id)+","+string(_type)+"."+"upgrade_cost"] = argument11;
		global.tower_info[? string(_id)+","+string(_type)+"."+"upgrade_attack_amount"] = argument12;
		global.tower_info[? string(_id)+","+string(_type)+"."+"upgrade_attack_speed"] = argument13;
		global.tower_info[? string(_id)+","+string(_type)+"."+"upgrade_attack_range"] = global.grid_length*argument14;
		global.tower_info[? string(_id)+","+string(_type)+"."+"upgrade_attack_length"] = global.grid_length*argument15;


}
