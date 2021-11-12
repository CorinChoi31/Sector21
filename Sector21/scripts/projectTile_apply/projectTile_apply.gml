function projectTile_apply(argument0) {
	var _ins = argument0;

	switch(unit_id)
	{
		default:
			mob_damage_add(_ins,0,unit_attack_amount);
		
			for(var i = ds_list_size(unit_effect_id)-1; i >= 0; i--)
			{
				mob_effect_add(_ins,unit_effect_id[|i],unit_effect_amount[|i],unit_effect_tick[|i],unit_effect_sender[|i]);
			}
			break;
	}

	if(unit_attack_range = 0)
	{
		draw_effect_bloom(x,y,x,y,density,range,[range[0]*2,range[1]*2],color,color,1,0,step,direction);
	}
	else
	{
		draw_effect_bloom(x,y,x,y,density,range,[unit_attack_range*0.875,unit_attack_range],color,color,1,0,step,direction);
	}


}
