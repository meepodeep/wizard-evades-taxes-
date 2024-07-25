extends Node2D

var LifeTime = 10
# Called when the node enters the scene tree for the first time.
func _process(delta):
	LifeTime -= 1 * delta
	scale.x = LifeTime/10
	scale.y = LifeTime/10
	if LifeTime <= 0:
		queue_free()
