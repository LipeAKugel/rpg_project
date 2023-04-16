/// @description

if other.invulnerability == false {
	other.hp -= scr_calculate_damage(obj_character.damage,other.defense);
	other.hit = true;
	other.invulnerability = true;
	
	// Show damage indicator.
	scr_enemy_dmginfo();
}