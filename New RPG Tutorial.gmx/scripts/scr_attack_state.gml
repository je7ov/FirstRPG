///scr_attack_state
image_speed = 0.8;
movement = ATTACK;

if(scr_animation_hit_frame(2)) {
    var attack_animation = instance_create(x, y, obj_weapon_animation);
    attack_animation.dir = face * 90;
    attack_animation.image_angle = face * 90 + 45;
    attack_animation.sprite_index = weapon_sprite;
}

if(scr_animation_hit_frame(3)) {
    var xx = 0;
    var yy = 0;
    switch(face) {
        case RIGHT:
            xx = x + 10;
            yy = y + 2;
            break;
        case UP:
            xx = x;
            yy = y - 10;
            break;
        case LEFT:
            xx = x - 10;
            yy = y + 2;
            break;
        case DOWN:
            xx = x;
            yy = y + 12;
            break;
    }
    audio_play_sound(snd_sword_attack, 8, false);
    var damage = instance_create(xx, yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
    attacked = true;
}
