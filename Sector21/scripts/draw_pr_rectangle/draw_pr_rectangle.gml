///@function draw_pr_rectangle(x1, y1, x2, y2, outline)
function draw_pr_rectangle(argument0, argument1, argument2, argument3, argument4) {

	///@param x1
	///@param y1
	///@param x2
	///@param y2
	///@param outline

	if(argument4)
	{
		draw_primitive_begin(pr_linestrip);
		draw_vertex(argument0,argument1);
		draw_vertex(argument2,argument1);
		draw_vertex(argument2,argument3);
		draw_vertex(argument0,argument3);
		draw_vertex(argument0,argument1);
		draw_primitive_end();
	}
	else
	{
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex(argument0,argument1);
		draw_vertex(argument2,argument1);
		draw_vertex(argument0,argument3);
		draw_vertex(argument2,argument3);
		draw_primitive_end();
	}


}
