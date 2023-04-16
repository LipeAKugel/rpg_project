// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_collision(){
	
	if place_meeting(x+hveloc,y,obj_wall) {
		if !place_meeting(x+sign(hveloc),y,obj_wall) {
			x += sign(hveloc);
		}
		hveloc = 0;
	}
	
	if place_meeting(x,y+vveloc,obj_wall) {
		if !place_meeting(x,y+sign(vveloc),obj_wall) {
			y += sign(vveloc);
		}
		vveloc = 0;
	}

}

function scr_character_dmginfo(){
	var _inst = instance_create_layer(x,y, "Instances", obj_dmginfo);
	_inst.x1 = obj_character.x;
	_inst.y1 = obj_character.y;
	_inst.damage = scr_calculate_damage(other.damage, defense);
}

function scr_enemy_dmginfo(){
	var _inst = instance_create_layer(x,y, "Instances", obj_dmginfo);
	_inst.x1 = other.x;
	_inst.y1 = other.y;
	_inst.damage = scr_calculate_damage(obj_character.damage, other.defense);
}

function scr_calculate_damage(damage, defense){
	damage = irandom_range(damage-2,damage+2);
	real_damage = damage - defense;
	if real_damage <= 0 {
		real_damage = 1;
	}
	
	return real_damage;
}