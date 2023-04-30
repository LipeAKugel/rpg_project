
function scr_character_check_hit(){
	
	if hit {
		var x1 = enemy.x;
		var y1 = enemy.y;
		veloc_dir = point_direction(x1,y1,x,y);
		state = scr_character_hit;
		hit_alarm = hit_duration;
	}
	
}

function scr_character_walk(){
	
	#region Movement and Collision
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
	
	#endregion
	
	#region Rotation
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
	
	#endregion
	
	#region Dash
	// Dash if "z" is pressed.
	if dash_cooldown_timer <= 0 {
		if keyboard_check_pressed(ord("Z")) {
			state = scr_character_dash;
		}
	}
	#endregion
	
	#region Attack
	space = keyboard_check_pressed(vk_space);
	if space {
		image_index = 0;
		state = scr_character_attack;
		scr_create_attack_hitbox();
	}
	#endregion
	
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
	
function scr_character_attack(){
	
	switch dir {
		
		case 0: 
			sprite_index = spr_personagem_atacando_direita;
			break;
		case 1:
			sprite_index = spr_personagem_atacando_cima;
			break;
		case 2:
			sprite_index = spr_personagem_atacando_esquerda;
			break;
		case 3:
			sprite_index = spr_personagem_atacando_baixo;
			break;
	}
	
	if image_index >= 5 {
		state = scr_character_walk;
	}
	
}
	
function scr_create_attack_hitbox(){
	
	switch dir {
		case 0:
			// Right.
			instance_create_layer(x+14,y,"Instances",obj_attack_hitbox);
			break;
		case 1:
			// Up.
			instance_create_layer(x,y-13,"Instances",obj_attack_hitbox);
			break;
		case 2:
			// Left.
			instance_create_layer(x-14,y,"Instances",obj_attack_hitbox);
			break;
		case 3:
			// Down.
			instance_create_layer(x,y+12,"Instances",obj_attack_hitbox);
			break;
	}
	
}
	
function scr_character_hit(){
	
	var _kb_speed = round(enemy.knockback*(1-knockback_res));
	
	// Take knockback
	hveloc = lengthdir_x(_kb_speed, veloc_dir);
	vveloc = lengthdir_y(_kb_speed, veloc_dir);
	
	// Check collision.
	scr_check_collision();
	
	x += hveloc;
	y += vveloc;
	
	// End hit state if the alarm reaches 0.
	if hit_alarm == 0 {
		hit = false;
		state = scr_character_walk;
	}
	
	hit_alarm -= 1;
	
}
	
function scr_control_invulnerability(){
	
	if inv_alarm >= 0 {
		invulnerability = true;
	} else {
		invulnerability = false;
	}
	
	// Show an invulnerable effect if invulnerable.
	if invulnerability == true {
		if image_alpha <= 0 {
			alpha_add = 0.05;
		} else if image_alpha >= 1 {
			alpha_add = -0.05;
		}
		image_alpha += alpha_add;
	} else {
		image_alpha = 1;	
	}
	
	inv_alarm -= 1;
	
}
	
function scr_levelup() {
	level_max_xp = [20,130,169,219,285,371,482,627,815,1060,1378,1792,2329,3028,3937,5118];
	level_max_hp = [100,110,121,133,146,161,177,194,214,235,259,285,313,345,379,417];
	level_max_mana = [20,22,24,26,29,32,35,38,42,47,51,57,62,69,75,83];
	
	xp -= level_max_xp[level-1];
	level += 1;
	
	max_hp = level_max_hp[level-1];
	max_mana = level_max_mana[level-1];
	max_xp = level_max_xp[level-1];
	
	// Draw a LEVEL UP text in the game.
	var _inst = instance_create_layer(x,y, "Instances", obj_lvlinfo);
	_inst.x1 = x;
	_inst.y1 = y;
}