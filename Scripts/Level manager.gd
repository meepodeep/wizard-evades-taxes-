extends Node2D

var enemyCountStart = 0
var concurrentEnemies = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if concurrentEnemies <=0:
		print("levelbeat")


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		enemyCountStart +=1
		concurrentEnemies = enemyCountStart


func _on_area_2d_body_exited(body):
	if body.is_in_group("enemy"):
		concurrentEnemies -=1 
