///@function hex_distance_by_point(q1, r1, q2, r2)
///@param q1
///@param q1
///@param r2
///@param r2
function hex_distance_by_pos(argument0, argument1, argument2, argument3) {

	var _by_max = max(abs(argument0-argument2),abs((-argument0-argument1)-(-argument2-argument3)),abs(argument1-argument3));
	//var _by_abs = (abs(argument0-argument3)+abs(argument1-argument4)+abs(argument2-argument5))/2;
	return _by_max;


}
