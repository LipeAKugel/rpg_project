/// @description

if other.invulnerability == false {
	var _damage = scr_calculate_damage(obj_character.damage,other.defense);
	other.hp -= _damage
	other.hit = true;
	other.invulnerability = true;
	
	// Show damage indicator.
	scr_enemy_dmginfo(_damage);
}
