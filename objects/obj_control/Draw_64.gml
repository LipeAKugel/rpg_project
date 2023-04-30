/// @description

var _escala = 4;

// HP and Mana bar positions.
var _hud_y = 11 * _escala;
var _hud_x = 1360;

var _max_hp = obj_character.max_hp;
var _hp = obj_character.hp;

var _max_mana = obj_character.max_mana;
var _mana = obj_character.mana;

draw_set_font(fnt_default);
draw_set_color(c_white);
draw_set_halign(fa_right);

// HP bar.
draw_sprite_ext(spr_hud_barra_vida,0,_hud_x,_hud_y,-_escala*(_hp/_max_hp),_escala,0,c_white,1);
draw_text_ext_transformed(_hud_x-10,_hud_y-6,string(_hp)+"/"+string(_max_hp),100,100,0.5,0.5,0);

// Mana bar.
draw_sprite_ext(spr_hud_barra_estamina,0,_hud_x,_hud_y+32,-_escala*(_mana/_max_mana),_escala,0,c_white,1);
draw_text_ext_transformed(_hud_x-10,_hud_y+26,string(_mana)+"/"+string(_max_mana),100,100,0.5,0.5,0);

// HP and Mana HUD.
draw_sprite_ext(spr_hud_vida,0,_hud_x,_hud_y,-_escala,_escala,0,c_white,1);



// XP bar position.
var _escala = 2;
var _hud_x = 453*_escala;
var _hud_y = 8*_escala;

var _centerx = window_get_width()/2;
var _bar_x = _centerx-_hud_x/2+6;

var _xp = obj_character.xp;
var _max_xp = obj_character.max_xp;

draw_set_halign(fa_center);

// XP bar.
draw_sprite_ext(spr_hud_exp_barra,0,_bar_x,768-_hud_y*2,_escala*(_xp/_max_xp),_escala,0,c_white,1);
draw_text_ext_transformed(_centerx,745-_hud_y*2,string(_xp)+"/"+string(_max_xp),100,100,0.5,0.5,0);

// XP hud.
draw_sprite_ext(spr_hud_exp,0,_centerx,768-_hud_y*2,_escala,_escala,0,c_white,1);