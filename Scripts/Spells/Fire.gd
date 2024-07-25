extends Node2D


var LifeTime = 10
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	LifeTime -= .7 * delta
	scale.x = LifeTime/10
	scale.y = LifeTime/10
	if LifeTime <= 0:
		queue_free()
