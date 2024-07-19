extends Node2D
@onready var ice = load("res://Scenes/ice.tscn")
@onready var poison = load("res://Scenes/poison.tscn")
@onready var health = load("res://Scenes/health.tscn")
@onready var fire = load("res://Scenes/fire.tscn")
@onready var light = load("res://Scenes/light.tscn")
@onready var currentSpell = 5
func instIce(pos):
	var instanceIce = ice.instantiate()
	instanceIce.position = pos
	add_child(instanceIce)
func instPoison(pos):
	var instancePoison = poison.instantiate()
	instancePoison.position = pos
	add_child(instancePoison)
func instHealth(pos):
	var instanceHealth = health.instantiate()
	instanceHealth.position = pos
	add_child(instanceHealth)
func instFire(pos):
	var instanceFire = fire.instantiate()
	instanceFire.position = pos
	add_child(instanceFire)
func instLight(pos):
	var instanceLight = light.instantiate()
	instanceLight.position = pos
	add_child(instanceLight)
func _process(_delta):
	if Input.is_action_just_pressed("Fire"):
		match currentSpell:
			1:
				instPoison(get_global_mouse_position())
			2:
				instIce(get_global_mouse_position())
			3:
				instHealth(get_global_mouse_position())
			4:
				instFire(get_global_mouse_position())
			5:
				instLight(get_global_mouse_position())
		print("wawawa")
