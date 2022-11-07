if(back_color != noone)
{
	draw_set_color(back_color); draw_set_alpha(back_alpha);
	//gpu_set_blendmode(bm_max);
	if(back_width > 0 && back_height > 0)
	{
		draw_rectangle(x-back_width,y-back_height,x+back_width,y+back_height,false);
	}
	//gpu_set_blendmode(bm_normal);
}

draw_set_color(text_color); draw_set_alpha(text_alpha);
draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_set_font(text_font);
draw_text(x,y,text);