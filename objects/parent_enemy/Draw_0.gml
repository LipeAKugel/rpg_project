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
draw_sprite(shadow,0,x,y+1);
draw_self();

gpu_set_fog(false,c_white,0,0);

// Draw health bar.
if health_bar_alarm > 0 {
	draw_sprite_ext(spr_inimigo_hud_vida,0,x,y-8,1,1,0,c_white,1);
	draw_sprite_ext(spr_inimigo_barra_vida,0,x-5,y-8,hp/max_hp,1,0,c_white,1);
	health_bar_alarm -= 1;
}