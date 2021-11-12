///@function hex_path_by_path(pos,path)
function hex_path_by_path(argument0, argument1) {

	///@param pos
	///@param path

	var _c = 0;
	var i = 0;
	for(i = 0; i < array_length_1d(argument0); i++)
	{
		_c = argument0[i];
		path_add_point(argument1,_c[0],_c[1],0);
	}

	return i;


}
