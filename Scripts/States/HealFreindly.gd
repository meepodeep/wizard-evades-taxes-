extends State
class_name EnemyCastHealth

@onready var health = load("res://Scenes/fire.tscn")
var move_speed = 4000.0
var player : CharacterBody2D
@export var enemy : CharacterBody2D
var canCast = 1.0
var casted = false
func Enter():
	player = get_tree().get_first_node_in_group("Player")
func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	if canCast >=1:
		instHealth(player.global_position)
		casted = true
		canCast =0
	if canCast <= 1:
		canCast += 1 * delta
	if casted == true:
		Transitioned.emit(self, "Follow")
func instHealth(pos):
	var instanceHealth = health.instantiate()
	instanceHealth.position = pos
	add_sibling(instanceHealth)
