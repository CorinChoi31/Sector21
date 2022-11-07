mouse_pos_x = mouse_x;
mouse_pos_y = mouse_y;

mouse_pos_x_previous = mouse_x;
mouse_pos_y_previous = mouse_y;

mouse_is_moved = false;

enum gi_types {
	GI_NONE,
	GI_TOWER,
	GI_BLOCK_NONBREAKABLE,
	GI_BLOCK_BREAKABLE
}

world = new World(@"C:\Users\corin\Documents\GitHub\Sector21\Defense\datafiles\test.json");

show_debug_message(json_rewrite(json_stringify(world)));

grid_information = [];

grid_pos_x_max = 10;
grid_pos_y_max = 8;

for(var _x = 0; _x < grid_pos_x_max; _x++) {
	array_push(grid_information, []);
    
	for(var _y = 0; _y < grid_pos_y_max; _y++) {
		var _gi = new GridInfomation(_x, _y);
		
		array_push(grid_information[_x], _gi);
	}
}

astar = new ASGrid(grid_pos_x_max, grid_pos_y_max, grid_information);
var _result = astar.Run(0, 0, grid_pos_x_max-1, 0);

for(var _i = 0; _i < array_length(_result); _i++) {
	show_debug_message(string(_result[_i]));
}

grid_pos_select = false;
grid_pos_select_x = -1;
grid_pos_select_y = -1;

grid_size_magnify = 1;
grid_size_magnify_target = grid_size_magnify;

grid_size_width = 64;
grid_size_height = 64;
