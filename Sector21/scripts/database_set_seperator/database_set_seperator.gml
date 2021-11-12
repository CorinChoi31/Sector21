///@description database_set_seperator(file_name,seperator)
///@funtion database_set_seperator(file_name,seperator)
function database_set_seperator() {

	///@param file_name
	///@param version

	var arg0_dss = argument[0];
	var arg1_dss = argument[1];

	var return_dss = 0;

	if(is_array(arg0_dss))
	{
		var version_dss = database_get_version(arg0_dss);
		var content_dss = database_get_contents(arg0_dss);
		var grid_dss = database_data_to_grid(arg0_dss);

		return_dss = database_grid_to_data(version_dss,arg1_dss,content_dss,grid_dss);
	}
	else
	{
		var read_dss = database_read(arg0_dss);
		var version_dss = database_get_version(read_dss);
		var content_dss = database_get_contents(read_dss);
		var grid_dss = database_data_to_grid(read_dss);

		return_dss = database_grid_to_data(version_dss,arg1_dss,content_dss,grid_dss,arg0_dss);
	}

	return return_dss;


}
