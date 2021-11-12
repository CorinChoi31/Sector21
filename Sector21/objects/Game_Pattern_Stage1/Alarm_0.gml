if(variable_instance_exists(target_instance,"game_enemy_list"))
{
	//--> [wave, direction, id, amount]
	var _t = 0;
	var _t1, _t2, _t3, _t4;
	
	for(var i = 0; i < 10; i++)
	{
		ds_list_add(target_instance.game_enemy_list,[i, 0, choose(100,200,300,400), 20]);
	}
	
	for(var i = 10; i < 20; i++)
	{
		_t1 = choose(100,200,300,400);
		_t2 = choose(100,110,200,300,400);
		
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 5]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 5]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 5]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 5]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 5]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 5]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 5]);
	}
	
	for(var i = 20; i < 40; i++)
	{
		_t1 = choose(100,200,300,400);
		_t2 = choose(100,110,200,300,400);
		
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 15]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 15]);
		ds_list_add(target_instance.game_enemy_list,[i, -1, _t1+5, 1]);
		ds_list_add(target_instance.game_enemy_list,[i, 1, _t2+5, 1]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 10]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 10]);
	}
	
	for(var i = 40; i < 60; i++)
	{
		_t1 = choose(100,110,200,300,400);
		_t2 = choose(100,110,200,300,400);
		
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 20]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 20]);
		ds_list_add(target_instance.game_enemy_list,[i, -1, _t1+5, 2]);
		ds_list_add(target_instance.game_enemy_list,[i, 1, _t2+5, 2]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 10]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 10]);
	}
	
	for(var i = 60; i < 80; i++)
	{
		_t1 = choose(100,200,300,400);
		_t2 = choose(100,110,200,300,400);
		_t3 = choose(100,110,200,300,400);
		
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 15]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 20]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t3, 20]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1+5, 2]);
		ds_list_add(target_instance.game_enemy_list,[i, 1, _t2+5, 3]);
		ds_list_add(target_instance.game_enemy_list,[i, -1, _t3+5, 3]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 10]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 10]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t3, 10]);
	}
	
	for(var i = 80; i < 100; i++)
	{
		_t1 = choose(100,200,300,400);
		_t2 = choose(100,200,300,400);
		_t3 = choose(100,110,200,300,400);
		_t4 = choose(100,110,200,300,400);
		
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 15]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 15]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t3, 20]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t4, 20]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1+5, 2]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2+5, 2]);
		ds_list_add(target_instance.game_enemy_list,[i, 1, _t3+5, 3]);
		ds_list_add(target_instance.game_enemy_list,[i, -1, _t4+5, 3]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t1, 15]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t2, 15]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t3, 15]);
		ds_list_add(target_instance.game_enemy_list,[i, 0, _t4, 15]);
	}
}

instance_destroy();