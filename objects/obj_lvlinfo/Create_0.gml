/// @description

// Get the display/camera scale.
var _dw = display_get_gui_width();
var _dh = display_get_gui_height();

var _cw = camera_get_view_width(view_camera[0]);
var _ch = camera_get_view_height(view_camera[0]);

scale_x = _dw / _cw;
scale_y = _dh / _ch;

x1 = 0;
y1 = 0;

alpha = 1;