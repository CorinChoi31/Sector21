draw_circle_vertex(x, y, 180, density/2, unit_size, unit_size*0.2, color, alpha, 0, false);
draw_circle_vertex(x, y, 180, density/2, unit_size, unit_size*0.2, color, alpha*0.5, 180, false);

draw_set_alpha(1);
/*
draw_circle_vertex(x, y, 360, density, 8, 8, color, alpha, 0, false);
for(var _i = ds_list_size(targets) - 1; _i >= 0; _i--)
{
	draw_line_width(x, y, targets[| _i].x, targets[| _i].y, 2);
	draw_circle_vertex(targets[| _i].x, targets[| _i].y, 360, density, 4, 4, color, alpha, 0, false);
}
*/

//draw_circle_vertex(x, y, 360, 60, 64 * unit_attack_range, 4, color, alpha, 0, false);