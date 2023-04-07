// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_character_walk(){
	
	// Movement and Collision
	up = keyboard_check(vk_up);
	down = keyboard_check(vk_down);
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);

	hveloc = (right - left) * veloc;

	if place_meeting(x+hveloc,y,obj_wall) {
		if !place_meeting(x+sign(hveloc),y,obj_wall) {
			x += sign(hveloc);
		}
		hveloc = 0;
	}

	x += hveloc;

	vveloc = (down - up) * veloc;

	if place_meeting(x,y+vveloc,obj_wall) {
		if !place_meeting(x,y+sign(vveloc),obj_wall) {
			y += sign(vveloc);
		}
		vveloc = 0;
	}

	y += vveloc;

	// Rotação
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
		
		// Check for horizontal collision.
		if place_meeting(x+hveloc,y,obj_wall) {
			if !place_meeting(x+sign(hveloc),y,obj_wall) {
				x += sign(hveloc);
			}
			hveloc = 0;
		}
		
		x += hveloc;
		
		// Check for vertical collision.
		if place_meeting(x,y+vveloc,obj_wall) {
			if !place_meeting(x,y+sign(vveloc),obj_wall) {
				y += sign(vveloc);
			}
			vveloc = 0;
		}
		
		y += vveloc;
		
		// Create a dash effect.
		var _inst = instance_create_layer(x,y,"Instances",obj_dash);
		_inst.sprite_index = sprite_index;
		
		dash_timer -= 1;
		
	} else {
		dash_timer = dash_duration;
		dash_cooldown_timer = dash_cooldown;
		state = "walk";
	}
}