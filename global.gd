extends Node

var playerPosition:Vector2
var playerHealth: int

var enemiesCount: int
var lvlWave:int = 1

var levelScene: Node2D

func reset():
    enemiesCount = 0
    lvlWave = 1

