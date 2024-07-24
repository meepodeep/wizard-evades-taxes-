extends State
class_name EnemyFollow
@onready var raycast = $"../../Raycasts"
@export var enemy : CharacterBody2D
@export var move_speed := 40.0
var player : CharacterBody2D
var directionDodge = Vector2(0,0)
var raycasts = []
func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(delta: float):
	raycasts = raycast.get_children()
	print(directionDodge)

	for child in raycasts:
		if false in raycasts:
			directionDodge = Vector2(0,0)
		match child.name.to_lower():
			"raycastnorth":
				if child.is_colliding():
					directionDodge += Vector2(0,1)
			"raycastsouth":
				if child.is_colliding():
					directionDodge += Vector2(0,-1)
			"raycasteast":
				if child.is_colliding():
						directionDodge += Vector2(-1,0)
			"raycastwest":
				if child.is_colliding():
						directionDodge += Vector2(1,0)
			"raycastsoutheast":
				if child.is_colliding():
						directionDodge += Vector2(-1,-1)
			"raycastnortheast":
				if child.is_colliding():
						directionDodge += Vector2(-1,1)
			"raycastnorthwest":
				if child.is_colliding():
						directionDodge += Vector2(1,1)
			"raycastsouthwest":
				if child.is_colliding():
					directionDodge += Vector2(1,-1)
			

					
				
	var direction = player.global_position - enemy.global_position + directionDodge
	if direction.length() > 0:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
	
	if direction.length() > 200:
		print("idel")
		Transitioned.emit(self, "idle")
