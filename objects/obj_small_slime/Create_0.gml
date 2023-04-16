/// @description

// State
state = scr_slime_choose;
chasing = false;
hit = false;
next_state = 0;
state_timer = 0;
chasing_dist = 75;

// Movement
chasing_veloc = 0.4;
veloc = 0.2;
veloc_dir = 0;
hveloc = 0;
vveloc = 0;

// Combat
hit = false;
hit_duration = 5;
hit_alarm = 0;

hp = 20;
knockback_res = 0;
defense = 0;
invulnerability = false;

damage = 10;
knockback = 4;