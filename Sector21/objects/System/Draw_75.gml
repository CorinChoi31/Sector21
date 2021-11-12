draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

/*
draw_set_font(GodoM_R16);
draw_text(16,16,fps_real);
draw_text(16,32,global.menu.menu_alpha[0]);
*/

if(global.glitch > 0)
{
	var _r = global.glitch*4;
	var _a = global.glitch*1;
	
	draw_surface_ext(application_surface,random_range(-_r,_r),random_range(-_r,_r),1,1,0,c_white,_a);
	
	_r = global.glitch*16;
	_a = global.glitch*0.75;
	
	gpu_set_blendmode(bm_add);
	
	draw_surface_ext(application_surface,random_range(-_r,_r),0,1,1,0,c_red,_a);
	draw_surface_ext(application_surface,random_range(-_r,_r),0,1,1,0,c_green,_a);
	draw_surface_ext(application_surface,random_range(-_r,_r),0,1,1,0,c_blue,_a);
	gpu_set_blendmode(bm_normal);
}