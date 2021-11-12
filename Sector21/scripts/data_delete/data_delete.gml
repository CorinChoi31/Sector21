///@description data_delete(directory)
///@function data_delete(directory)
function data_delete(argument0) {

	///@param directory

	if(file_exists(argument0))
	{
		file_delete(argument0);	
	}


}
