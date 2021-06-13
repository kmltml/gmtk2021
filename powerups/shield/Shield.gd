extends "res://powerups/powerup.gd"

func after_joined(body):
    if body.is_in_group("player"):
        add_to_group("player")
        $ShieldArea.set_collision_layer_bit(1, false)
    elif body.is_in_group("monster"):
        add_to_group("monster")
        $ShieldArea.set_collision_layer_bit(2, false)
