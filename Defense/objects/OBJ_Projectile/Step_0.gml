if(destroy)
{
	alpha = lerp(alpha, 0, 0.1 * global.seq_fpsc);
	range = lerp(range, range_end, 0.5 * global.seq_fpsc);
	
	if(alpha < 0.01)
	{
		instance_destroy(self);	
	}
}
else
{
	if(target != undefined and instance_exists(target) and !target.destroy)
	{
		target_x = target.x;
		target_y = target.y;
		target_range = target.range;
	}
	else
	{
		target = undefined;
	}
	
	alpha = lerp(alpha, 1, 0.125 * global.seq_fpsc);
	unit_velocity = median(0, unit_velocity + unit_acceleration*global.seq_time, unit_velocity_max);
	
	unit_direction = point_direction(x, y, target_x, target_y);
	var _pdir = degtorad(unit_direction);
	x += min(abs(target_x - x), unit_velocity*abs(cos(_pdir))*global.seq_time)*sign(target_x - x);
	y += min(abs(target_y - y), unit_velocity*abs(sin(_pdir))*global.seq_time)*sign(target_y - y);
	
	if(point_distance(x, y, target_x, target_y) - target_range <= range/2)
	{
		destroy = true;
		range_end = range*2;
		
		if(target != undefined and (chain > 0 or chain < 0))
		{
			ds_list_add(targets, target);
			
			var _array = [];
			var _index = 0;
			var _size = 0;
			with(OBJ_Enemy)
			{
				if(!destroy)
				{
					var _distance = point_distance(x, y, other.x, other.y) - range;
					//if(_distance <= other.range)
					{
						if(ds_list_find_index(other.targets, id) == -1)
						{
							array_push(_array, [id, _distance]); //random_range(0, 1000)
						}
					}
				}
			}
			
			if(array_length(_array) > 0)
			{
				var _compare = function(i, j)
				{
					return i[1] - j[1];
				}
				array_sort(_array, _compare);
			
				var _ins = instance_create_layer(x, y, Layer_Game_Interface, OBJ_Projectile);
				_ins.chain = chain - 1;
				_ins.target = _array[_index][0];
				_ins.alpha = alpha;
			
				_ins.range = range*0.9;
			
				_ins.unit_velocity = unit_velocity;
				_ins.unit_velocity_max = unit_velocity_max;
				_ins.unit_acceleration = unit_acceleration;
			
				var _index = 0;
				repeat(ds_list_size(targets))
				{
					ds_list_add(_ins.targets, targets[| _index]);
					_index += 1;
				}
			}
		}
	}
}