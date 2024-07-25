extends CharacterBody2D
signal AmmoOut
signal AmmoFilled
signal transferHitPosition
signal AddToInv
signal currentSpell
var SPEED
var angular_force = 50000
var canDash = 1.0
var dashSpeed = 500
var stopped = Vector2(0,0)
var ammoCount = 4
var SpellType = 1
var playerHealth = 20

@onready var animator = $AnimatedSprite2D
@onready var PotionAnimator = $GunParent/Gun/Potions
@onready var GunSprite = $GunParent/Gun

func _process(_delta):
	if playerHealth <= 0:
		print("died")
	if Global.inMenu == true:
		set_physics_process(false)
		self_modulate = Color(1, 1, 1, 0)
		GunSprite.self_modulate = Color(1, 1, 1, 0)
	else:
		set_physics_process(true)
		self_modulate = Color(1, 1, 1, 1)
		GunSprite.self_modulate = Color(1, 1, 1, 1)
		
	match ammoCount:
		0:
			AmmoOut.emit()
			PotionAnimator.frame = 4
		1:
			PotionAnimator.frame = 3
		2:
			PotionAnimator.frame = 2
		3:
			PotionAnimator.frame = 1
		4:
			AmmoFilled.emit()
			PotionAnimator.frame = 0

func _physics_process(delta):
	var direction = Input.get_vector("Left","Right","Up", "Down")
	var dash = Input.get_action_strength("Dash")
	var updown = Input.get_axis("Up","Down")
	# Get the input direction and handle the movement/deceleration.


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
		SPEED = 60000
		canDash -= 9 * delta
	else:
		SPEED = 9000
	if dash != 1:
		canDash = 1

	if direction:
			velocity = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
		velocity.y = move_toward(velocity.y, 0, 10)

	move_and_slide()
func ChangeSpell():
	currentSpell.emit(SpellType)
	match SpellType:
		1:
			PotionAnimator.play_backwards("Poison")
		3:
			PotionAnimator.play_backwards("Health")
		5:
			PotionAnimator.play_backwards("Light")
		2:
			PotionAnimator.play_backwards("Ice")
		4:
			PotionAnimator.play_backwards("Fire")
func reload():
	ammoCount = 4

func _on_spell_manager_fired():
	ammoCount -= 1 # Replace with function body.

func _on_ray_cast_2d_collision_point(posit):
	transferHitPosition.emit(posit) # Replace with function body.

func _on_area_2d_body_entered(body):
	emit_signal("AddToInv", body.get_groups())
	body.queue_free()


func _on_potion_brew_open_inv():
	Global.inMenu = !Global.inMenu



func _on_potion_brew_pass_load_fire():
	SpellType = 4
	reload()
	ChangeSpell()


func _on_potion_brew_pass_load_health():
	SpellType = 3
	reload()
	ChangeSpell()

func _on_potion_brew_pass_load_ice():
	SpellType = 2
	reload()
	ChangeSpell()

func _on_potion_brew_pass_load_light():
	SpellType = 5
	reload()
	ChangeSpell()

func _on_potion_brew_pass_load_poison():
	SpellType = 1
	reload()
	ChangeSpell()
