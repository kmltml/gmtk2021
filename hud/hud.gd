extends Control 

onready var heart = $TextureRect
onready var backGround = $BackGround
onready var lvl = $Lvl

func _process(_delta):
    var playerHealth = Global.playerHealth
    heart.rect_size.x = playerHealth * 19
    lvl.text="lvl:" + str(Global.lvlWave)

    if(playerHealth <= 0):
        heart.visible = false
        Global.reset()
        Global.levelScene.get_tree().reload_current_scene()       
     
        
    if Input.is_action_just_pressed("ui_cancel"):
        backGround.visible = !backGround.visible
        Global.levelScene.get_tree().paused=!Global.levelScene.get_tree().paused
        
