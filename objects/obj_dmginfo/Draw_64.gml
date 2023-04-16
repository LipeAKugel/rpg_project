/// @description

var _cx = camera_get_view_x(view_camera[0]);
var _cy = camera_get_view_y(view_camera[0]);

var _x = (x1 - _cx) * scale_x;
var _y = (y1 - _cy) * scale_y;

draw_set_color(c_white);
draw_set_alpha(alpha);
draw_set_font(fnt_default);
draw_text(_x,_y-40,string(damage));
draw_set_alpha(1);