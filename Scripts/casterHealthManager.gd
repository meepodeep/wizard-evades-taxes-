extends Node2D
@export var caster: CharacterBody2D
var casterHealth = 20
var inPoison
var inHealth
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inPoison:
		casterHealth -= 10 * delta
	if inHealth:
		casterHealth += 5 * delta
	if casterHealth <= 0:
		caster.die(global_position)


func _on_area_2d_area_entered(area):
	if area.is_in_group("poison"):
		inPoison = true
	if area.is_in_group("ice"):
		area.LifeTime = 1
	if area.is_in_group("health"):
		inHealth = true

func _on_area_2d_area_exited(area):
	if area.is_in_group("poison"):
		inPoison = false
	if area.is_in_group("health"):
		inHealth = false
