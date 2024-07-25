extends Node2D
@onready var label = $Label
@onready var CourtAnim = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	CourtAnim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if CourtAnim.frame == 50:
		label.text = "after a long deliberation..."
	if CourtAnim.frame == 51:
		label.text = "the council has decided..."
	if CourtAnim.frame == 52:
		label.text = "due to your many attempts of tax evasion..."
	if CourtAnim.frame == 53:
		label.text = "to sentance you..."
	if CourtAnim.frame == 54:
		label.text = "to DEATH!"
	if CourtAnim.frame == 55:
		label.text = "Send them into the hole"
