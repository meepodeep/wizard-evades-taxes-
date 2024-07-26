extends CanvasLayer
@onready var barAnim = $MarginContainer/BarAnim
func _ready():
	barAnim.play("4Hearts")
	barAnim.pause()
func _process(delta):
	if barAnim.animation == "3Hearts":
		if barAnim.frame == 5:
			print("deathed")
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	if barAnim.animation == "4Hearts":
		if barAnim.frame == 8:
			print("deathed")
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	if barAnim.animation == "5Hearts":
		if barAnim.frame == 10:
			print("deathed")
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	if barAnim.animation == "6Hearts":
		if barAnim.frame == 12:
			print("deathed")
			get_tree().change_scene_to_file("res://Scenes/menu.tscn")
func _on_player_dps_to_bar(dps):
	barAnim.frame -= dps
	
