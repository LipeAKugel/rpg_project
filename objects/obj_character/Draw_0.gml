/// @description

if hit {
	gpu_set_fog(true,c_red,0,0);
}

// Draw shadow and itself.
draw_sprite(spr_shadow,0,x,y+4);
draw_self();


gpu_set_fog(false,c_red,0,0);


