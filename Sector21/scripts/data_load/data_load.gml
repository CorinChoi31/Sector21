function data_load() {
	/*
	var _directory = "";

	var _created = 0;
	var _data = 0;
	var _grid = 0;

#region Settings
		_directory = dir_SET_SYSTEM;
		_created = database_create(_directory,global.MASTER_DATA_VERSION,global.MASTER_DATA_SETTING_CONTENTS,global.MASTER_DATA_SEPERATOR);
		if(_created = true)
		{
			_grid = database_item_create(5,3);
			database_item_set_list(_grid,0,"First",global.MASTER_GAME_FIRSTON);
			database_item_set_list(_grid,1,"Version",global.MASTER_GAME_VERSION);
			database_item_set_list(_grid,2,"State",global.MASTER_GAME_STATE);
			database_item_set_list(_grid,3,"Restart",global.restart);
		
			var _language = "EN-US";
			switch(os_get_language())
			{
				default:
				case "en":
					_language = "EN-US";
					break;
				case "ko":
					_language = "KO-KR";
					break;
			
			}
			database_item_set_list(_grid,4,"Language",_language);
		
			database_grid_to_data(global.MASTER_DATA_VERSION,global.MASTER_DATA_SEPERATOR,global.MASTER_DATA_SETTING_CONTENTS,_grid,_directory);
			ds_grid_destroy(_grid);
		}
		else
		{
			_grid = database_data_to_grid(database_read(_directory))
			data_fix(_grid,"First",global.MASTER_GAME_FIRSTON);
			data_fix(_grid,"Version",global.MASTER_GAME_VERSION);
			data_fix(_grid,"State",global.MASTER_GAME_STATE);
			data_fix(_grid,"Restart",0);
		
			var _language = "EN-US";
			switch(os_get_language())
			{
				default:
				case "en":
					_language = "EN-US";
					break;
				case "ko":
					_language = "KO-KR";
					break;
			
			}
			data_fix(_grid,"Language",_language);
		
			database_grid_to_data(global.MASTER_DATA_VERSION,global.MASTER_DATA_SEPERATOR,global.MASTER_DATA_SETTING_CONTENTS,_grid,_directory);
			ds_grid_destroy(_grid);
		}
		_data = database_read(_directory);
		global.DATA_SETTING[item_SET_SYSTEM] = database_data_to_grid(_data);
	
		change_language(data_get(global.DATA_SETTING[item_SET_SYSTEM],"Language",0,false));
	
	#region VERSION
			var _previous = data_get(global.DATA_SETTING[item_SET_SYSTEM],"Version",0,false);
			var _version_ratio = data_version(global.MASTER_GAME_VERSION); var _version_previous_ratio = data_version(_previous);
		
			show_debug_message("LOAD VERSION: "+string(_version_previous_ratio)+" > "+string(_version_ratio));
		
			switch(_previous)
			{
				/* Exception Version /
				case global.MASTER_GAME_VERSION:
					break;
			
				case 0:
					break;
				/* Old Version /
				default:
					if(_version_previous_ratio < _version_ratio)
					{
						if(_version_previous_ratio < data_version("1.1.48"))
						{
							data_delete(dir_SET_VIDEO);
					
						
							data_delete(dir_ARC_RECORD+dir_ARC_EASY);
							data_delete(dir_ARC_RECORD+dir_ARC_NORMAL);
							data_delete(dir_ARC_RECORD+dir_ARC_HARD);
							data_delete(dir_ARC_RECORD+dir_ARC_LEGENDARY);
						}
						if(_version_previous_ratio < data_version("1.1.48"))
						{
							data_delete("GameSetting");
						}
					}
					break;
			}
	#endregion
#endregion
	*/


}
