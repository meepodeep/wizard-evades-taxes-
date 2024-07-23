extends State
class_name EnemyFollow
@onready var raycasts = $"../../Raycasts"
@export var enemy : CharacterBody2D
@export var move_speed := 40.0
var player : CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(delta: float):
	for child in raycasts.get_children():
		if child.is_colliding():
			match child.name.to_lower():
				"raycastnorth":
					print("raycastnorth")
				"raycastsouth":
					print("raycastsouth")
				"raycasteast":
					print("raycasteast")
				"raycastwest":
					print("raycastwest")
			
	var direction = player.global_position - enemy.global_position
	if direction.length() > 50:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
	
	if direction.length() > 200:
		print("idel")
		Transitioned.emit(self, "idle")
