#region
apply = new Towers(
	4, c_orange, 
	15, 32,
	types.ATTACK_BULLET, types.TARGET_RANDOMS, 1, 0.33, 4, 0.02, 4, 
	1, 1,
	4, 1, 0.5
);

var _name = variable_struct_get_names(apply);
var _size = array_length(_name);

for(var _i = 0; _i < _size; _i++) {
	var __name = _name[_i];
	variable_instance_set(self, __name, variable_instance_get(apply, __name));
}
#endregion

//
unit_size = default_size;

unit_attack_type = default_attack_type;
unit_attack_target_type = effect_attack_target_type;

unit_attack_amount = default_attack_amount;
unit_attack_speed = default_attack_speed;
unit_attack_times = default_attack_times;
unit_attack_delay = default_attack_delay; //delay of multiple fire
unit_attack_range = default_attack_range;

unit_attack_target_min = default_attack_target_min;
unit_attack_target_max = default_attack_target_max;

unit_attack_projectile_velocity = default_attack_projectile_velocity;
unit_attack_projectile_accel = default_attack_projectile_accel;
unit_attack_projectile_size = default_attack_projectile_size;
unit_attack_projectile_range = default_attack_projectile_range;
unit_attack_projectile_chain = default_attack_projectile_chain;
unit_attack_projectile_transfer = default_attack_projectile_transfer;

//
targets = ds_list_create();
effects = ds_list_create();
attacks = [0, 0, 0]; //aiming, times, delay

alpha = 1;


ds_list_add(effects, new Effects());