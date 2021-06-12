extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
    connect("area_exited", self, "on_area_exited")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#    pass

func on_area_exited(area):
    area.queue_free()
