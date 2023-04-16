/// @description

var _escala = 4;
var _hud_y = 11 * _escala;
var _hud_x = 1360;

var _max_hp = obj_character.max_hp;
var _hp = obj_character.hp;

var _max_mana = obj_character.max_mana;
var _mana = obj_character.mana;

// HP bar.
draw_sprite_ext(spr_hud_barra_vida,0,_hud_x,_hud_y,-_escala*(_hp/_max_hp),_escala,0,c_white,1);

// Mana bar.
draw_sprite_ext(spr_hud_barra_estamina,0,_hud_x,_hud_y+32,-_escala*(_mana/_max_mana),_escala,0,c_white,1);

// HP and ST HUD.
draw_sprite_ext(spr_hud_vida,0,_hud_x,_hud_y,-_escala,_escala,0,c_white,1);