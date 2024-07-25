extends Node2D
@export var dogEnemy : CharacterBody2D
var dogHealth = 10
var inPoison
var inFire
var inIce
var inHealth
var FireTime = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if inPoison:
		dogHealth -= 10 * delta
	if inIce:
		dogEnemy.slowDown()
	else:
		dogEnemy.speedUp()
	if inFire:
		dogHealth -= 5 * delta
		FireTime -= 2 * delta
	if FireTime <= 0:
		inFire = false
		FireTime =10
	if inHealth:
		dogHealth += 5 * delta
	if dogHealth <= 0:
		dogEnemy.die(global_position)


func _on_area_2d_area_entered(area):
	print("dogHealth",dogHealth)
	print("fireTime",FireTime)
	if area.is_in_group("poison"):
		inPoison = true
	if area.is_in_group("ice"):
		inIce = true
	if area.is_in_group("fire"):
		inFire = true
	if area.is_in_group("health"):
		inHealth = true

func _on_area_2d_area_exited(area):
	if area.is_in_group("poison"):
		inPoison = false
	if area.is_in_group("ice"):
		inIce = false
	if area.is_in_group("health"):
		inHealth = false
