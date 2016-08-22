///scr_move_axis()
var dir = point_direction(0, 0, xaxis, yaxis);
var hspd = lengthdir_x(movespeed, dir);
var vspd = lengthdir_y(movespeed, dir);
if(hspd != 0) {
    image_xscale = sign(hspd);
}
scr_get_face(dir);
movement = MOVE;
phy_position_x += hspd;
phy_position_y += vspd;
