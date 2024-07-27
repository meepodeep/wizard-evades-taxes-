extends CharacterBody2D
class_name Enemy
var item = load("res://Scenes/grass.tscn")
var move_speed := 6000.0
func _physics_process(_delta):
	move_and_slide()
	
	if velocity.length() > 0:
		$Animator.play("Run")
	
	if velocity.x > 0:
		$Animator.flip_h = true
	if velocity.x < 0:
		$Animator.flip_h = false
func slowDown():
	move_speed = 400
func speedUp():
	move_speed = 6000.0
func die(pos):
	var instanceItem = item.instantiate()
	instanceItem.position = pos
	add_sibling(instanceItem)
	queue_free()
