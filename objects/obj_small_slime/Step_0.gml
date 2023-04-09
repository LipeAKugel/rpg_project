/// @description

if distance_to_object(obj_character) <= chasing_dist {
	state = scr_slime_chasing;
}

// Execute the current script.
script_execute(state);

// Set the depth of the object according to its y position.
depth = -y;



