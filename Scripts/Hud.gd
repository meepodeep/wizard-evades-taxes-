extends CanvasLayer
@onready var barAnim = $MarginContainer/BarAnim


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_dps_to_bar(dps):
	
	barAnim.frame -= dps
