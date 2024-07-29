extends Node2D
@export var caster: CharacterBody2D
@onready var dpsParticles = $"../DpsParticles"
var weakness = false
var bossHealth = 40
var inPoison
var inHealth
var canstart = true
@onready var timer_2 = $"../Timer2"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if weakness: 
		if canstart == true:
			timer_2.start(4)
			canstart = false
		if inPoison:
			bossHealth -= 10 * delta
			dpsParticles.play("Poison")
		else:
			dpsParticles.play("Nothing")
		if inHealth:
			bossHealth += 5 * delta
		if bossHealth <= 0:
			caster.die(global_position)


func _on_area_2d_area_entered(area):
	if area.is_in_group("poison"):
		inPoison = true
	if area.is_in_group("ice"):
		area.get_parent().LifeTime = 1.0
	if area.is_in_group("health"):
		inHealth = true

func _on_area_2d_area_exited(area):
	if area.is_in_group("poison"):
		inPoison = false
	if area.is_in_group("health"):
		inHealth = false


func _on_timer_2_timeout():
	weakness = false
	canstart = true
