extends CharacterBody2D
class_name DogEnemy
var dogHealth = 10
var item = load("res://Scenes/item.tscn")

func _physics_process(_delta):
	move_and_slide()
func _process(delta):
	if dogHealth <= 0:
		die(global_position)
func slowDown():
	$"State Machine/Follow".move_speed = 400
func die(pos):
	var instanceItem = item.instantiate()
	instanceItem.position = pos
	add_sibling(instanceItem)
	print("died")
	queue_free()
