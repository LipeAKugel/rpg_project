/// @description

// Set image direction.
if veloc_dir >= 90 && veloc_dir <= 270 {
	image_xscale = -1;
} else {
	image_xscale = 1;
}

if hit {
	gpu_set_fog(true,c_white,0,0);
}

// Draw shadow and itself.
draw_sprite(spr_small_shadow,0,x,y+1);
draw_self();


gpu_set_fog(false,c_white,0,0);


