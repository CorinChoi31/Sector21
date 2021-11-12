function tower_attack() {
	switch(unit_id)
	{
		default:
		#region
			if(unit_attack_target = noone)
			{
				collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
	
				var _ins = noone;
				for(var i = 0; i < ds_list_size(unit_collision); i++)
				{
					_ins = unit_collision[|i];
					if(!_ins.unit_death)
					{
						unit_attack_target = _ins;
						break;
					}
				}
	
				ds_list_clear(unit_collision);
			}
			else
			{
				if(instance_exists(unit_attack_target))
				{
					if(unit_attack_target.unit_death or point_distance(x,y,unit_attack_target.x,unit_attack_target.y) < calc_attack_length*1.25)
					{
						unit_attack_target = noone;
					}
				}
				else
				{
					unit_attack_target = noone;	
				}
			}
		#endregion
			break;
		case 4:
		#region
			if(unit_attack_target = noone)
			{
				collision_circle_list(x,y,unit_attack_length,Game_Tower,true,true,unit_collision,true);
			
				var _ins = noone;
				for(var i = 0; i < ds_list_size(unit_collision); i++)
				{
					_ins = unit_collision[|i];
					if(!_ins.unit_death)
					{
						unit_attack_target = _ins;
						break;
					}
				}
	
				ds_list_clear(unit_collision);
			}
			else
			{
				if(instance_exists(unit_attack_target))
				{
					if(unit_attack_target.unit_death)
					{
						unit_attack_target = noone;
					}
				}
				else
				{
					unit_attack_target = noone;	
				}
			}
		#endregion
			break;
	}

	if(unit_attack_delay > 0)
	{
		unit_attack_delay -= global.d_time;	
	}
	else
	{
		var _ins;
		if(unit_attack_target != noone)
		{
			unit_attack_delay = calc_attack_speed*room_speed;
			switch(unit_id)
			{
				case 0:
				#region 5 Types
					switch(unit_type)
					{
						default:
						case 0:
						case 1:
							_ins = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
							if(calc_attack_ignore > 0)
							{
								projectTile_effect(_ins,effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
							}
							break;
						case 2:
							_ins = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
							if(calc_attack_ignore > 0)
							{
								projectTile_effect(_ins,effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
							}
							collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
						
							var _ntarget = noone;
							var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death and _ins.id != unit_attack_target)
								{
									_ntarget = _ins;
									break;
								}
							}
						
							ds_list_clear(unit_collision);
						
							if(_ntarget != noone)
							{
								_ins = projectTile_fire(x,y-y_pos,0,_ntarget,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
								if(calc_attack_ignore > 0)
								{
									projectTile_effect(_ins,effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
								}
							}
							break;
						case 3:
							_ins[0] = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
							_ins[1] = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity*0.75);
							_ins[2] = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity*0.5);
							if(calc_attack_ignore > 0)
							{
								projectTile_effect(_ins[0],effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
								projectTile_effect(_ins[1],effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
								projectTile_effect(_ins[2],effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
							}
							break;
						case 4:
							_ins[0] = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
							_ins[1] = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity*0.75);
							_ins[2] = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity*0.5);
							if(calc_attack_ignore > 0)
							{
								projectTile_effect(_ins[0],effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
								projectTile_effect(_ins[1],effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
								projectTile_effect(_ins[2],effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
							}
						
							collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
						
							var _ntarget = noone;
							var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death and _ins.id != unit_attack_target)
								{
									_ntarget = _ins;
									break;
								}
							}
	
							ds_list_clear(unit_collision);
						
							if(_ntarget != noone)
							{
								_ins[0] = projectTile_fire(x,y-y_pos,0,_ntarget,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
								_ins[1] = projectTile_fire(x,y-y_pos,0,_ntarget,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity*0.75);
								_ins[2] = projectTile_fire(x,y-y_pos,0,_ntarget,density,rotate,[0,range[0]*0.5],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity*0.5);
								if(calc_attack_ignore > 0)
								{
									projectTile_effect(_ins[0],effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
									projectTile_effect(_ins[1],effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
									projectTile_effect(_ins[2],effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
								}
							}
							break;
					}
				#endregion
					break;
				case 1:
				#region 3 Types
					switch(unit_type)
					{
						default:
						case 0:
						case 1:
							_ins = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[range[0]*0.75,range[0]],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
							if(calc_attack_ignore > 0)
							{
								projectTile_effect(_ins,effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
							}
							break;
						case 2:
							_ins = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[range[0]*0.75,range[0]],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
							if(calc_attack_ignore > 0)
							{
								projectTile_effect(_ins,effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
							}
						
							collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
							var _ntarget = noone;
							var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death and _ins.id != unit_attack_target)
								{
									_ntarget = _ins;
									break;
								}
							}
							ds_list_clear(unit_collision);
						
							if(_ntarget != noone)
							{
								_ins = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[range[0]*0.75,range[0]],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
								if(calc_attack_ignore > 0)
								{
									projectTile_effect(_ins,effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
								}
							}
							break;
					}
				#endregion
					break;
				case 2:
				#region 5 Types
					switch(unit_type)
					{
						default:
						case 0:
							draw_effect_bloom(x,y,x,y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1.125,global.grid_length*1.25],c_white,color,1,0,room_speed/4);
						
							collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
							var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death)
								{
									with(_ins)
									{
										mob_effect_add(id,effect.ratio_recive_increase,other.calc_attack_amount,other.calc_attack_speed,other.id);
										draw_effect_bloom(x,y,x,y,density,[0,0],range,c_white,other.color,1,0,room_speed/4,direction);
									}
								}
							}
							ds_list_clear(unit_collision);
							break;
						case 1:
							draw_effect_bloom(x,y,x,y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1.125,global.grid_length*1.25],c_white,color,1,0,room_speed/4);
						
							collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
							var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death)
								{
									with(_ins)
									{
										mob_effect_add(id,effect.damage_dealt_ignore_ratio,other.calc_attack_amount,other.calc_attack_speed,other.id);
										draw_effect_bloom(x,y,x,y,density,[0,0],range,c_white,other.color,1,0,room_speed/4,direction);
									}
								}
							}
							ds_list_clear(unit_collision);
							break;
						case 2:
							draw_effect_bloom(x,y,x,y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1.125,global.grid_length*1.25],c_white,color,1,0,room_speed/4);
						
							collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
							var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death)
								{
									with(_ins)
									{
										mob_effect_add(id,effect.clear_increase,other.calc_attack_amount,other.calc_attack_speed,other.id);
										draw_effect_bloom(x,y,x,y,density,[0,0],range,c_white,other.color,1,0,room_speed/4,direction);
									}
								}
							}
							ds_list_clear(unit_collision);
							break;
						case 3:
							collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
							var _run = false; var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death)
								{
									with(_ins)
									{
										if(calc_speed_max < unit_speed_max or ds_list_find_index(unit_effect_id, effect.movement_stun) != -1)
										{
											mob_effect_add(id,effect.clear_increase,other.calc_attack_amount,other.calc_attack_speed,other.id);
											draw_effect_bloom(x,y,x,y,density,[0,0],range,c_white,other.color,1,0,room_speed/4,direction);
										
											_run = true;
										}
									}
								}
							}
							ds_list_clear(unit_collision);
						
							if(!_run)
							{
								unit_attack_delay = 0;
							}
							else
							{
								draw_effect_bloom(x,y,x,y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1.125,global.grid_length*1.25],c_white,color,1,0,room_speed/4);	
							}
							break;
						case 4:
							_ins = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[range[0]*0.75,range[0]],color,0,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
							projectTile_effect(_ins,effect.ratio_recive_increase,calc_attack_amount,calc_attack_speed,id);
							break;
					}
				#endregion
					break;
				case 3:
				#region 4 Types
					switch(unit_type)
					{
						default:
						case 0:
							_ins = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[range[0]*0.75,range[0]],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
							projectTile_effect(_ins,effect.movement_speed_decrease_soft,(0.25+0.1*unit_upgraded),calc_attack_speed*room_speed+room_speed/2,id);
							if(calc_attack_ignore > 0)
							{
								projectTile_effect(_ins,effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
							}
							break;
						case 1:
							_ins = projectTile_fire(x,y-y_pos,0,unit_attack_target,density,rotate,[range[0]*0.75,range[0]],color,calc_attack_amount,calc_attack_range,calc_attack_velocity,calc_attack_velocity);
							projectTile_effect(_ins,effect.movement_stun,0,room_speed*(0.125+0.125*unit_upgraded),id);
							if(calc_attack_ignore > 0)
							{
								projectTile_effect(_ins,effect.damage_dealt_ignore_ratio,calc_attack_amount*calc_attack_ignore,1,id);
							}
							break;
						case 2:
							draw_effect_bloom(x,y,x,y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1.125,global.grid_length*1.25],c_white,color,1,0,room_speed/4);
						
							collision_circle_list(x,y,calc_attack_length,Game_Mob,true,false,unit_collision,true);
							var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death)
								{
									with(_ins)
									{
										mob_damage_add(id,damage.dealt,other.calc_attack_amount);
										if(other.calc_attack_ignore > 0)
										{
											mob_damage_add(id,damage.dealt_ignore_ratio,other.calc_attack_ignore*other.calc_attack_amount);
										}
									
										mob_effect_add(id,effect.movement_speed_decrease,(0.2+0.05*other.unit_upgraded),other.calc_attack_speed*room_speed,other.id);
										draw_effect_bloom(x,y,x,y,density,[0,0],range,c_white,other.color,1,0,room_speed/4,direction);
									}
								}
							}
							ds_list_clear(unit_collision);
							break;
						case 3:
							draw_effect_bloom(x,y,x,y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1.125,global.grid_length*1.25],c_white,color,1,0,room_speed/4);
						
							collision_circle_list(x,y,calc_attack_range,Game_Mob,true,false,unit_collision,true);
							var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death)
								{
									with(_ins)
									{
										mob_damage_add(id,damage.dealt,other.calc_attack_amount);
										if(other.calc_attack_ignore > 0)
										{
											mob_damage_add(id,damage.dealt_ignore_ratio,other.calc_attack_ignore*other.calc_attack_amount);
										}
									
										mob_effect_add(id,effect.movement_stun,0,room_speed*(1.75+0.25*other.unit_upgraded),other.id);
										draw_effect_bloom(x,y,x,y,density,[0,0],range,c_white,other.color,1,0,room_speed/4,direction);
									}
								}
							}
							ds_list_clear(unit_collision);
							break;
					}
				#endregion
					break;
				case 4:
				#region 5 Types
					unit_attack_delay = unit_attack_speed*room_speed;
				
					var _id = noone;
					switch(unit_type)
					{
						default:
						case 0:
							_id = [effect.attack_amount_increase, noone];
							break;
						case 1:
							_id = [effect.attack_speed_increase, effect.attack_length_increase];
							break;
						case 2:
							_id = [effect.attack_range_increase, effect.attack_velocity_increase];
							break;
						case 3:
							_id = [effect.attack_ignore_ratio, noone];
							break;
						case 4:
							_id = noone;
							break;
					}
				
					if(unit_type == 4)
					{
						draw_effect_bloom(x,y,x,y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1.125,global.grid_length*1.25],c_white,color,1,0,room_speed/4);
					
						var _damage = 0;
						collision_circle_list(x,y,unit_attack_length,Game_Mob,true,true,unit_collision,true);
						var _ins = noone;
						for(var i = 0; i < ds_list_size(unit_collision); i++)
						{
							_ins = unit_collision[|i];
							if(!_ins.unit_death)
							{
								with(_ins)
								{
									draw_effect_bloom(x,y,x,y,density,[0,0],range,c_white,other.color,1,0,room_speed/4,direction);
									_damage += unit_attack_amount;
								}
							}
						}
						ds_list_clear(unit_collision);
					
						_damage = _damage*other.unit_attack_amount;
					
						collision_circle_list(x,y,unit_attack_length,Game_Tower,true,true,unit_collision,true);
						var _ins = noone;
						for(var i = 0; i < ds_list_size(unit_collision); i++)
						{
							_ins = unit_collision[|i];
							if(!_ins.unit_death)
							{
								with(_ins)
								{
									if(unit_id != 4)
									{
										tower_effect_add(id,effect.attack_amount_increase_constant,_damage,other.unit_attack_speed*room_speed,other.id);
										draw_effect_bloom(x,y-y_pos,x,y-y_pos,density,[0,0],[range[0]*1.75,range[0]*2],c_white,other.color,1,0,room_speed/4,rotate);
									}
								}
							}
						}
						ds_list_clear(unit_collision);
					}
					else
					{
						if(is_array(_id))
						{
							draw_effect_bloom(x,y,x,y,60,[global.grid_length*0.5,global.grid_length*0.75],[global.grid_length*1.125,global.grid_length*1.25],c_white,color,1,0,room_speed/4);
						
							collision_circle_list(x,y,unit_attack_length,Game_Tower,true,true,unit_collision,true);
							var _ins = noone;
							for(var i = 0; i < ds_list_size(unit_collision); i++)
							{
								_ins = unit_collision[|i];
								if(!_ins.unit_death)
								{
									with(_ins)
									{
										if(unit_id != 4)
										{
											tower_effect_add(id,_id[0],other.unit_attack_amount,other.unit_attack_speed*room_speed,other.id);
											if(other.unit_upgraded >= 3)
											{
												tower_effect_add(id,_id[1],other.unit_attack_amount/(7-other.unit_upgraded),other.unit_attack_speed*room_speed,other.id);
											}
											draw_effect_bloom(x,y-y_pos,x,y-y_pos,density,[0,0],[range[0]*1.75,range[0]*2],c_white,other.color,1,0,room_speed/4,rotate);
										}
									}
								}
							}
							ds_list_clear(unit_collision);
						}
					}
				#endregion
					break;
			}
		}
	}


}
