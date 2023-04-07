/// @description

// Movement and Collision
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));

hveloc = (right - left) * veloc;

if place_meeting(x+hveloc,y,obj_wall) {
	if !place_meeting(x+sign(hveloc),y,obj_wall) {
		x += sign(hveloc);
	}
	hveloc = 0;
}

x += hveloc;

vveloc = (down - up) * veloc;

if place_meeting(x,y+vveloc,obj_wall) {
	if !place_meeting(x,y+sign(vveloc),obj_wall) {
		y += sign(vveloc);
	}
	vveloc = 0;
}

y += vveloc;

// Rotação

switch dir {
	case 0:
		sprite_index = spr_personagem_parado_direita;
		break;
	case 1:
		sprite_index = spr_personagem_parado_cima;
		break;
	case 2:
		sprite_index = spr_personagem_parado_esquerda;
		break;
	case 3:
		sprite_index = spr_personagem_parado_baixo;
		break;
}

if vveloc<0 {
	dir = 1;
	sprite_index = spr_personagem_correndo_cima;
} else if vveloc>0 {
	dir = 3;
	sprite_index = spr_personagem_correndo_baixo;
}

if hveloc>0 {
	dir = 0;
	sprite_index = spr_personagem_correndo_direita;
} else if hveloc<0 {
	dir = 2;
	sprite_index = spr_personagem_correndo_esquerda;
}