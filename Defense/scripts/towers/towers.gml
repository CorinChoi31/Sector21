function tower_effect(ticks = 1)
{
	effect_attack_type = -1;
	effect_attack_target_type = -1;
		
	effect_attack_amount = 0;
	effect_attack_speed = 0;
	effect_attack_times = 0;
	effect_attack_delay = 0;
	effect_attack_range = 0;
		
	effect_attack_target_min = 0;
	effect_attack_target_max = 0;
		
	effect_attack_projectile_velocity = 0;
	effect_attack_projectile_accel = 0;
	effect_attack_projectile_range = 0;
	effect_attack_projectile_chain = 0;
	effect_attack_projectile_transfer = 0;
	
	var _size = ds_list_size(effects);
	for(var _i = _size-1; _i >= 0; _i--)
	{
		var _effect = effects[| _i];
		
		switch(_effect.id)
		{
			default:
				delete _effect;
				ds_list_delete(effects, _i);
				show_debug_message("Successfully deleted");
				continue;
				break;
			
			case 0:
				break;
		}
		
		_effect.affected = true;
		_effect.time -= global.seq_time;
		if(_effect.time <= 0)
		{
			if(!_effect.permanent)
			{
				_effect.id = -1;
			}
		}
	}
}

function tower_status()
{
	if(effect_attack_type == -1)
		unit_attack_type = default_attack_type;
	else
		unit_attack_type = effect_attack_type;
		
	if(effect_attack_target_type == -1)
		unit_attack_target_type = default_attack_target_type;
	else
		unit_attack_target_type = effect_attack_target_type;
	
	unit_size = default_size + upgrade_size*upgraded + effect_size;
	
	unit_attack_amount = default_attack_amount + upgrade_attack_amount*upgraded + effect_attack_amount;
	unit_attack_speed = max(0.05, default_attack_speed + upgrade_attack_speed*upgraded + effect_attack_speed);
	unit_attack_times = default_attack_times + upgrade_attack_times*upgraded + effect_attack_times;
	unit_attack_delay = default_attack_delay + upgrade_attack_delay*upgraded + effect_attack_delay;
	unit_attack_range = default_attack_range + upgrade_attack_range*upgraded + effect_attack_range;
		
	unit_attack_target_min = default_attack_target_min + upgrade_attack_target_min*upgraded + effect_attack_target_min;
	unit_attack_target_max = default_attack_target_max + upgrade_attack_target_max*upgraded + effect_attack_target_max;
		
	unit_attack_projectile_velocity = default_attack_projectile_velocity + upgrade_attack_projectile_velocity*upgraded + effect_attack_projectile_velocity;
	unit_attack_projectile_accel = default_attack_projectile_accel + upgrade_attack_projectile_accel*upgraded + effect_attack_projectile_accel;
	unit_attack_projectile_range = default_attack_projectile_range + upgrade_attack_projectile_range*upgraded + effect_attack_projectile_range;
	unit_attack_projectile_chain = default_attack_projectile_chain + upgrade_attack_projectile_chain*upgraded + effect_attack_projectile_chain;
	unit_attack_projectile_transfer = default_attack_projectile_transfer + upgrade_attack_projectile_transfer*upgraded + effect_attack_projectile_transfer;	
}

function tower_aim()
{
	if(ds_list_size(targets) > 0)
	{
		ds_list_clear(targets);
	}
	
	if(unit_attack_target_max > 0 or unit_attack_target_max <= -1)
	{
		var _array = [];
		var _index = 0;
		var _size = 0;
		
		with(OBJ_Enemy)
		{
			if(!destroy)
			{
				var _distance = point_distance(x, y, other.x, other.y) - range;
				if(_distance <= other.unit_attack_range*64)
				{
					array_push(_array, [id, _distance, unit_health, 0, random_range(0, 1000)]);
				}
			}
		}
		
		if(array_length(_array) > 0)
		{
			switch(unit_attack_target_type)
			{
				default:
				case types.TARGET_NEAREST:
					var _compare = function(i, j)
					{
						return i[1] - j[1];
					}
					array_sort(_array, _compare);
					break;
				case types.TARGET_FARTHEST:
					var _compare = function(i, j)
					{
						return j[1] - i[1];
					}
					array_sort(_array, _compare);
					break;
				case types.TARGET_HEALTH_HIGH:
					var _compare = function(i, j)
					{
						return j[2] - i[2];
					}
					array_sort(_array, _compare);
					break;
				case types.TARGET_HEALTH_LOW:
					var _compare = function(i, j)
					{
						return i[2] - j[2];
					}
					array_sort(_array, _compare);
					break;
				case types.TARGET_DEFENSE_HIGH:
					var _compare = function(i, j)
					{
						return j[3] - i[3];
					}
					array_sort(_array, _compare);
					break;
				case types.TARGET_DEFENSE_LOW:
					var _compare = function(i, j)
					{
						return i[3] - j[3];
					}
					array_sort(_array, _compare);
					break;
				case types.TARGET_RANDOMS:
					var _compare = function(i, j)
					{
						return i[4] - j[4];
					}
					array_sort(_array, _compare);
					break;
			}
			
			repeat(array_length(_array))
			{
				if(unit_attack_target_max >= 0)
				{
					if(_size < unit_attack_target_max)
					{
						ds_list_add(targets, _array[_index][0]);
						_size += 1;
					}
					else
					{
						break;
					}
				}
				else
				{
					ds_list_add(targets, _array[_index][0]);
				}
				_index += 1;
			}
		}
	}
}

function tower_fire()
{
	if(attacks[0] <= 0)
	{
		tower_aim();
		
		if(ds_list_size(targets) > 0)
		{
			while(attacks[0] <= 0)
			{
				attacks[0] += unit_attack_speed;
				attacks[1] = -1;
			}
		}
	}
	
	while(attacks[1] > 0 and attacks[2] <= 0)
	{
		var _index = 0;
		repeat(ds_list_size(targets))
		{
			var _ins = instance_create_layer(x, y, Layer_Game_Interface, OBJ_Projectile);
			_ins.target = targets[| _index];
			_ins.chain = unit_attack_projectile_chain;
			
			_index += 1;
		}
		attacks[1] -= 1;
		attacks[2] += (unit_attack_delay <= 0) ? 0 : max(0.05, unit_attack_delay);
	}
			
	if(attacks[1] == 0)
	{
		if(attacks[0] > 0)
		{
			attacks[0] -= global.seq_time;
		}
	}
	
	if(attacks[1] <= -1)
	{
		attacks[1] = abs(attacks[1]) * unit_attack_times;
	}
	
	if(attacks[2] > 0)
	{
		attacks[2] -= global.seq_time;
	}
}