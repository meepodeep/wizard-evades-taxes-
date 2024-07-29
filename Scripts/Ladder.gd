extends Node2D
@onready var timer = $Ladder/Timer

@onready var audio_stream_player_2d = $Ladder/AudioStreamPlayer2D
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


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		audio_stream_player_2d.play()
		timer.start(2)


func _on_timer_timeout():
	load(nextLevel)
