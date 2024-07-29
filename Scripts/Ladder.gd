extends Node2D

var level
var nextLevel
# Called when the node enters the scene tree for the first time.
func _ready():
	level = get_parent().name
	match level:
		"level1":
			nextLevel = ("res://Scenes/Levels/level2.tscn")
		"level2":
			pass
		"level4":
			pass
		"level5":
			pass
		"level6":
			pass
		"level7":
			pass
		"level8":
			pass
		"level9":
			pass
		"level10":
			pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
