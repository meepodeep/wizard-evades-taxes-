extends Node2D
@onready var dpsParticles = $"../DpsParticles"
@onready var timer = $Timer
@onready var hit = $"../Hit"
var player
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
	if !inPoison && !inFire && !inIce && !burning && !inHealth:
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




func _on_area_2d_area_entered(area):
	if area.is_in_group("dog"):
		DamageTaken.emit(-1)
	if area.is_in_group("poison"):
		inPoison = true
		hit.play()
		DamageTaken.emit(-2)
		timer.start(2)
	if area.is_in_group("ice"):
		inIce = true
	if area.is_in_group("fire"):
		inFire = true
		burning	= true
		hit.play()
		DamageTaken.emit(-1)
		timer.start(2)
	if area.is_in_group("health"):
		inHealth = true
		timer.start(2)
		DamageTaken.emit(2)

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
		hit.play()
		DamageTaken.emit(-2)
		timer.start(2)
	if inFire || burning:
		hit.play()
		DamageTaken.emit(-1)
		timer.start(2)
	if inHealth:
		DamageTaken.emit(1)
		timer.start(2)
