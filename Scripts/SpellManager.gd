extends Node2D

@onready var ice = load("res://Scenes/ice.tscn")
@onready var poison = load("res://Scenes/poison.tscn")
@onready var health = load("res://Scenes/ice.tscn")
@onready var fire = load("res://Scenes/ice.tscn")
@onready var light = load("res://Scenes/ice.tscn")
@onready var currentSpell = 1
func instIce(pos):
	var instanceIce = ice.instantiate()
	instanceIce.position = pos
	add_child(instanceIce)
func instPoison(pos):
	var instancePoison = poison.instantiate()
	instancePoison.position = pos
	add_child(instancePoison)
func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		
		match currentSpell:
			1:
				instPoison(get_global_mouse_position())
			2:
				instIce(get_global_mouse_position())
		print("wawawa")
