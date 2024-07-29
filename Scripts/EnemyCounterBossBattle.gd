extends Node2D

var enemyCountStart = 0
var doorCount = 0 
var doors = []
var concurrentEnemies = 0
var playerIn 
signal RoomCleared
@onready var static_body_2d = $"../AnimatedSprite2D/StaticBody2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	doors.resize(10)
	static_body_2d.active = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if concurrentEnemies <=0:
		static_body_2d.active = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		enemyCountStart +=1
		concurrentEnemies = enemyCountStart
	if body.is_in_group("Player"):
		playerIn = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("enemy"):
		concurrentEnemies -=1 
