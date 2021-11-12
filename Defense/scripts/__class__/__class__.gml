function Effects(_type = -1, _id = -1, _time = 0, _amount = 0, _sender = undefined, _receiver = undefined, _data = undefined) constructor
{
	type = _type;
	id = _id;
	
	permanent = (_time == -1) ? true : false;
	
	sender = _sender;
	receiver = _receiver;
	
	affected = false;
	
	amount_affected = _amount;
	amount = _amount;
	
	time_affected = _time;
	time = _time;
	
	data = _data;
}

function Damages(_type = -1, _id = -1, _amount = 0, _sender = undefined, _receiver = undefined, _data = undefined) constructor
{
	type = _type;
	id = _id;
	
	sender = _sender;
	receiver = _receiver;
	
	amount_affected = _amount;
	amount = _amount;
	
	data = _data;
}

function Towers(
	_density = 4, _color = c_white,
	_default_cost = 1, _default_size = 32,
	_attack_type = types.ATTACK_BULLET, _attack_target_type = types.TARGET_NEAREST,
	_attack_amount = 1, _attack_speed = 1, _attack_times = 1, _attack_delay = 0.1, _attack_range = 1,
	_attack_target_min = 1, _attack_target_max = 1,
	_projectile_range = 0, _projectile_chain = 0, _projectile_transfer = 0.5
) constructor
{
	//
	density = _density;
	color = _color;
	
	//
	upgraded = 0;
	upgraded_max = 5;
	
	//
	default_cost = _default_cost;
	
	upgrade_cost = 1;
	
	//
	default_size = _default_size;
	
	upgrade_size = 0;
	
	effect_size = 0;
	
	//
	default_attack_type = _attack_type;
	default_attack_target_type = _attack_target_type;
	
	default_attack_amount = _attack_amount;
	default_attack_speed = _attack_speed;
	default_attack_times = _attack_times;
	default_attack_delay = _attack_delay; //delay of multiple fire
	default_attack_range = _attack_range;
	default_attack_ratio = 1;
	
	default_attack_target_min = _attack_target_min;
	default_attack_target_max = _attack_target_max;
	
	default_attack_projectile_velocity = 256;
	default_attack_projectile_accel = 16;
	default_attack_projectile_size = 16;
	default_attack_projectile_range = _projectile_range;
	default_attack_projectile_chain = _projectile_chain;
	default_attack_projectile_transfer = _projectile_transfer; //transfer of damage ratio
	
	upgrade_attack_amount = 1;
	upgrade_attack_speed = 0;
	upgrade_attack_times = 0;
	upgrade_attack_delay = 0;
	upgrade_attack_range = 1;
	upgrade_attack_ratio = 0;
	
	upgrade_attack_target_min = 1;
	upgrade_attack_target_max = 1;
	
	upgrade_attack_projectile_velocity = 0;
	upgrade_attack_projectile_accel = 0;
	upgrade_attack_projectile_range = 0;
	upgrade_attack_projectile_chain = 0;
	upgrade_attack_projectile_transfer = 0;
	
	effect_attack_type = -1;
	effect_attack_target_type = -1;
	
	effect_attack_amount = 0;
	effect_attack_speed = 0;
	effect_attack_times = 0;
	effect_attack_delay = 0;
	effect_attack_range = 0;
	effect_attack_ratio = 0;
	
	effect_attack_target_min = 0;
	effect_attack_target_max = 0;
	
	effect_attack_projectile_velocity = 0;
	effect_attack_projectile_accel = 0;
	effect_attack_projectile_range = 0;
	effect_attack_projectile_chain = 0;
	effect_attack_projectile_transfer = 0;
}

function Enemies(
	_density = 4, _color = c_white,
	_default_cost = 1, _default_size = 32,
	_attack_amount = 1, _defense_amount = 0,
	_skill_type = -1, _skill_id = -1, _skill_cooldown = 0, _skill_duration = 0, _skill_amount = 0, _skill_range = 0
) constructor
{
	//
	density = _density;
	color = _color;
	
	//
	upgraded = 0;
	upgraded_max = -1;
	
	//
	default_cost = _default_cost;
	
	upgrade_cost = 1;
	
	//
	default_size = _default_size;
	
	upgrade_size = 0;
	
	effect_size = 0;
	
	//
	default_health = 1;
	default_health_max = 1;
	
	upgrade_health_max = 1;
	
	effect_health_max = 0;
	
	//
	default_attack_amount = _attack_amount;
	default_attack_ratio = 1;
	
	upgrade_attack_amount = 0;
	upgrade_attack_ratio = 0;
	
	effect_attack_amount = 0;
	effect_attack_ratio = 0;
	
	//
	default_defense_amount = _defense_amount;
	default_defense_ratio = 1;
	
	upgrade_defense_amount = 0;
	upgrade_defense_ratio = 1;
	
	effect_defense_amount = 0;
	effect_defense_ratio = 1;
	
	//
	default_skill_type = _skill_type;
	default_skill_id = _skill_id;
	default_skill_cooldown = _skill_cooldown;
	default_skill_duration = _skill_duration;
	default_skill_amount = _skill_amount;
	default_skill_range = _skill_range;
}