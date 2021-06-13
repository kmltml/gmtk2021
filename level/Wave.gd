extends Node

export(PackedScene) var spawner
var rng = RandomNumberGenerator.new()

var array = [
    preload("res://enemies/shooter/Shooter.tscn"),
    preload("res://enemies/rusher/Monster.tscn")
]

func _ready():
    rng.randomize()

func _process(_delta):
    if(Global.enemiesCount <= 0):
        #get_tree().create_timer(randf() * 0.5).connect("timeout", self, "lvlUp")
        lvlUp()

func lvlUp():
    Global.lvlWave += 1
    spownSpowner(Global.lvlWave)


func spownSpowner(amount):
    for i in amount:
        var s = spawner.instance()
        s.position = Global.levelScene.position+Vector2(rng.randf_range(-1000, 1000),rng.randf_range(-680, 680) )#Vector2(-750, 1150)
        s.spawned_monster=array[rng.randf_range(0, array.size ( ))]
        Global.levelScene.add_child(s)
        print(i)
