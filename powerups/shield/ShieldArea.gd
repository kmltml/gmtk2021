extends Area2D

export var shield_on = true

func _ready():
    $AnimationPlayer.play("Pulsing")
    connect("area_entered", self, "on_area_entered")
    $Timer.connect("timeout", self, "on_timeout")

# func _process(delta):
#     pass

func on_area_entered(area):
    if shield_on and area.is_in_group("bullet"):
        area.queue_free()
        shield_on = false
        $AnimationPlayer.play("Hit")
        $Timer.start()

func on_timeout():
    $AnimationPlayer.play("Recover")
    $AnimationPlayer.queue("Pulsing")
