extends Node2D

export var bullet_speed = Vector2(0.0, -560.0)
export(PackedScene) var bullet
export var should_shoot = false
export(int, LAYERS_2D_PHYSICS) var bullet_collision_mask

var can_shoot = true

func _ready():
    $Timer.connect("timeout", self, "on_timeout")

func _process(_delta):
    if should_shoot and can_shoot:
        shoot()
        $Timer.start()

func shoot():
    var b = bullet.instance()
    b.speed = global_transform.basis_xform(bullet_speed)
    b.position = global_position
    b.collision_mask = bullet_collision_mask
    Global.levelScene.add_child(b)
    can_shoot = false
    $Sound.play()

func on_timeout():
    if should_shoot:
        shoot()
    else:
        can_shoot = true
        $Timer.stop()
