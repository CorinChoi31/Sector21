///@function hex_distance_by_point(x1, y1, z1, x2, y2, z2)
///@param x1
///@param y1
///@param z1
///@param x2
///@param y2
///@param z2
function hex_distance_by_point(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _by_max = max(abs(argument0-argument3),abs(argument1-argument4),abs(argument2-argument5));
	//var _by_abs = (abs(argument0-argument3)+abs(argument1-argument4)+abs(argument2-argument5))/2;
	return _by_max;


}
