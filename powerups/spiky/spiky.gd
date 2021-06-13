extends "res://powerups/powerup.gd"

export var spikes_extended = true

var enemy_group: String

func on_body_entered(body):
    if spikes_extended and body.has_method("on_contact_damage"):
        body.on_contact_damage(self)
    elif not spikes_extended:
        .on_body_entered(body)

func _on_ExtendTimer_timeout():
    $AnimationPlayer.play("Extend")
    $RetractTimer.start()

func _on_RetractTimer_timeout():
    $AnimationPlayer.play("Retract")
    $ExtendTimer.start()

func after_joined(body):
    $AnimationPlayer.queue("Extend")
    $ExtendTimer.stop()
    $RetractTimer.stop()
    connect("body_entered", self, "on_body_entered_connected")
    if body.is_in_group("player"):
        enemy_group = "monster"
    elif body.is_in_group("monster"):
        enemy_group = "player"

func on_contact_damage(_body):
    pass

func on_body_entered_connected(body):
    if body.is_in_group(enemy_group) and body.has_method("on_contact_damage"):
        body.on_contact_damage(self)
