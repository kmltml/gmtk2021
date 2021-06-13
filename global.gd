extends Node

var playerPosition:Vector2
var playerHealth: int

var enemiesCount: int
var lvlWave:int = 1

var score = 0

var levelScene: Node2D

func reset():
    enemiesCount = 0
    score = 0
    lvlWave = 1

