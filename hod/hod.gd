extends Control 

onready var heart =$TextureRect

func _process(_delta):
    var playerHealth=Singleton.playerHealth

    if(heart != null):
        if(playerHealth <= 0):
            heart.visible=false
        heart.rect_size.x = playerHealth * 19 

