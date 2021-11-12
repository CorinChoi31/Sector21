function mob_damage() {
	var _id, amount, amount_origin;

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
				if(unit_health < 0)
				{
					unit_health = 0;
				}
			
				unit_damage_id[|i] = noone;
				break;
		
			case damage.dealt_ignore_ratio:
				amount_origin = max(-unit_health+amount_origin,0);
			
				unit_health -= amount;
				if(unit_health < 0)
				{
					unit_health = 0;
				}
			
				unit_damage_id[|i] = noone;
				break
		}
	}

	if(unit_health > 0)
	{
		if(_prev != unit_health)
		{
			unit_inAttack = room_speed;	
		}
	}


}
