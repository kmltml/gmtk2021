extends "res://enemies/enemy.gd"

export var turn_speed = 4.0
export var move_speed = 100
export var turn_alpha = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    process_facing(delta)
    process_move(delta)


func process_facing(_delta):
    var moonster_vector = Global.playerPosition - self.position
    var angle = atan2(moonster_vector.x, -moonster_vector.y)
    var angle_diff = self.rotation - angle
    if angle_diff > PI:
        angle_diff = angle_diff - 2.0 * PI
    elif angle_diff < -PI:
        angle_diff = angle_diff + 2.0 * PI

    self.angular_velocity = - sign(angle_diff) * pow(abs(angle_diff / PI), turn_alpha) * turn_speed
    
func process_move(delta):
    var move_vector = Global.playerPosition - self.position

    self.linear_velocity = move_vector.normalized() * move_speed


func _on_Monster_body_entered(body):
    if body.is_in_group("player"):
        body.on_contact_damage(self)
