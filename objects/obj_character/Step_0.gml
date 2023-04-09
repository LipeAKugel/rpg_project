/// @description

// Run the current state.
script_execute(state);

// Dash if "z" is pressed.
if dash_cooldown_timer <= 0 {
	if keyboard_check_pressed(ord("Z")) {
		state = scr_character_dash;
	}
}

// Set the depth of the object according to its y position.
depth = -y-3;