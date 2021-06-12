extends RigidBody2D

export var turn_speed = 4.0
export var move_speed = 200
export var turn_alpha = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    process_facing(delta)
    process_move(delta)
    send_cord()


func process_facing(delta):
    var mouse_position = get_global_mouse_position()
    var mouse_vector = mouse_position - self.position
    var angle = atan2(mouse_vector.x, -mouse_vector.y)
    var angle_diff = self.rotation - angle
    if angle_diff > PI:
        angle_diff = angle_diff - 2.0 * PI
    elif angle_diff < -PI:
        angle_diff = angle_diff + 2.0 * PI

    self.angular_velocity = - sign(angle_diff) * pow(abs(angle_diff / PI), turn_alpha) * turn_speed

    # if abs(angle_diff) < 1.5 * delta * turn_speed:
    #     self.angular_velocity = 0
    # elif angle_diff < 0:
    #     self.angular_velocity = turn_speed
    # else:
    #     self.angular_velocity = -turn_speed

func process_move(delta):
    var move_vector = Vector2(0.0, 0.0)
    if Input.is_action_pressed("move_left"):
        move_vector.x -= 1.0
    if Input.is_action_pressed("move_right"):
        move_vector.x += 1.0
    if Input.is_action_pressed("move_up"):
        move_vector.y -= 1.0
    if Input.is_action_pressed("move_down"):
        move_vector.y += 1.0

    self.linear_velocity = move_vector.normalized() * move_speed

func send_cord():
    Singleton.playerRotation=self.rotation
    Singleton.playerPosition=self.position
    Singleton.playerSelf=self
