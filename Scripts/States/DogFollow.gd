extends State
class_name DogFollow
@onready var raycast = $"../../Raycasts"
@export var enemy : CharacterBody2D
var player : CharacterBody2D
var directionDodge = Vector2(0,0)
var raycastCollisions = []
var collisionCount
var canSlash = true
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	raycastCollisions.resize(64)
	collisionCount = 0
func Physics_Update(delta: float):
	if not true in raycastCollisions:
		directionDodge = Vector2(0,0)
	
	for child in raycast.get_children():
		raycastCollisions[collisionCount] = child.is_colliding()
		if collisionCount <=8:
			collisionCount +=1
		else:
			collisionCount = 0
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
	if direction.length() > 20:
		canSlash = true
		enemy.velocity = direction.normalized() * enemy.move_speed * delta
	else:
		direction = enemy.global_position - player.global_position + directionDodge
		enemy.velocity = direction.normalized() * enemy.move_speed * delta
		if canSlash: 
			Transitioned.emit(self, "Slash")
			print("castwed")
			canSlash = false
	

	if direction.length() > 140:
		Transitioned.emit(self, "idle")