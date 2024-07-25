extends Node2D
@onready var dpsParticles = $"../DpsParticles"
@onready var timer = $Timer
var player
var playerHealth = 5
var inPoison
var inFire
var inIce
var inHealth
var FireTime = 10
var burning = false
signal DamageTaken
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(playerHealth)
	if !inPoison && !inFire && !inIce && !burning:
		timer.stop()
		dpsParticles.play("Nothing")
	if inPoison:
		dpsParticles.play("Poison")
	if inIce:
		player.SPEED = 4000
		dpsParticles.play("Ice")
	else:
		player.SPEED = 9000
	if inFire || burning:
		dpsParticles.play("Fire")
		FireTime -= 2 * delta
	if FireTime <= 0:
		burning = false
		FireTime =10

	if playerHealth <= 0:
		print("died")


func _on_area_2d_area_entered(area):
	if area.is_in_group("poison"):
		inPoison = true
		DamageTaken.emit(-2)
		playerHealth -= 1
		timer.start(2)
	if area.is_in_group("ice"):
		inIce = true
	if area.is_in_group("fire"):
		inFire = true
		burning	= true
		DamageTaken.emit(-1)
		playerHealth -= .5
		timer.start(2)
	if area.is_in_group("health"):
		inHealth = true
		timer.start(2)

func _on_area_2d_area_exited(area):
	if area.is_in_group("poison"):
		inPoison = false
	if area.is_in_group("ice"):
		inIce = false
	if area.is_in_group("health"):
		inHealth = false
	if area.is_in_group("fire"):
		inFire = false


func _on_timer_timeout():
	if inPoison:
		DamageTaken.emit(-2)
		playerHealth -= 1
		timer.start(2)
	if inFire || burning:
		DamageTaken.emit(-1)
		playerHealth -= .5
		timer.start(2)
	if inHealth:
		DamageTaken.emit(2)
		playerHealth += 1
		timer.start(2)
