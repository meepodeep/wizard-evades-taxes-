extends Node2D
var random:= Vector2()
var rng = RandomNumberGenerator.new()
var fire = load("res://Scenes/enemies/caster_enemy.tscn")
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	random.x = rng.randf_range(0, 300)
	random.y = rng.randf_range(0, 300)
func instFireGuy(pos):
	var instanceFire = fire.instantiate()
	instanceFire.position = pos
	add_child(instanceFire)


func _on_timer_timeout():
	instFireGuy(random)
	timer.start(4)
