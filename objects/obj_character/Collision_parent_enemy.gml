/// @description Collision with enemy.

if invulnerability == false {
	var _damage = scr_calculate_damage(other.damage, defense);
	hp -= _damage;
	hit = true;
	invulnerability = true;
	inv_alarm = inv_duration;
	
	enemy = other;
	
	// Show damage indicator.
	scr_character_dmginfo(_damage);
}

