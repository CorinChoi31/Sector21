/// @function draw_rectangle_vertex(x1, y1, x2, y2, color, color, color, color, alpha, alpha, alpha, alpha, outline)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param color
/// @param color
/// @param color
/// @param color
/// @param alpha
/// @param alpha
/// @param alpha
/// @param alpha
/// @param outline

function draw_rectangle_vertex(_x1, _y1, _x2, _y2, _c1, _c2, _c3, _c4, _a1, _a2, _a3, _a4, _outline)
{
	if(_outline)
	{
		draw_primitive_begin(pr_linestrip);
			draw_vertex_color(_x1, _y1, _c1, _a1);
			draw_vertex_color(_x2, _y1, _c2, _a2);
			draw_vertex_color(_x2, _y2, _c3, _a3);
			draw_vertex_color(_x1, _y2, _c4, _a4);
			draw_vertex_color(_x1, _y1, _c1, _a1);
		draw_primitive_end();
	}
	else
	{
		draw_primitive_begin(pr_trianglestrip);
			draw_vertex_color(_x1, _y1, _c1, _a1);
			draw_vertex_color(_x1, _y2, _c4, _a4);
			draw_vertex_color(_x2, _y1, _c2, _a2);
			draw_vertex_color(_x2, _y2, _c3, _a3);
		draw_primitive_end();
	}
}