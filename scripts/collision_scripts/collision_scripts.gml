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