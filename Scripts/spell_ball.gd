extends Node2D

@onready var animatorBall = $AnimatedSprite2D

func light():
	animatorBall.play("lightBall")
func fire():
	animatorBall.play("fireBall")
func health():
	animatorBall.play("healthBall")
func ice():
	animatorBall.play("iceBall")
func poison():
	animatorBall.play("poisonBall")
# Called every frame. 'delta' is the elapsed time since the previous frame.
