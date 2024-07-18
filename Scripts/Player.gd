extends CharacterBody2D

var SPEED = 100.0
var angular_force = 50000
var canDash = 1.0
var dashSpeed = 500
var stopped = Vector2(0,0)
@onready var animator = $AnimatedSprite2D
@onready var GunSprite = $GunParent/Gun
# Get the gravity from the project settings to be synced with RigidBody nodes.)
func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("Left","Right","Up", "Down")
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dash = Input.get_action_strength("Dash")
	var updown = Input.get_axis("Up","Down")

	if velocity == stopped:
		animator.play("idleForward")
		GunSprite.z_index = 1
	if updown == 1:
		GunSprite.z_index = 1
		animator.play("RunForward")
	if updown == -1:
		GunSprite.z_index = -2
		animator.play("RunBackward")

	if dash == 1 && canDash >=0:
		SPEED = 600
		canDash -=.1
	else:
		SPEED = 100
	if dash != 1:
		canDash = 1

	if direction:
			velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
		velocity.y = move_toward(velocity.y, 0, 10)

	move_and_slide()
