extends Node2D

@onready var gun = $Gun
@onready var potion = $Gun/Potions
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(get_global_mouse_position())
	if abs(global_rotation_degrees) >= 90:
		gun.flip_v = true
		potion.flip_v = true
	else:
		gun.flip_v = false
		potion.flip_v = false
	if Global.hasGun:
		gun.visible = true
		potion.visible = true
	else:
		gun.visible = false
		potion.visible = false

	
