extends CharacterBody2D

const SPEED = 300.0
var angular_force = 50000
const DashSpeed = 600
# Get the gravity from the project settings to be synced with RigidBody nodes.)
func _physics_process(delta):
	look_at(get_global_mouse_position())
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("Left","Right","Up", "Down")
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dash = Input.get("Dash")
	if dash:
		print("dash")
		velocity = direction * dash * DashSpeed
	if direction:

		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 50)
		velocity.y = move_toward(velocity.y, 0, 50)
	move_and_slide()
