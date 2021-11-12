draw_fan(x,y,range[0],range[1],180,0,density,color,alpha,false,direction+rotate);

if(unit_inAttack > 0)
{
	var _hratio = (unit_health_soft/calc_health_max);
	
	draw_set_color(c_white);
	draw_set_alpha(unit_inAttack/(room_speed/2));
	draw_pr_rectangle(x-range[1]*_hratio,y-range[1]*1.25,x+range[1]*_hratio,y-range[1],false);
	draw_set_alpha(unit_inAttack/(room_speed/2)*0.5);
	draw_pr_rectangle(x-range[1],y-range[1]*1.25,x+range[1],y-range[1],true);
}

/*
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(Monopoly_R16);
draw_text(x,y+range[1],unit_attack_delay);
*/