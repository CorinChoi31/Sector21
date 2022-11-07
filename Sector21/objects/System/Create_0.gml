#region
randomize();

global.font = font_add_sprite_ext(FONTV3,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-()",true,8);

display_set_gui_size(room_width, room_height);
surface_resize(application_surface, room_width, room_height);

//view_set_wport(view_camera[0],global.display[1]);
//view_set_hport(view_camera[0],global.display[2]);

camera_set_view_size(view_camera[0],global.display[1],global.display[2]);
camera_set_view_border(view_camera[0],global.display[1]/2,global.display[2]/2);
#endregion

#region
global.d_time = 0;
global.d_pause = false;
#endregion

#region
global.glitch = 0;
#endregion

#region In Game
global.tower_tech = [0,0,0,0,0];

global.grid_cursor = noone;

global.grid_center = [room_width/2,room_height/2];
global.grid_radius = 4;
global.grid_length = 64;

global.grid_vectical = sqrt(3);
global.grid_horizontal = 3/2;

global.grid_hex = ds_grid_create(global.grid_radius*2+1,global.grid_radius*2+1);
global.grid_hex_tile = ds_grid_create(global.grid_radius*2+1,global.grid_radius*2+1);
global.grid_hex_tower = ds_grid_create(global.grid_radius*2+1,global.grid_radius*2+1);

tower_init();
mob_init();
#endregion

#region
global.menu = instance_create_layer(room_width/2,room_height/2,"System",Menu);
global.game = noone; //instance_create_layer(room_width/2,room_height/2,"Game",Game);

global.data_map = ds_map_create();
#endregion