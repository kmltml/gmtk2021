extends Timer

const Bullet = preload("res://bullet.tscn")

export var bullet_speed = Vector2(0.0, 560.0)

var can_shoot = true
var level

# Called when the node enters the scene tree for the first time.
func _ready():
    connect("timeout", self, "on_timeout")
    level = $"/root/Scene"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if Input.is_action_just_pressed("shoot") and can_shoot:
        shoot()
        start()

func shoot():
    var bullet = Bullet.instance()
    bullet.speed = get_parent().global_transform.basis_xform(bullet_speed)
    bullet.position = get_parent().global_position
    level.add_child(bullet)
    can_shoot = false


func on_timeout():
    if Input.is_action_pressed("shoot"):
        shoot()
    else:
        can_shoot = true
        stop()
