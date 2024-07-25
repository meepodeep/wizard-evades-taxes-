extends Node2D


var dogIn = false
var playerIn = false
var enemy
var LifeTime = 10
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	LifeTime -= .7 * delta
	scale.x = LifeTime/10
	scale.y = LifeTime/10
	if LifeTime <= 0:
		queue_free()
	if dogIn && enemy != null:
		print("enemyIn")
		enemy.dogHealth -= 1 * delta
	if playerIn && enemy != null:
		print("enemyIn")
		enemy.playerHealth -= 1 * delta

func _on_area_2d_body_entered(body):
	if body.is_in_group("dog"):
		enemy = body
		dogIn = true
	if body.is_in_group("Player"):
		enemy = body
		playerIn = true

