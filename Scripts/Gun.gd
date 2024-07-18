extends Node2D

@onready var gun = $Gun
var ice = load("res://Scenes/ice.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	if abs(global_rotation_degrees) >= 90:
		gun.flip_v = true
	else:
		gun.flip_v = false
	if Input.is_action_just_pressed("Fire"):
		get_global_mouse_position()
		print("wawawa")
