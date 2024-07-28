extends CharacterBody2D
class_name Enemy
var item 
var move_speed := 6000.0
@onready var tailLight = $Animator/Lights
func _ready():
	if is_in_group("dog"):
		item = load("res://Scenes/Items/grass.tscn")
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
		tailLight.position.x = -tailLight.position.x
	if velocity.x < 0:
		$Animator.flip_h = false
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
