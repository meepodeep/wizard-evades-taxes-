extends State
class_name HealerFollow
@onready var raycast = $"../../Raycasts"
@export var casterEnemy : CharacterBody2D
@onready var health = load("res://Scenes/health.tscn")
var player : CharacterBody2D
var directionDodge = Vector2(0,0)
var raycastCollisions = []
var collisionCount
var direction = Vector2()
var canCast = 1.0
var casted = false
func Enter():
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
			

					
	if player != null:			
		direction = player.global_position - casterEnemy.global_position + directionDodge
		if direction.length() > 50:
			casterEnemy.velocity = direction.normalized() * casterEnemy.move_speed * delta
		if direction.length() < 45:
			direction = casterEnemy.global_position - player.global_position + directionDodge
			casterEnemy.velocity = direction.normalized() * casterEnemy.move_speed * delta
			if canCast >= 1:
				instHealth(player.global_position)
				casted = true
				canCast =0
			if canCast <= 1:
				print(canCast)
				canCast += .5 * delta
	else:
		direction = casterEnemy.global_position
func instHealth(pos):
	var instanceHealth = health.instantiate()
	instanceHealth.position = pos
	add_sibling(instanceHealth)

func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		player = body



func _on_area_2d_body_exited(body):
	if body.is_in_group("enemy"):
		player = null
