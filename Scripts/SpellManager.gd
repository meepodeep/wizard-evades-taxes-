extends Node2D
@onready var ice = load("res://Scenes/ice.tscn")
@onready var poison = load("res://Scenes/poison.tscn")
@onready var health = load("res://Scenes/health.tscn")
@onready var fire = load("res://Scenes/fire.tscn")
@onready var light = load("res://Scenes/light.tscn")
@onready var ball = load("res://Scenes/spell_ball.tscn")
signal Fired
var currentSpell = 2
var OutOfAmmo = false
var hitPosition
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
func instBall(pos):
	var instanceBall = ball.instantiate()
	instanceBall.translation = pos
	add_child(instanceBall)
func _process(_delta):
	if Input.is_action_just_pressed("Fire") && OutOfAmmo != true:
		Fired.emit()
		instBall(hitPosition)
		match currentSpell:
			1:
				instPoison(hitPosition)
			2:
				instIce(hitPosition)
			3:
				instHealth(hitPosition)
			4:
				instFire(hitPosition)
			5:
				instLight(hitPosition)
		print("wawawa")


func _on_player_ammo_out():
	OutOfAmmo = true # Replace with function body.

func _on_player_ammo_filled():
	OutOfAmmo = false

func _on_player_transfer_hit_position(pos):
	hitPosition = pos # Replace with function body.
