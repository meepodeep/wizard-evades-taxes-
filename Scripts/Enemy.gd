extends CharacterBody2D
class_name FireEnemy
var dogHealth = 10
var item = load("res://Scenes/item.tscn")
var move_speed := 6000.0
func _physics_process(_delta):
	move_and_slide()
	
	if velocity.length() > 0:
		$Animator.play("Run")
	
	if velocity.x > 0:
		$Animator.flip_h = true
	if velocity.x < 0:
		$Animator.flip_h = false
func _process(delta):
	if dogHealth <= 0:
		die(global_position)
func slowDown():
	move_speed = 400
func speedUp():
	move_speed = 6000.0
func die(pos):
	var instanceItem = item.instantiate()
	instanceItem.position = pos
	add_sibling(instanceItem)
	print("died")
	queue_free()
