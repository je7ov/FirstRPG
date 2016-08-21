///scr_enemy_wander_state
scr_check_for_player();
var dir = point_direction(x, y, targetx, targety);
var hspd = lengthdir_x(movespeed, dir);
var vspd = lengthdir_y(movespeed, dir);
image_xscale = sign(hspd);
phy_position_x += hspd;
phy_position_y += vspd;
