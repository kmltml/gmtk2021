extends Control 

onready var heart = $TextureRect
onready var backGround = $Pause
onready var lvl = $Lvl
onready var score = $Score
onready var endScore = $End/EndScore
onready var end = $End


func _process(_delta):
    var playerHealth = Global.playerHealth
    heart.rect_size.x = playerHealth * 19
    lvl.text="lvl: " + str(Global.lvlWave)
    score.text="score: " + str(Global.score)

    if(playerHealth <= 0):
        Global.levelScene.get_tree().paused=true
        heart.visible = false
        score.visible = false
        end.visible = true    
        
        endScore.text="your score is: " + str(Global.score)
  



     
        
    if Input.is_action_just_pressed("ui_cancel"):
        backGround.visible = !backGround.visible
        Global.levelScene.get_tree().paused=!Global.levelScene.get_tree().paused
        


func _on_Button_pressed():
    heart.visible = true
    score.visible = true
    end.visible = false  
    Global.reset()
    Global.levelScene.get_tree().reload_current_scene() 
    Global.levelScene.get_tree().paused=false
