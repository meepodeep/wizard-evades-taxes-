extends State
class_name EnemyCast

@onready var fire = load("res://Scenes/fire.tscn")
var move_speed = 4000.0
var player : CharacterBody2D
@export var enemy : CharacterBody2D
var dash = 1
var canDash = 1.0
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	canDash = 1.0
func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	if dash == 1 && canDash >=0:
		canDash -= 9 * delta
	else:
		pass
	if dash != 1:
		canDash = 1
	if canDash <= 0:
		Transitioned.emit(self, "Follow")
func instFire(pos):
	var instanceFire = fire.instantiate()
	instanceFire.position = pos
	add_child(instanceFire)
