extends CharacterBody2D

var SPEED = 300.0
var angular_force = 50000
var canDash = true
var dashSpeed = 500
# Get the gravity from the project settings to be synced with RigidBody nodes.)
func _physics_process(delta):

	look_at(get_global_mouse_position())
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("Left","Right","Up", "Down")
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dash = Input.get_action_strength("Dash")
	if dash:
		SPEED = 600
	else:
		SPEED = 300
	if direction:
			velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 50)
		velocity.y = move_toward(velocity.y, 0, 50)

	move_and_slide()
