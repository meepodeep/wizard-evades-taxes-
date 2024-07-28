extends RigidBody2D
@onready var animator = $ItemAnimator
var level = ""
var random 
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	randomiz()
func randomiz():
	level = get_parent().name
	match level:
		"level1":
			random = rng.randi_range(1, 3)
		"level2":
			random = rng.randi_range(1, 3)
		"level3":
			random = rng.randi_range(1, 3)
		"level4":
			random = rng.randi_range(1, 3)
		"level5":
			random = rng.randi_range(1, 4)
		"level6":
			random = rng.randi_range(1, 4)
		"level7":
			random = rng.randi_range(1, 5)
		"level8":
			random = rng.randi_range(1, 6)
		"level9":
			random = rng.randi_range(1, 6)
		"level10":
			random = rng.randi_range(1, 6)
	match random:
		1:
			grass()
		2:
			mushroom()
		3:
			fireflies()
		4:
			heart()
		5:
			crystal()
		6:
			flint()
func fireflies():
	animator.play("fireflies")
	add_to_group("fireflies")
func mushroom():
	animator.play("mushroom")
	add_to_group("mushroom")
func grass():
	animator.play("grass")
	add_to_group("grass")
func flint():
	animator.play("flint")
	add_to_group("flint")
func crystal():
	animator.play("iceCrystal")
	add_to_group("iceCrystal")
func heart():
	animator.play("heart")
	add_to_group("heart")
