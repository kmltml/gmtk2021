extends Timer

const Bullet = preload("res://bullets/bullet.tscn")

export var bullet_speed = Vector2(0.0, 560.0)

var can_shoot = true

func _ready():
    connect("timeout", self, "on_timeout")

func _process(_delta):
    if Input.is_action_just_pressed("shoot") and can_shoot:
        shoot()
        start()

func shoot():
    var bullet = Bullet.instance()
    bullet.speed = get_parent().global_transform.basis_xform(bullet_speed)
    bullet.position = get_parent().global_position
    Global.levelScene.add_child(bullet)
    can_shoot = false
    $"../Sound".play()


func on_timeout():
    if Input.is_action_pressed("shoot"):
        shoot()
    else:
        can_shoot = true
        stop()
