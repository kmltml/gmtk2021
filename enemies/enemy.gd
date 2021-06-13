extends RigidBody2D

var attached_things = []

func on_bullet_hit(_bullet):
    for thing in attached_things:
        if is_instance_valid(thing):
            thing.powerup_die()
    queue_free()

func attach_powerup(powerup):
    attached_things.append(powerup)
