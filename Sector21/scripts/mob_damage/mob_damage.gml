function mob_damage() {
	var _id, amount, amount_origin;
	var _damaged = false;

	var _prev = unit_health;
	for(var i = ds_list_size(unit_damage_id)-1; i >= 0; i--)
	{
		_id = unit_damage_id[|i];
		amount = unit_damage_amount[|i];
		amount_origin = unit_damage_amount_origin[|i];
	
		switch(_id)
		{
			default:
				ds_list_delete(unit_damage_id,i);
				ds_list_delete(unit_damage_amount,i);
				ds_list_delete(unit_damage_amount_origin,i);
				break;
		
			case damage.dealt:
				amount_origin = max(-unit_health+amount_origin*calc_ratio_recive,0);
			
				unit_health -= amount*calc_ratio_recive;
				unit_damage_id[|i] = noone;
				_damaged = true;
				break;
		
			case damage.dealt_ignore_ratio:
				amount_origin = max(-unit_health+amount_origin,0);
			
				unit_health -= amount;
				unit_damage_id[|i] = noone;
				_damaged = true;
				break;
		}
		
		if(_damaged && amount > 0)
		{
			var _dir = random_range(0, 360);
			var _len = random_range(16, 64);
			var _lengthdirx = x + lengthdir_x(_len, _dir);
			var _lengthdiry = y + lengthdir_y(_len, _dir);
		
			draw_notify(x, y, round(_prev-unit_health), Monopoly_R24, c_white, 1, 0, 0, c_black, 0.25, room_speed/5, room_speed,
			_lengthdirx ,_lengthdiry, noone);
		}
	}
	
	if(unit_health < 0)
	{
		unit_health = 0;
	}

	if(unit_health > 0)
	{
		if(_prev != unit_health)
		{
			unit_inAttack = room_speed;	
		}
	}


}
