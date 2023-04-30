/// @description

// Movement
up = 0;
down = 0;
right = 0;
left = 0;

hveloc = 0;
vveloc = 0;
veloc_dir = 0;
veloc = 2;

// Rotation
dir = 0;

// Dash
dash_duration = 10;
dash_speed = 5;
dash_cooldown = 60
dash_cooldown_timer = dash_cooldown;
dash_timer = dash_duration;

// State
state = scr_character_walk;

// Combat
space = 0;

level = 1;
max_xp = 20;
xp = 0;


hit = false;
hit_duration = 5;
hit_alarm = 0;

max_hp = 100;
hp = max_hp;
max_mana = 20;
mana = max_mana;

inv_alarm = 0;
inv_duration = 120;
invulnerability = false;

defense = 1;
knockback_res = 0;
damage = 6;
knockback = 4;


