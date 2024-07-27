extends CanvasLayer
@onready var barAnim = $MarginContainer/BarAnim
var currentBarLevel = 0
func _ready():
	_3_hearts()
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
func _3_hearts():
	barAnim.play("3Hearts")
	barAnim.pause()
func _4_hearts():
	barAnim.play("4Hearts")
	barAnim.pause()
func _5_hearts():
	barAnim.play("5Hearts")
	barAnim.pause()
func _6_hearts():
	barAnim.play("6Hearts")
	barAnim.pause()
	


func _on_player_gained_vial():
	currentBarLevel +=1
	match currentBarLevel:
		0:
			_3_hearts()
		1:
			_4_hearts()
		2:
			_5_hearts()
		3:
			_6_hearts()
