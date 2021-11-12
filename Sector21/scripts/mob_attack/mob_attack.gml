function mob_attack() {
	if(unit_attack_delay > 0)
	{
		unit_attack_delay -= global.d_time;	
	}
	else
	{
		draw_effect_bloom(x,y,x,y,18,[calc_attack_length*0.975,calc_attack_length],[calc_attack_length,calc_attack_length*1.025],color,color,1,0,step);
	
		var _ins;
		unit_attack_delay = calc_attack_speed*room_speed;
	
		switch(unit_skill_id)
		{
			default:
				break;
			
			case enemy.effect_destroy_projectTile:
				collision_circle_list(x,y,calc_attack_length,Game_ProjectTile,true,false,unit_collision,true);
				_ins = noone;
				for(var i = 0; i < ds_list_size(unit_collision); i++)
				{
					_ins = unit_collision[|i];
					if(!_ins.unit_death)
					{
						_ins.unit_death = true;
					}
				}
				ds_list_clear(unit_collision);
				break;
		
			case enemy.effect_heal:
				collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
				_ins = noone;
				for(var i = 0; i < ds_list_size(unit_collision); i++)
				{
					_ins = unit_collision[|i];
					if(!_ins.unit_death)
					{
						_ins = projectTile_fire(x,y,0,_ins,density,rotate,[0,range[0]*0.5],color,0,0,unit_speed_max*10,unit_speed_accel*10);
						projectTile_effect(_ins,effect.health_heal,unit_skill_amount,unit_skill_length*room_speed,id);
					}
				}
				ds_list_clear(unit_collision);
				break;
			
			case enemy.effect_defense_up:
				collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
				_ins = noone;
				for(var i = 0; i < ds_list_size(unit_collision); i++)
				{
					_ins = unit_collision[|i];
					if(!_ins.unit_death)
					{
						_ins = projectTile_fire(x,y,0,_ins,density,rotate,[0,range[0]*0.5],color,0,0,unit_speed_max*10,unit_speed_accel*10);
						projectTile_effect(_ins,effect.ratio_recive_decrease,unit_skill_amount,unit_skill_length*room_speed,id);
					}
				}
				ds_list_clear(unit_collision);
				break;
		
			case enemy.effect_speed_up:
				collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
				_ins = noone;
				for(var i = 0; i < ds_list_size(unit_collision); i++)
				{
					_ins = unit_collision[|i];
					if(!_ins.unit_death)
					{
						_ins = projectTile_fire(x,y,0,_ins,density,rotate,[0,range[0]*0.5],color,0,0,unit_speed_max*10,unit_speed_accel*10);
						projectTile_effect(_ins,effect.movement_speed_increase,unit_skill_amount,unit_skill_length*room_speed,id);
					}
				}
				ds_list_clear(unit_collision);
				break;
		}
	}




}
