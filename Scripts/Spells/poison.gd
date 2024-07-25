extends Node2D
var enemyIn = false
var enemy
var LifeTime = 10
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	LifeTime -= .5 * delta
	scale.x = LifeTime/10
	scale.y = LifeTime/10
	if LifeTime <= 0:
		queue_free()
	if enemyIn && enemy != null:
		print("enemyIn")
		enemy.dogHealth -= .1

func _on_area_2d_body_entered(body):
	if body.is_in_group("dog"):
		enemy = body
		enemyIn = true
	if body.is_in_group("caster"):
		enemy = body
		enemyIn = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("dog"):
		enemyIn = false
	if body.is_in_group("caster"):
		enemyIn = false


