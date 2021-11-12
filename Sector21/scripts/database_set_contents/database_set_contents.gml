///@description database_set_contents(file_name,content)
///@funtion database_set_contents(file_name,content)
function database_set_contents() {

	///@param file_name
	///@param version

	var arg0_dsc = argument[0];
	var arg1_dsc = argument[1];

	var return_dsc = 0;

	if(is_array(arg0_dsc))
	{
		var version_dsc = database_get_version(arg0_dsc);
		var seperator_dsc = database_get_seperator(arg0_dsc);
		var grid_dsc = database_data_to_grid(arg0_dsc);

		return_dsc = database_grid_to_data(version_dsc,seperator_dsc,arg1_dsc,grid_dsc);
	}
	else
	{
		var read_dsc = database_read(arg0_dsc);
		var version_dsc = database_get_version(read_dsc);
		var seperator_dsc = database_get_seperator(arg0_dsc);
		var grid_dsc = database_data_to_grid(read_dsc);

		return_dsc = database_grid_to_data(version_dsc,seperator_dsc,arg1_dsc,grid_dsc,arg0_dsc);
	}

	return return_dsc;


}
