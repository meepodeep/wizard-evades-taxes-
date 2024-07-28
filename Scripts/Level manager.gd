extends Node2D

var enemyCountStart = 0
var doorCount = 0 
var doors = []
var concurrentEnemies = 0
signal RoomCleared
# Called when the node enters the scene tree for the first time.
func _ready():
	doors.resize(10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if concurrentEnemies <=0:
		RoomCleared.emit()
		for door in doors:
			if door != null:
				if door.is_in_group("door"):
					door.queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		enemyCountStart +=1
		concurrentEnemies = enemyCountStart
	if body.is_in_group("door"):
		doors[doorCount] = body
		doorCount += 1

func _on_area_2d_body_exited(body):
	if body.is_in_group("enemy"):
		concurrentEnemies -=1 
