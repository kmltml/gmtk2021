extends Area2D

func _on_Heart_body_entered(body):
    Global.playerHealth += 1
    queue_free()
