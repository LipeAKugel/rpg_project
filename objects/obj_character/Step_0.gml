/// @description

// Check the current character state and run the according script.
if state == "walk" {
	script_execute(scr_character_walk);
} else if state == "dash" {
	script_execute(scr_character_dash);
}

// Dash if "z" is pressed.
if dash_cooldown_timer <= 0 {
	if keyboard_check_pressed(ord("Z")) {
		state = "dash"
	}
}