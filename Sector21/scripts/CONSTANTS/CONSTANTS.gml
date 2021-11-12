function CONSTANTS() {
#region
	enum menu
	{
		load,
		logo,
	
		title,
	
		play_map,
		play_tech,
	
		set,
	
		game,
	}

	enum enemy
	{
		effect_destroy_projectTile,
	
		effect_heal,
		effect_defense_up,
		effect_speed_up,
	}

	enum effect
	{
		clear_increase,
	
		clear_decrease,
		clear_disturb,
	
		//----------//
	
		attack_amount_increase_constant,
	
		//----------//
	
		health_heal,
		health_regeneration,
	
		attack_amount_increase,
		attack_speed_increase,
		attack_range_increase,
		attack_length_increase,
		attack_velocity_increase,
	
		movement_speed_increase,
		movement_speed_increase_soft,
	
		ratio_send_increase,
		ratio_recive_increase,
	
		attack_amount_decrease,
		attack_speed_decrease,
		attack_range_decrease,
		attack_length_decrease,
		attack_velocity_decrease,
	
		movement_speed_decrease,
		movement_speed_decrease_soft,
	
		ratio_send_decrease,
		ratio_recive_decrease,
	
		//----------//
	
		attack_ignore_ratio,
	
		movement_stun,
	
		damage_dealt,
		damage_dealt_ignore_ratio,
	}

	enum damage
	{
		dealt = 0,
		dealt_ignore_ratio,
	}
#endregion

#region
#macro ROOMSPEED_D2 room_speed/2
#macro ROOMSPEED_D3 room_speed/3
#macro ROOMSPEED_D4 room_speed/4
#macro ROOMSPEED_D5 room_speed/5
#macro ROOMSPEED_D6 room_speed/6
#macro ROOMSPEED_D8 room_speed/8
#macro ROOMSPEED_D10 room_speed/10
#macro ROOMSPEED_D15 room_speed/15

#macro WIDTH room_width
#macro WIDTH_2 room_width/2
#macro WIDTH_4 room_width/4
#macro WIDTH_8 room_width/8
#macro WIDTH_16 room_width/16
#macro WIDTH_32 room_width/32
#macro WIDTH_64 room_width/64

#macro HEIGHT room_height
#macro HEIGHT_2 room_height/2
#macro HEIGHT_4 room_height/4
#macro HEIGHT_8 room_height/8
#macro HEIGHT_16 room_height/16
#macro HEIGHT_32 room_height/32
#macro HEIGHT_64 room_height/64
#endregion


}
