///@description draw_fan(x,y,radius_inside,radius_outside,incidence_angle,rotation,density,color,alpha,outline,<rot>);
///@function draw_fan(x,y,radius_inside,radius_outside,incidence_angle,rotation,density,color,alpha,outline,<rot>);
function draw_fan() {

	///@param x
	///@param y
	///@param radius_inside
	///@param radius_outside
	///@param incidence_angle
	///@param rotation
	///@param density
	///@param color
	///@param alpha
	///@param outline
	///@param <rot>


	var arg0 = argument[0]; //x
	var arg1 = argument[1]; //y
	var arg2 = argument[2]; //radius_inside
	var arg3 = argument[3]; //radius_outside

	var mx = max(arg2,arg3);
	if(mx >= 2)
	{
		var arg4 = argument[4]; //incidence_angle
		var arg5 = argument[5]; //rotation
		var arg6 = argument[6]; //density
		var arg7 = argument[7]; //color
		var arg8 = argument[8]; //alpha
		var arg9 = argument[9]; //outline
		if(argument_count > 10)
		{
			var arg10 = argument[10]; //<rot>
		}

		//var alpha = draw_get_alpha();
		draw_set_color(arg7);
		draw_set_alpha(arg8);

		if(argument_count <= 10)
		{
			if(arg9 = false)
			{
				if(arg2 = 0)
				{
					draw_primitive_begin(pr_trianglelist);
					for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
					{
						draw_vertex(arg0+lengthdir_x(arg3,_v),arg1+lengthdir_y(arg3,_v));
						draw_vertex(arg0,arg1);
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg6),arg1+lengthdir_y(arg3,_v+arg6));
					}
					for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
					{
						draw_vertex(arg0,arg1);
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg6),arg1+lengthdir_y(arg3,_v+arg6));
						draw_vertex(arg0,arg1);
					}
					draw_primitive_end();
				}
				else
				{
					draw_primitive_begin(pr_trianglelist);
					for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
					{
						draw_vertex(arg0+lengthdir_x(arg3,_v),arg1+lengthdir_y(arg3,_v));
						draw_vertex(arg0+lengthdir_x(arg2,_v),arg1+lengthdir_y(arg2,_v));
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg6),arg1+lengthdir_y(arg3,_v+arg6));
					}
					for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
					{
						draw_vertex(arg0+lengthdir_x(arg2,_v),arg1+lengthdir_y(arg2,_v));
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg6),arg1+lengthdir_y(arg3,_v+arg6));
						draw_vertex(arg0+lengthdir_x(arg2,_v+arg6),arg1+lengthdir_y(arg2,_v+arg6));
					}
					draw_primitive_end();
				}
			}
			else
			{
				draw_primitive_begin(pr_linestrip);
				draw_vertex(arg0+lengthdir_x(arg2,arg5-arg4),arg1+lengthdir_y(arg2,arg5-arg4));
				for(var _v = arg5-arg4; _v <= arg5+arg4; _v += arg6)
				{
					draw_vertex(arg0+lengthdir_x(arg3,_v),arg1+lengthdir_y(arg3,_v));
				}
				draw_vertex(arg0+lengthdir_x(arg2,arg5+arg4),arg1+lengthdir_y(arg2,arg5+arg4));
				if(arg2 > 0)
				{
					for(var _v = arg5+arg4; _v >= arg5-arg4; _v -= arg6)
					{
						draw_vertex(arg0+lengthdir_x(arg2,_v),arg1+lengthdir_y(arg2,_v));
					}
				}
				draw_primitive_end();
			}
		}
		else
		{
			if(arg9 = false)
			{
				if(arg2 = 0)
				{
					draw_primitive_begin(pr_trianglelist);
					for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
					{
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg10),arg1+lengthdir_y(arg3,_v+arg10));
						draw_vertex(arg0,arg1);
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg6+arg10),arg1+lengthdir_y(arg3,_v+arg6+arg10));
					}
					for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
					{
						draw_vertex(arg0,arg1);
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg6+arg10),arg1+lengthdir_y(arg3,_v+arg6+arg10));
						draw_vertex(arg0,arg1);
					}
					draw_primitive_end();
				}
				else
				{
					draw_primitive_begin(pr_trianglelist);
					for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
					{
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg10),arg1+lengthdir_y(arg3,_v+arg10));
						draw_vertex(arg0+lengthdir_x(arg2,_v+arg10),arg1+lengthdir_y(arg2,_v+arg10));
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg6+arg10),arg1+lengthdir_y(arg3,_v+arg6+arg10));
					}
					for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
					{
						draw_vertex(arg0+lengthdir_x(arg2,_v+arg10),arg1+lengthdir_y(arg2,_v+arg10));
						draw_vertex(arg0+lengthdir_x(arg3,_v+arg6+arg10),arg1+lengthdir_y(arg3,_v+arg6+arg10));
						draw_vertex(arg0+lengthdir_x(arg2,_v+arg6+arg10),arg1+lengthdir_y(arg2,_v+arg6+arg10));
					}
					draw_primitive_end();
				}
			}
			else
			{
				draw_primitive_begin(pr_linestrip);
				draw_vertex(arg0+lengthdir_x(arg2,arg5-arg4+arg10),arg1+lengthdir_y(arg2,arg5-arg4+arg10));
				for(var _v = arg5-arg4; _v <= arg5+arg4; _v += arg6)
				{
					draw_vertex(arg0+lengthdir_x(arg3,_v+arg10),arg1+lengthdir_y(arg3,_v+arg10));
				}
				draw_vertex(arg0+lengthdir_x(arg2,arg5+arg4+arg10),arg1+lengthdir_y(arg2,arg5+arg4+arg10));
				if(arg2 > 0)
				{
					for(var _v = arg5+arg4; _v >= arg5-arg4; _v -= arg6)
					{
						draw_vertex(arg0+lengthdir_x(arg2,_v+arg10),arg1+lengthdir_y(arg2,_v+arg10));
					}
				}
				draw_primitive_end();
			}
		}
	}


}
