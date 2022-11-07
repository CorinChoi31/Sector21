gpu_set_blendmode(bm_add);
//draw_set_alpha(alpha*0.25);
//draw_sprite(particle_sphere,0,x,y);

draw_fan(x,y,range[0],range[1],180,0,density,color,alpha,false,direction,rotate);
gpu_set_blendmode(bm_normal);