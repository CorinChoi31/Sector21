///@function hex_pos2point(q, r)
///@param q
///@param r
function hex_pos2point(argument0, argument1) {

	var _x = argument0;
	var _z = argument1;
	var _y = -_x-_z;

	return [_x, _y, _z];


}
