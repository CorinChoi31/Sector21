///@function series(value,count)
function series(argument0, argument1) {

	///@param value
	///@param count

	var _return = 0;
	var _count = 0;

	for(var i = 0; i < argument1; i++)
	{
		_count += i;	
	}

	for(var j = 0; j < _count; j++)
	{
		_return += argument0;
	}

	return _return;


}
