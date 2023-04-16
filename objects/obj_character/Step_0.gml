/// @description

// Check if hit.
if state != scr_character_hit {
	scr_character_check_hit();
}

// Control invulnerability.
scr_control_invulnerability();

// Run the current state.
script_execute(state);



// Set the depth of the object according to its y position.
depth = -y-3;