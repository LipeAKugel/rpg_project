/// @description

// Check the character's distance.
scr_check_character();

// Check if hit.
if state != scr_slime_hit{
	scr_slime_check_hit();
}

// Execute the current script.
script_execute(state);

// Set the depth of the object according to its y position.
depth = -y;

// Destroy instance if it's HP reaches 0.
if hp <= 0 {
	instance_create_layer(x,y,"Instances",obj_particle_death);
	instance_destroy();
}
