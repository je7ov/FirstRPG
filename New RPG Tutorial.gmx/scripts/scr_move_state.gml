///scr_move_state

movement = MOVE;

if(obj_input.dash_key) {
    var xdir = lengthdir_x(8, face * 90);
    var ydir = lengthdir_y(8, face * 90);
    var speaker = instance_place(x + xdir, y + ydir, obj_speaker);
    if(speaker != noone) {
        // Talk to speaker
        with(speaker) {
            if(!instance_exists(dialog)) {
                dialog = instance_create(x + xoffset, y + yoffset, obj_dialog);
                dialog.text = text;        
            } else {
                dialog.text_page++;
                dialog.text_count = 0;
                if(dialog.text_page > array_length_1d(dialog.text) - 1) {
                    with(dialog) {
                        instance_destroy();
                    }
                }
            }
        }
    } else if(obj_player_stats.stamina >= DASH_COST) {
        // Dash
        audio_play_sound(snd_player_dash, 8, false);
        state = scr_dash_state;
        alarm[0] = room_speed/8;
        obj_player_stats.stamina -= DASH_COST;
        obj_player_stats.alarm[1] = room_speed;
    }
}

if(obj_input.attack_key) {
    image_index = 0;
    state = scr_attack_state;
}

if(obj_input.spell_key) {
    audio_play_sound(snd_dark_blast, 7, false); 
    var p = instance_create(x, y, obj_projectile);

    p.creator = id;
    var xforce = lengthdir_x(20, face * 90);
    var yforce = lengthdir_y(20, face * 90);
    with(p) {   
        physics_apply_impulse(x, y, xforce, yforce);
    }
}

// Get direction
dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);

// Get the length
if (obj_input.xaxis == 0 and obj_input.yaxis == 0) {
    len = 0;
} else {
    len = movespeed;
    scr_get_face(dir);
}

// Move character
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

phy_position_x += hspd;
phy_position_y += vspd;

// Control the sprite
image_speed = .2;
if(len == 0) image_index = 0;
