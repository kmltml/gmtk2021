extends RigidBody2D

const ExplodeSound = preload("res://enemies/explode.wav")

var attached_things = []

func die():
    for thing in attached_things:
        if is_instance_valid(thing):
            thing.powerup_die()

    Global.enemiesCount -= 1
    if has_method("score"):
        Global.score += self.score

    var audio = AudioStreamPlayer2D.new()
    audio.stream = ExplodeSound
    Global.levelScene.add_child(audio)
    audio.position = position
    audio.play()
    audio.connect("finished", audio, "queue_free")

    queue_free()

func on_bullet_hit(_bullet):
    die()

func attach_powerup(powerup):
    attached_things.append(powerup)

func on_contact_damage(body):
    die()
