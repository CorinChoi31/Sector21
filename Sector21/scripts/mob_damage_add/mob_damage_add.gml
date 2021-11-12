///@function mob_damage(instance,id,amount)
function mob_damage_add(argument0, argument1, argument2) {

	///@param instance,id,amount

	with(argument0)
	{
		ds_list_add(unit_damage_id,argument1);
		ds_list_add(unit_damage_amount,argument2);
		ds_list_add(unit_damage_amount_origin,argument2);
	}


}
