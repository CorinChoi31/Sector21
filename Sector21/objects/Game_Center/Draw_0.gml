draw_fan(x,y,range[0],range[0]*1.25,180,0,20,c_white,alpha*0.75,false);
draw_fan(x,y,range[1]*0.9,range[1],180,0,18,color,alpha*0.75,false);

draw_set_color(c_white); draw_set_alpha(alpha*0.75);
draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_set_font(GodoM_R48);
draw_text(x,y,round(Game.game_cost_soft));

draw_set_alpha(alpha*0.25);
draw_set_valign(fa_top);
draw_set_font(Monopoly_R16);
draw_text(x,y+24,"COST");