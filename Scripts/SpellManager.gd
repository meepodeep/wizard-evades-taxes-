extends Node2D
@onready var ice = load("res://Scenes/ice.tscn")
@onready var poison = load("res://Scenes/poison.tscn")
@onready var health = load("res://Scenes/health.tscn")
@onready var fire = load("res://Scenes/fire.tscn")
@onready var light = load("res://Scenes/light.tscn")
@onready var ball = $"../SpellBall"
@onready var player = %Player
var targetPosition
signal Fired
signal landed
var currentSpell = 1
var OutOfAmmo = false
var hitPosition
var isFiring = false
func _ready():
	ball.visible = false
	ball.position = player.global_position
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
	player.SpellType = currentSpell
	if isFiring == true:
		if ball.global_position != targetPosition:
			ball.visible = true
			ball.global_position = ball.global_position.move_toward(targetPosition, 3)
		if ball.global_position == targetPosition:
			landed.emit()
			isFiring = false
			ball.visible = false
			ball.position = player.global_position
	if Input.is_action_just_pressed("Fire") && OutOfAmmo != true && isFiring == false:
		targetPosition = hitPosition
		ball.position = player.global_position
		Fired.emit()
		match currentSpell:
			1:
				ball.poison()
			2:
				ball.ice()
			3:
				ball.health()
			4:
				ball.fire()
			5:
				ball.light()
		isFiring = true
	
func _on_player_ammo_out():
	OutOfAmmo = true # Replace with function body.

func _on_player_ammo_filled():
	OutOfAmmo = false

func _on_player_transfer_hit_position(pos):
	hitPosition = pos # Replace with function body.


func _on_landed():
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
