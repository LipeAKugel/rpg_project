/// @description Collision with enemy.

if invulnerability == false {
	
	hp -= scr_calculate_damage(other.damage, defense);
	hit = true;
	invulnerability = true;
	inv_alarm = inv_duration;
	
	enemy = other;
	
	// Show damage indicator.
	scr_character_dmginfo();
}

