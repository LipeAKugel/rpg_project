// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_character_walk(){
	
	// Movement and Collision
	up = keyboard_check(vk_up);
	down = keyboard_check(vk_down);
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);

	// Get the movement direction.
	hveloc = (right - left);
	vveloc = (down - up);
	
	veloc_dir = point_direction(x,y,x+hveloc,y+vveloc);
	
	// Set the horizontal or vertical velocity if the player isn't idle.
	if hveloc != 0 || vveloc != 0 {
		hveloc = lengthdir_x(veloc, veloc_dir);
		vveloc = lengthdir_y(veloc, veloc_dir);
	}
	
	// Check for collision.
	scr_check_collision();

	x += hveloc;

	y += vveloc;

	// Rotation
	switch dir {
		case 0:
			sprite_index = spr_personagem_parado_direita;
			break;
		case 1:
			sprite_index = spr_personagem_parado_cima;
			break;
		case 2:
			sprite_index = spr_personagem_parado_esquerda;
			break;
		case 3:
			sprite_index = spr_personagem_parado_baixo;
			break;
	}
	
	// Set the character's walking sprite rotation.
	if vveloc < 0 {
		dir = 1;
		sprite_index = spr_personagem_correndo_cima;
	} else if vveloc>0 {
		dir = 3;
		sprite_index = spr_personagem_correndo_baixo;
	}

	if hveloc > 0 {
		dir = 0;
		sprite_index = spr_personagem_correndo_direita;
	} else if hveloc<0 {
		dir = 2;
		sprite_index = spr_personagem_correndo_esquerda;
	}
	
	dash_cooldown_timer -= 1;
}


function scr_character_dash(){
	// Dash for the set amount of time.
	if dash_timer > 0 {
		
		switch dir{
			case 0:
				hveloc = dash_speed;
				break;
			case 1:
				vveloc = -dash_speed;
				break;
			case 2:
				hveloc = -dash_speed;
				break;
			case 3:
				vveloc = dash_speed;
		}
		
		// Check for collision.
		scr_check_collision();
		
		x += hveloc;
		
		y += vveloc;
		
		// Create a dash effect.
		var _inst = instance_create_layer(x,y,"Instances",obj_dash);
		_inst.sprite_index = sprite_index;
		
		dash_timer -= 1;
		
	} else {
		dash_timer = dash_duration;
		dash_cooldown_timer = dash_cooldown;
		state = scr_character_walk;
	}
}