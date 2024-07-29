extends Node2D
@onready var boss_health_manager = $"../BossHealthManager"
var enemyCountStart = 0
var doorCount = 0 
var doors = []
var concurrentEnemies = 0
var playerIn 
var canChange = true
signal RoomCleared

# Called when the node enters the scene tree for the first time.
func _ready():
	doors.resize(10)
	boss_health_manager.weakness = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(boss_health_manager.weakness)
	if concurrentEnemies <=0 && canChange == true:
		boss_health_manager.weakness = true
		canChange = false
	if concurrentEnemies >0:
		canChange = true


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		enemyCountStart +=1
		concurrentEnemies = enemyCountStart
	if body.is_in_group("Player"):
		playerIn = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("enemy"):
		concurrentEnemies -=1 
