extends Area2D

const ExplodeSound = preload("res://bullets/explode.wav")

export var speed = Vector2(0.0, 1.0)

# Called when the node enters the scene tree for the first time.
func _ready():
    Global.score -= 1
    connect("body_entered", self, "on_body_entered")
    update_rotation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    update_rotation()
    self.position += speed * delta

func on_body_entered(body):
    if body.has_method("on_bullet_hit"):
        var audio = AudioStreamPlayer2D.new()
        audio.stream = ExplodeSound
        Global.levelScene.add_child(audio)
        audio.position = position
        audio.play()
        body.on_bullet_hit(self)
        audio.connect("finished", audio, "queue_free")
        if body.is_in_group("monster"):
            Global.enemiesCount -= 1
            if body.has_method("score"):
                Global.score += body.score

    queue_free()

func update_rotation():
    self.rotation = atan2(speed.x, -speed.y)
