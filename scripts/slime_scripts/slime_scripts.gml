// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_slime_choose(){
	
	
	next_state = choose(scr_slime_idle, scr_slime_walk);
	
	if next_state == scr_slime_walk {
		state = scr_slime_walk;
		// Choose a random direction to walk.
		veloc_dir = irandom_range(0,359);
	} else if next_state == scr_slime_idle {
		state = scr_slime_idle;
	}
	
	state_timer = irandom_range(120,240);
}

function scr_slime_walk(){
	
	image_speed = 1;
	
	// Set the horizontal and vertical speed.
	hveloc = lengthdir_x(veloc, veloc_dir);
	vveloc = lengthdir_y(veloc, veloc_dir);
	
	// Check for collision.
	scr_check_collision();
	
	x += hveloc;
	y += vveloc;
	
	state_timer -= 1;
	if state_timer <= 0 {
		hveloc = 0;
		vveloc = 0;
		state = scr_slime_choose;
	}
}

function scr_slime_idle(){
	
	image_speed = 0.5;
	
	state_timer -= 1;
	if state_timer <= 0 {
		state = scr_slime_choose;
	}
}

function scr_slime_chasing() {
	
	image_speed = 2;
	
	// Get the character's direction.
	veloc_dir = point_direction(x,y,obj_character.x,obj_character.y);
	
	// Move to the player's direction.
	hveloc = lengthdir_x(chasing_veloc, veloc_dir);
	vveloc = lengthdir_y(chasing_veloc, veloc_dir);

	// Check for collision.
	scr_check_collision();

	x += hveloc;
	y += vveloc;
	
	if distance_to_object(obj_character) > chasing_dist {
		state = scr_slime_choose;
	}
}
