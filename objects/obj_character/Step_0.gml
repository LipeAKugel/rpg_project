/// @description

// Check if hit.
if state != scr_character_hit {
	scr_character_check_hit();
}

// Control invulnerability.
scr_control_invulnerability();

// Level up if the xp reaches the max value.
if xp >= max_xp {
	scr_levelup();
}

// Run the current state.
script_execute(state);



// Set the depth of the object according to its y position.
depth = -y-3;