///@description database_how_to_use()
///@function database_how_to_use()
function database_document() {

#region Update
	#region v1.0.7
		/*
			v1.0.7 (180730)
				Fix [database_item_set_list] function
		*/
	#endregion
	#region v1.0.6
		/*
			v1.0.6 (180729)
				Fix [database_item_set_list] function
					> Now you can use this function like [database_item_set] function.
		*/
	#endregion
	#region v1.0.5
		/*
			v1.0.5 (180726)
				Fix [database_item_get] function
					> Now You can get real or string, using argument <real>.
						'true' will get real, 'false' will get string.
		*/
	#endregion
	#region v1.0.4
		/*
			v1.0.4 (180725)
				Fix [database_item_set] function
					Setting Value of 'Item' at index 'x, y'
					> Now '0' at 'y' argument will set 'Item's first value.
						If you want to set -name-, -1 at 'y' argument will, or you can use [database_item_set_name] function.
		*/
	#endregion
	#region v1.0.3
		/*
			v1.0.3 (180725)
				Fix [database_item_get] function
					Returning 'Item' at index 'x, y'.
					> Now '0' at 'y' argument will return 'Item's first value.
						If you want to get -name-, -1 at 'y' argument will, or you can use [database_item_get_name] function.
		
				Add [database_item_get_name] function
					Returning -name- of Item.
		*/
	#endregion
	#region v1.0.2
		/*
			v1.0.2 (180723)
				Add [database_item_get_width] function
					Returning 'Item's Width.
					When real 'Item' index (using function ds_grid_width) is 1, if there has no contents, it returns 0.
		
				Add [database_item_get_heigth] function
					Returning 'Item's Height.
					However, It doesn't include an index of -name-, so It shows a value that real 'Item' index (using function ds_grid_height) -1.
		*/
	#endregion
	#region v1.0.1
		/*
				v1.0.1 (180723)
					Add [database_item_find_by_*] function
						Returning undefined when cannot found.
						Returning integer when found only ONE index.
						Returning array when found the various index.
		*/
	#endregion
#endregion

#region Outline
		/* Data On Grid
			Data On Grid - CoRin's Pre-Pack

			Scripts for Save and Load.
			Some Functions are working, Not Completed. (example : <encryption> option on [database_create])

			== How to Use ==
	
				You can create 'Text File' with [database_create].
		
				You can read 'Text File' with [database_read], it convert 'Text File' to 1D Array.
					This Array called "Data" and you can convert to 'ds_grid' with [database_data_to_grid].
					This Grid called "Item" and you can convert to 'Array' with [database_grid_to_data].
			
				If you provide 4 arguments, you just get 'Array', but you can also provide 5 arguments for this function to export 'Data' to 'Text File'.
		
				You can edit items with [database_item_...] functions.
		
				This Item is completely same 'ds_grid', so you can also use with [ds_grid_...] functions.
	
	
			== For Example ==
	
				database_create("gamedata.txt","1.0",["name","1st","2st","3st"],"/");
					Making 'Text File' named "gamedata.txt".

				global.data = database_read("gamedata.txt");
					Converting 'Text File' to 'Array'.

				global.grid = database_data_to_grid(global.data);
					Converting 'Array' to 'Item'.

				database_item_add(global.grid,"Content_Name","Value");
				database_item_add(global.grid,"Value");
					Adding Value to 'Grid', first one giving -name- to index and second don't.

				global.data = database_grid_to_data("1.0","/",["1st","2st","3st"],global.grid,"test.txt");
					Exporting 'Grid' to 'Text File' and assigning 'Array' to global.data.
		*/
#endregion

#region Read Me!
		/* Data On Grid
			Arguments
	
				If Arguments has < > mark, you can choose to enter Factor or do not.
					Example : [database_item_add]
						database_item_add(item,<name>,contents) 3 Arguments, But you can skip <name> argument.
		*/
#endregion

	return true;


}
