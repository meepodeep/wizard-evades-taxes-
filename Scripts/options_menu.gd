extends Control


@onready var audio_stream_player = $AudioStreamPlayer


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0,value)

func _on_mute_toggled(toggled_on):
	AudioServer.set_bus_mute(0,toggled_on)

func _on_fullscreen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_volume_drag_ended(value_changed):
	audio_stream_player.play()
