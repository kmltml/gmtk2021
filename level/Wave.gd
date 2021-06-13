extends Node

export(PackedScene) var spawner
var rng = RandomNumberGenerator.new()

var arrayEnemies = [
    preload("res://enemies/shooter/Shooter.tscn"),
    preload("res://enemies/rusher/Monster.tscn"),
    preload("res://enemies/cannon/Cannon.tscn")
]

var arrayPowerUps = [
    preload("res://powerups/shield/Shield.tscn"),
    preload("res://powerups/spiky/Spiky.tscn")
]

func _ready():
    rng.randomize()

func _process(_delta):
    if(Global.enemiesCount <= 0):
        lvlUp()

    if Input.is_action_just_pressed("ui_reset"): 
        Global.reset()
        Global.levelScene.get_tree().reload_current_scene()


func lvlUp():
    Global.score += 1000
    Global.lvlWave += 1
    spownSpowner(Global.lvlWave)
    spownPowerUp(Global.lvlWave/2)


func spownSpowner(amount):
    for i in amount:
        var s = spawner.instance()
        s.position = Global.levelScene.position+Vector2(rng.randf_range(-1000, 1000),rng.randf_range(-680, 680) )#Vector2(-750, 1150)
        s.spawned_monster=arrayEnemies[rng.randf_range(0, arrayEnemies.size ( ))]
        Global.levelScene.add_child(s)

func spownPowerUp(amount):
    Global.enemiesCount-=amount
    for i in amount:
        var s = spawner.instance()
        s.position = Global.levelScene.position+Vector2(rng.randf_range(-1000, 1000),rng.randf_range(-680, 680) )#Vector2(-750, 1150)
        s.spawned_monster=arrayPowerUps[rng.randf_range(0, arrayPowerUps.size ( ))]
        Global.levelScene.add_child(s)
