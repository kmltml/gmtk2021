extends Position2D

export(PackedScene) var spawned_monster

func _ready():
    get_tree().create_timer(randf() * 0.5).connect("timeout", self, "play_animation")
    Global.enemiesCount+=1

func play_animation():
    $AnimationPlayer.play("SpawnerAnimation")

func spawn_monster():
    var monster = spawned_monster.instance()
    monster.position = global_position
    Global.levelScene.add_child(monster)
