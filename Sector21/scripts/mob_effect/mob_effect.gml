function mob_effect() {
	var _id, amount, amount_origin, tick, tick_origin, first, sender;

	effe_health_max = 0;

	effe_attack_amount = 0;
	effe_attack_speed = 0;
	effe_attack_length = 0;

	effe_ratio_send = 0;
	effe_ratio_recive = 0;

	effe_speed_max = 0;
	effe_speed_accel = 0;

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
		
			case effect.clear_increase:
				for(var j = ds_list_size(unit_effect_id)-1; j >= 0; j--)
				{
					if(_id == effect.attack_amount_increase or
						_id == effect.movement_speed_increase or
						_id == effect.movement_speed_increase_soft or
						_id == effect.ratio_send_increase or
						_id == effect.ratio_recive_decrease 
					)
					{
						unit_effect_id[|j] = noone;
					}
				
					draw_set_font(GodoM_R12);
					draw_notify(x,y+16,"강화 효과 해제",GodoM_R12,c_yellow,0.75,16+string_width(unit_score),string_height(unit_score)/4,c_white,0.1,tick_origin/2,step,0,-16,id);
					
					unit_effect_id[|i] = noone;
				}
				break;
		
			case effect.health_heal:
				draw_set_font(GodoM_R16);
				draw_notify(x,y+16,"회복",GodoM_R16,c_lime,0.75,16+string_width(unit_score),string_height(unit_score)/4,c_white,0.1,tick_origin/2,step,0,0,id);
			
				unit_health = min(unit_health_max,unit_health+amount)
			
				unit_effect_id[|i] = noone;
				break;
			
			case effect.movement_speed_increase:
				if(unit_effect_tick[|i] >= 0)
				{
					if(first)
					{
						draw_set_font(GodoM_R16);
						draw_notify(x,y+16,"가속",GodoM_R16,c_lime,0.75,16+string_width(unit_score),string_height(unit_score)/4,c_white,0.1,tick_origin/2,step,0,0,id);
					
						unit_effect_first[|i] = false;
					}
				
					effe_speed_max += unit_speed_max*amount;
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
			case effect.movement_speed_increase_soft:
				if(unit_effect_tick[|i] >= 0)
				{
					if(first)
					{
						draw_set_font(GodoM_R16);
						draw_notify(x,y+16,"가속",GodoM_R16,c_lime,0.75,16+string_width(unit_score),string_height(unit_score)/4,c_white,0.1,tick_origin/2,step,0,0,id);
					
						unit_effect_first[|i] = false;
					}
				
					effe_speed_max += unit_speed_max*amount;
					unit_effect_amount[|i] += -amount/max(1,tick);
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
		
			case effect.movement_speed_decrease:
				if(unit_effect_tick[|i] >= 0)
				{
					if(first)
					{
						draw_set_font(GodoM_R16);
						draw_notify(x,y+16,"둔화",GodoM_R16,c_yellow,0.75,16+string_width(unit_score),string_height(unit_score)/4,c_white,0.1,tick_origin/2,step,0,0,id);
					
						unit_effect_first[|i] = false;
					}
				
					effe_speed_max -= unit_speed_max*amount;
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
			case effect.movement_speed_decrease_soft:
				if(unit_effect_tick[|i] >= 0)
				{
					if(first)
					{
						draw_set_font(GodoM_R16);
						draw_notify(x,y+16,"둔화",GodoM_R16,c_yellow,0.75,16+string_width(unit_score),string_height(unit_score)/4,c_white,0.1,tick_origin/2,step,0,0,id);
					
						unit_effect_first[|i] = false;
					}
				
					effe_speed_max -= unit_speed_max*amount;
					unit_effect_amount[|i] += -amount/tick;
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
			case effect.movement_stun:
				if(unit_effect_tick[|i] >= 0)
				{
					if(first)
					{
						draw_set_font(GodoM_R16);
						draw_notify(x,y+16,"기절",GodoM_R16,c_yellow,0.75,16+string_width(unit_score),string_height(unit_score)/4,c_white,0.1,tick_origin/2,step,0,0,id);
					
						unit_effect_first[|i] = false;
					}
				
					unit_moveable = false;
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_moveable = true;
				
					unit_effect_id[|i] = noone;
				}
				break;
			
			case effect.ratio_recive_increase:
				if(unit_effect_tick[|i] > 0)
				{
					if(first)
					{
						draw_set_font(GodoM_R16);
						draw_notify(x,y+16,"방어력 감소",GodoM_R16,c_yellow,0.75,16+string_width(unit_score),string_height(unit_score)/4,c_white,0.1,tick_origin/2,step,0,0,id);
					
						unit_effect_first[|i] = false;
					}
				
					effe_ratio_recive += amount;
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
			
			case effect.ratio_recive_decrease:
				if(unit_effect_tick[|i] > 0)
				{
					if(first)
					{
						draw_set_font(GodoM_R16);
						draw_notify(x,y+16,"방어력 증가",GodoM_R16,c_lime,0.75,16+string_width(unit_score),string_height(unit_score)/4,c_white,0.1,tick_origin/2,step,0,0,id);
					
						unit_effect_first[|i] = false;
					}
				
					effe_ratio_recive -= amount;
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
			
			case effect.damage_dealt_ignore_ratio:	
				if(unit_effect_tick[|i] > 0)
				{
					mob_damage_add(id,damage.dealt_ignore_ratio,amount/tick_origin);
				
					unit_effect_tick[|i] -= _t;
				}
				else
				{
					unit_effect_id[|i] = noone;
				}
				break;
		}
	}

	calc_health_max = max(unit_health_max,unit_health_max+effe_health_max);

	calc_attack_amount = max(0,unit_attack_amount+effe_attack_amount);
	calc_attack_length = max(0,unit_attack_length+effe_attack_length);
	calc_attack_speed = max(unit_attack_speed*0.1,unit_attack_speed+effe_attack_speed);

	calc_ratio_send = max(0,unit_ratio_send+effe_ratio_send);
	calc_ratio_recive = max(0,unit_ratio_recive+effe_ratio_recive);

	calc_speed_max = max(0,unit_speed_max+effe_speed_max);
	calc_speed_accel = max(0,unit_speed_accel+effe_speed_accel);


}
