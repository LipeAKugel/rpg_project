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