extends RigidBody2D

export var turn_speed = 4.0
export var move_speed = 200.0
export var turn_alpha = 1.0
export var player_health:int = 5


# Called when the node enters the scene tree for the first time.
func _ready():
    Global.playerHealth = player_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    process_facing()
    process_move()
    send_cord()


func process_facing():
    var mouse_position = get_global_mouse_position()
    var mouse_vector = mouse_position - self.position
    var angle = atan2(mouse_vector.x, -mouse_vector.y)
    var angle_diff = self.rotation - angle
    if angle_diff > PI:
        angle_diff = angle_diff - 2.0 * PI
    elif angle_diff < -PI:
        angle_diff = angle_diff + 2.0 * PI

    self.angular_velocity = - sign(angle_diff) * pow(abs(angle_diff / PI), turn_alpha) * turn_speed

func process_move():
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
    Global.playerPosition=self.position
