extends Node2D


var enemyIn = false
var enemy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemyIn && enemy != null:
		print("enemyIn")
		enemy.dogHealth -= .05


func _on_area_2d_body_entered(body):
	if body.is_in_group("dog"):
		enemy = body
		enemyIn = true
