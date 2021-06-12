extends Area2D

const ExplodeSound = preload("res://explode.wav")

export var speed = Vector2(0.0, 1.0)

# Called when the node enters the scene tree for the first time.
func _ready():
    connect("body_entered", self, "on_body_entered")
    update_rotation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    update_rotation()
    self.position += speed * delta

func on_body_entered(body):
    var audio = AudioStreamPlayer2D.new()
    audio.stream = ExplodeSound
    Singleton.levelScene.add_child(audio)
    audio.position = position
    audio.play()
    body.queue_free()
    queue_free()
    audio.connect("finished", audio, "queue_free")

func update_rotation():
    self.rotation = atan2(speed.x, -speed.y)
