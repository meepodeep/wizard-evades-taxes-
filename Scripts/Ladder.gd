extends Node2D
@onready var timer = $Timer
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
var level
var nextLevel
# Called when the node enters the scene tree for the first time.
func _ready():
	level = get_parent().name
	match level:
		"level1":
			nextLevel = ("res://Scenes/Levels/level2.tscn")
		"level2":
			nextLevel = ("res://Scenes/Levels/level3.tscn")
		"level3":
			nextLevel = ("res://Scenes/Levels/level4.tscn")
		"level4":
			nextLevel = ("res://Scenes/Levels/level5.tscn")
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

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		animated_sprite_2d.play("Climb")
		var player = get_tree().get_first_node_in_group("Player")
		player.visible = false 
		Global.canMove = false
		audio_stream_player_2d.play()
		timer.start(1.5)



func _on_timer_timeout():
	get_tree().change_scene_to_file(nextLevel)
