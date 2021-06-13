extends RigidBody2D

var attached_things = []

func die():
    for thing in attached_things:
        if is_instance_valid(thing):
            thing.powerup_die()

    Global.enemiesCount -= 1
    if has_method("score"):
        Global.score += self.score
    queue_free()

func on_bullet_hit(_bullet):
    die()

func attach_powerup(powerup):
    attached_things.append(powerup)

func on_contact_damage(body):
    die()
