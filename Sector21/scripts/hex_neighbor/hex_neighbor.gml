///@function hex_neighbor(grid, radius, q, r)
///@param grid
///@param grid_rad
///@param q
///@param r
function hex_neighbor(argument0, argument1, argument2, argument3) {

	var _grid = argument0;
	var _grid_rad = argument1;
	var _q = _grid_rad+argument2;
	var _r = _grid_rad+argument3;

	var _result = undefined; var _index = 0;
	var _neighbor = [[1,0],[1,-1],[0,-1],[-1,0],[-1,1],[0,1]];
	var _crray = noone;

	var _w = ds_grid_width(_grid);
	var _h = ds_grid_height(_grid);

	for(var k = 0; k < 6; k++)
	{
		_crray = _neighbor[k];
		if(_q+_crray[0] >= 0 and _q+_crray[0] < _w and _r+_crray[1] >= 0 and _r+_crray[1] < _h)
		{
			if(_grid[# _q+_crray[0],_r+_crray[1]] > 0)
			{
				_result[_index] = [_q+_crray[0]-_grid_rad,_r+_crray[1]-_grid_rad];
				_index++;
			}
		}
	}

	return _result;


}
