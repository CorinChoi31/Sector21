///@description data_write(directory,grid,version,seperator,contents)
///@function data_write(directory,grid,version,seperator,contents)
function data_write(argument0, argument1, argument2, argument3, argument4) {

	///@param directory
	///@param grid
	///@param version
	///@param seperator
	///@param contents

	var _data = database_grid_to_data(argument2,argument3,argument4,argument1,argument0);
	ds_grid_destroy(argument1);

	return _data;


}
