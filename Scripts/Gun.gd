extends Node2D

@onready var gun = $Gun

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	if abs(global_rotation_degrees) >= 90:
		gun.flip_v = true
	else:
		gun.flip_v = false


	
