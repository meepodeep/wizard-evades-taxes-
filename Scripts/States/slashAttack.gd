extends State
class_name EnemySlash

var move_speed = 4000.0
var player : CharacterBody2D
@export var dogEnemy : CharacterBody2D
var dash = 1
var canDash = 1.0
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	canDash = 1.0
func Physics_Update(delta: float):
	var direction = player.global_position - dogEnemy.global_position
	if dash == 1 && canDash >=0:
		move_speed= 60000
		canDash -= 9 * delta
		dogEnemy.velocity = direction.normalized() * move_speed * delta
	else:
		move_speed = 4000.0
	if dash != 1:
		canDash = 1
	if canDash <= 0:
		Transitioned.emit(self, "Follow")
