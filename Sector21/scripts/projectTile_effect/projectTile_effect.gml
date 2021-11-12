///@function mob_effect_add(instance, id, amount, tick ,sender)
function projectTile_effect(argument0, argument1, argument2, argument3, argument4) {

	///@param instance,id,amount,tick,sender

	with(argument0)
	{
		ds_list_add(unit_effect_id,argument1);
		ds_list_add(unit_effect_amount,argument2);
		ds_list_add(unit_effect_tick,argument3);
		ds_list_add(unit_effect_sender,argument4);
	}


}
