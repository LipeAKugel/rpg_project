// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_character(){
	// Chase the player if it gets too close.
	if distance_to_object(obj_character) <= chasing_dist {
		chasing = true;
		state = scr_slime_chasing;
	} else {
		chasing = false;
	}
}

function scr_slime_check_hit(){
	
	if hit {
		var x1 = obj_character.x;
		var y1 = obj_character.y;
		veloc_dir = point_direction(x1,y1,x,y);
		state = scr_slime_hit;
		hit_alarm = hit_duration;
		health_bar_alarm = health_bar_duration;
	}
	
}

function scr_slime_choose(){
	
	next_state = choose(scr_slime_idle, scr_slime_walk);
	state_timer = irandom_range(120,240);	
	
	// Set the stage.
	if next_state == scr_slime_walk {
		state = scr_slime_walk;
		// Choose a random direction to walk.
		veloc_dir = irandom_range(0,359);
	} else if next_state == scr_slime_idle {
		state = scr_slime_idle;
	}
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
	
	// Check the character's distance.
	scr_check_character();
	if chasing == false {
		state = scr_slime_choose;
	}
	
}

function scr_slime_hit() {
	
	var _kb_speed = round(obj_character.knockback*(1-knockback_res));
	
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
		invulnerability = false;
		state = scr_slime_choose;
	}
	
	hit_alarm -= 1;
	
}
	
function scr_big_slime_died() {
	// Create 2 smaller slimes.
	repeat(2) {
		var _x = irandom_range(x-5,x+5);
		var _y = irandom_range(y-5,y+5);
		instance_create_layer(_x,_y,"Instances",obj_small_slime);
	}
	// Create particle effect.
	instance_create_layer(x,y,"Instances",obj_particle_death);
	
	// Add exp.
	obj_character.xp += 15;
	
	instance_destroy();
}

function scr_slime_died() {
	// Create particle effect.
	instance_create_layer(x,y,"Instances",obj_particle_death);
	
	// Add exp.
	obj_character.xp += 5;
	
	instance_destroy();
}