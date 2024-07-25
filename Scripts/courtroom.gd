extends Node2D
@onready var label = $Label
@onready var CourtAnim = $AnimatedSprite2D
@onready var camera_2d = $Camera2D
@onready var the_hole = $TheHole
@onready var animated_sprite_2d_2 = $AnimatedSprite2D2
@onready var timer = $Timer
var isOpen = false

# Called when the node enters the scene tree for the first time.
# Called every frame. elta' is the elapsed time since the previous frame.
func _process(delta):
	if the_hole.visible != true:
		if animated_sprite_2d_2.position.y <= 6:
			animated_sprite_2d_2.stop()
			CourtAnim.play("default")
		else:
			animated_sprite_2d_2.position.y -= 70 * delta
	if !isOpen:
		if CourtAnim.frame == 1:
			label.text = "After a long deliberation..."
		if CourtAnim.frame == 2:
			label.text = "The council has decided..."
		if CourtAnim.frame == 3:
			label.text = "Due to your many attempts of tax evasion..."
		if CourtAnim.frame == 4:
			label.text = "To sentance you..."
		if CourtAnim.frame == 5:
			label.text = "To DEATH!"
		if CourtAnim.frame == 6:
			label.text = "Send them into the hole"
			the_hole.visible = true
	if camera_2d.position.y >= -115:
		camera_2d.position.y -= 40 * delta
	if isOpen:
		animated_sprite_2d_2.position.y += 200 * delta
	if CourtAnim.frame == 0:
		label.text = ""

func _on_the_hole_animation_finished():
	the_hole.pause()
	isOpen = true
	timer.start(0.3)
	
	label.text = ""
	CourtAnim.visible = false


func _on_animated_sprite_2d_animation_finished():
	the_hole.play("Open")
	CourtAnim.stop()
	


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")
