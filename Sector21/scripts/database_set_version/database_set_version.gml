///@description database_set_version(file_name,version)
///@funtion database_set_version(file_name,version)
function database_set_version() {

	///@param file_name
	///@param version

	var arg0_dsv = argument[0];
	var arg1_dsv = argument[1];

	var return_dsv = 0;

	if(is_array(arg0_dsv))
	{
		var seperator_dsv = database_get_seperator(arg0_dsv);
		var content_dsv = database_get_contents(arg0_dsv);
		var grid_dsv = database_data_to_grid(arg0_dsv);

		return_dsv = database_grid_to_data(arg1_dsv,seperator_dsv,content_dsv,grid_dsv);
	}
	else
	{
		var read_dsv = database_read(arg0_dsv);
		var seperator_dsv = database_get_seperator(read_dsv);
		var content_dsv = database_get_contents(read_dsv);
		var grid_dsv = database_data_to_grid(read_dsv);

		return_dsv = database_grid_to_data(arg1_dsv,seperator_dsv,content_dsv,grid_dsv,arg0_dsv);
	}

	return return_dsv;


}
