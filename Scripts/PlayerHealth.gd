extends Node2D
var player
var playerHealth = 20
var inPoison
var inFire
var inIce
var inHealth
var FireTime = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inPoison:
		playerHealth -= 2 * delta
	if inIce:
		player.SPEED = 4000
	else:
		player.SPEED = 9000
	if inFire:
		playerHealth -= 1 * delta
		FireTime -= 2 * delta
	if FireTime <=0:
		inFire = false
		FireTime =10
	if inHealth:
		playerHealth += 1 * delta
	if playerHealth <= 0:
		print("died")


func _on_area_2d_area_entered(area):
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
