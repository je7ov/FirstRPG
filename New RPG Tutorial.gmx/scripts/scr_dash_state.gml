///scr_dash_state
movement = MOVE;

if(len == 0) {
    dir = face * 90;
}

// Set length
len = movespeed * 4;

// Move character
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

phy_position_x += hspd;
phy_position_y += vspd;

// Create dash effect
var dash = instance_create(x, y, obj_dash_effect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
