extends RigidBody2D

export var turn_speed = 6.0
export var move_speed = 10.0
export var turn_alpha = 0.5

onready var desired_distance = randf() * 300.0 + 300.0
var side_speed = 0.0

func _ready():
    side_speed = randf() * 2.0 * 80.0 - 80.0
    if side_speed < 0:
        side_speed -= 40.0
    else:
        side_speed += 40.0

func _process(_delta):
    process_facing()
    process_move()

func process_facing():
    var target_vector = Global.playerPosition - self.position
    var angle = atan2(target_vector.x, -target_vector.y)
    var angle_diff = self.rotation - angle
    if angle_diff > PI:
        angle_diff = angle_diff - 2.0 * PI
    elif angle_diff < -PI:
        angle_diff = angle_diff + 2.0 * PI

    self.angular_velocity = -sign(angle_diff) * pow(abs(angle_diff / PI), turn_alpha) * turn_speed

func process_move():
    var target_vector = Global.playerPosition - self.position
    var dist_diff = target_vector.length() - desired_distance
    var forward_speed = sign(dist_diff) * move_speed
    if abs(dist_diff) < 50.0:
        forward_speed *= abs(dist_diff) / 50.0
    var forward = target_vector.normalized()
    var side = Vector2(-forward.y, forward.x)
    self.linear_velocity = forward * forward_speed + side * side_speed

func on_bullet_hit(_bullet):
    queue_free()
