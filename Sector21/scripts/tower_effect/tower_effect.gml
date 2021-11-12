function tower_effect() {
	var _id, amount, amount_origin, tick, tick_origin, first, sender;

	effe_attack_amount = 0;
	effe_attack_speed = 0;
	effe_attack_range = 0;
	effe_attack_length = 0;
	effe_attack_ignore = 0;
	effe_attack_velocity = 0;

	var _t = global.d_time;

	for(var i = ds_list_size(unit_effect_id)-1; i >= 0; i--)
	{
		_id = unit_effect_id[|i];
		amount = unit_effect_amount[|i];
		amount_origin = unit_effect_amount_origin[|i];
		tick = unit_effect_tick[|i];
		tick_origin = unit_effect_tick_origin[|i];
		first = unit_effect_first[|i];
		sender = unit_effect_sender[|i];
	
		switch(_id)
		{
			case noone:
			default:
				ds_list_delete(unit_effect_id,i);
				ds_list_delete(unit_effect_amount,i);
				ds_list_delete(unit_effect_amount_origin,i);
				ds_list_delete(unit_effect_tick,i);
				ds_list_delete(unit_effect_tick_origin,i);
				ds_list_delete(unit_effect_first,i);
				ds_list_delete(unit_effect_sender,i);
				break;
		
			case effect.attack_amount_increase_constant:
				if(unit_effect_tick[|i] >= 0)
				{
					effe_attack_amount = max(effe_attack_amount,amount);
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
			case effect.attack_amount_increase:
				if(unit_effect_tick[|i] >= 0)
				{
					effe_attack_amount = max(effe_attack_amount,unit_attack_amount*amount);
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
		
			case effect.attack_speed_increase:
				if(unit_effect_tick[|i] >= 0)
				{
					effe_attack_speed = min(effe_attack_speed,-unit_attack_speed*amount);
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
		
			case effect.attack_range_increase:
				if(unit_effect_tick[|i] >= 0)
				{
					effe_attack_range = max(effe_attack_range,unit_attack_range*amount);
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
			
			case effect.attack_length_increase:
				if(unit_effect_tick[|i] >= 0)
				{
					effe_attack_length = max(effe_attack_length,unit_attack_length*amount);
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
		
			case effect.attack_velocity_increase:
				if(unit_effect_tick[|i] >= 0)
				{
					effe_attack_velocity = max(effe_attack_velocity,unit_attack_velocity*amount);
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
			
			case effect.attack_ignore_ratio:
				if(unit_effect_tick[|i] >= 0)
				{
					effe_attack_ignore = max(effe_attack_ignore,amount);
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
		}
	}

	calc_attack_amount = max(0,unit_attack_amount+effe_attack_amount);
	calc_attack_speed = max(0,unit_attack_speed+effe_attack_speed);
	calc_attack_range = max(0,unit_attack_range+effe_attack_range);
	calc_attack_length = max(0,unit_attack_length+effe_attack_length);
	calc_attack_ignore = max(0,unit_attack_ignore+effe_attack_ignore);
	calc_attack_velocity = max(0,unit_attack_velocity+effe_attack_velocity);


}
