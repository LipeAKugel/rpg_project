/// @description

// Check if hit.
if state != scr_slime_hit{
	scr_slime_check_hit();
}

// Check the character's distance.
if state != scr_slime_hit {
	scr_check_character();
}

// Execute the current script.
script_execute(state);

// Set the depth of the object according to its y position.
depth = -y;

// Destroy instance if it's HP reaches 0.
if hp <= 0 {
	scr_slime_died();
}
