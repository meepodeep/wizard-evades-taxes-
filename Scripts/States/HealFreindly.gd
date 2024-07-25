extends State
class_name EnemyCastHealth

@onready var health = load("res://Scenes/health.tscn")
var move_speed = 4000.0
var player : CharacterBody2D
@export var enemy : CharacterBody2D
var canCast = 1.0
var casted = false
var direction = Vector2()
func Physics_Update(delta: float):
	if player != null:
		direction = player.global_position - enemy.global_position
	else:
		direction = Vector2()

		Transitioned.emit(self, "Follow")
func instHealth(pos):
	var instanceHealth = health.instantiate()
	instanceHealth.position = pos
	add_sibling(instanceHealth)


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		print("enemy")
		player = body
