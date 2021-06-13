extends Control 

onready var heart = $Hud/Health
onready var pause = $Pause
onready var lvl = $Hud/Lvl
onready var enemy = $Hud/Enemy
onready var score = $Hud/Score
onready var endScore = $End/EndScore
onready var end = $End
onready var hello = $Hello
onready var hud = $Hud

func _ready():
    helloState()

func _process(_delta):
    var playerHealth = Global.playerHealth
    heart.rect_size.x = playerHealth * 19
    lvl.text="lvl: " + str(Global.lvlWave)
    score.text="score: " + str(Global.score)
    enemy.text="enemy: " + str(Global.enemiesCount)

    if(playerHealth <= 0):
        Global.levelScene.get_tree().paused=true
        endState()
        endScore.text="your score is: " + str(Global.score)

    if Input.is_action_just_pressed("ui_reset"): 
        Global.reset()
        Global.levelScene.get_tree().reload_current_scene()
        hudState()
     
    if Input.is_action_just_pressed("ui_cancel"):
        if Global.levelScene.get_tree().paused==false:
            pauseState()
        else:
            hudState()
        
func hudState():
    Global.levelScene.get_tree().paused=false
    hud.visible=true
    pause.visible=false
    end.visible=false
    hello.visible=false 
           
func pauseState():
    Global.levelScene.get_tree().paused=true
    hud.visible=false
    pause.visible=true
    end.visible=false
    hello.visible=false 
           
func endState():
    Global.levelScene.get_tree().paused=true
    hud.visible=true
    pause.visible=false
    end.visible=true
    hello.visible=false  
          
func helloState():
    Global.levelScene.get_tree().paused=true
    hud.visible=true
    pause.visible=false
    end.visible=false
    hello.visible=true

func _on_Button_pressed():
    Global.reset()
    Global.levelScene.get_tree().reload_current_scene() 
    hudState()

func _on_Button2_pressed():
    hudState()
