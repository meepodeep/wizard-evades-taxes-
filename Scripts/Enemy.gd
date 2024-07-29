extends CharacterBody2D
class_name Enemy
var item 
var move_speed := 6000.0
var tailLight
func _ready():
	if is_in_group("dog"):
		tailLight = $Animator/Lights
		item = load("res://Scenes/Items/item.tscn")
	if is_in_group("fireCaster"):
		item = load("res://Scenes/Items/flint.tscn")
	if is_in_group("healer"):
		item = load("res://Scenes/Items/heart.tscn")
	if is_in_group("poisonCaster"):
		item = load("res://Scenes/Items/mushroom.tscn")
func _physics_process(_delta):
	move_and_slide()
	
	if velocity.length() > 0:
		$Animator.play("Run")
	
	if velocity.x > 0:
		$Animator.flip_h = true
		if tailLight != null:
			tailLight.position.x = -tailLight.position.x
	if velocity.x < 0:
		$Animator.flip_h = false
		if tailLight != null:
			tailLight.position.x = tailLight.position.x
func slowDown():
	move_speed = 400
func speedUp():
	move_speed = 6000.0
func die(pos):
	var instanceItem = item.instantiate()
	instanceItem.position = pos
	add_sibling(instanceItem)
	queue_free()
