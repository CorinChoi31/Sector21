destroy = false;

//
density = 4;

color = c_white;

default_velocity = 0;
default_velocity_max = 1000;

default_acceleration = 500;

range = 8;
//range_ratio = 0.2;
range_end = range;

chain = 0;
transfer = 0;

//
unit_velocity = default_velocity;
unit_velocity_max = default_velocity_max;

unit_acceleration = default_acceleration;

unit_direction = 0;

//
target = undefined;
target_x = x;
target_y = y;
target_range = 0;

targets = ds_list_create();
collisions = ds_list_create();
effects = ds_list_create();

alpha = 0;