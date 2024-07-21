extends RigidBody2D

@onready var animator = $AnimatedSprite2D

var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPos: Vector2
var level = ""
var random 
var rng = RandomNumberGenerator.new()
func _ready():
	randomiz()
	
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("Fire"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("Fire"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("Fire"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self,"position",body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
func _on_body_entered(body:RigidBody2D):
	if body.is_in_group("Droppable"):
		is_inside_droppable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref 
func _on_body_exited(body):
	if body.is_in_group("Droppable"):
		is_inside_droppable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
func _on_mouse_shape_entered(shape_idx):
	if not Global.is_dragging:
		draggable= true
		scale = Vector2(1.05, 1.05)
func _on_mouse_shape_exited(shape_idx):
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1,1)
func randomiz():
	match level:
		"level1":
			random = rng.randi_range(0, 2)
		"level2":
			random = rng.randi_range(0, 3)
		"level3":
			random = rng.randi_range(0, 3)
		"level4":
			random = rng.randi_range(0, 3)
		"level5":
			random = rng.randi_range(0, 4)
		"level6":
			random = rng.randi_range(0, 4)
		"level7":
			random = rng.randi_range(0, 5)
		"level8":
			random = rng.randi_range(0, 5)
		"level9":
			random = rng.randi_range(0, 5)
		"level10":
			random = rng.randi_range(0, 5)
	match random:
		1:
			grass()
		2:
			mushroom()
		3:
			fireflies()
		4:
			heart()
		5:
			crystal()
		6:
			flint()
func fireflies():
	animator.play("fireflies")
	add_to_group("fireflies")
func mushroom():
	animator.play("mushroom")
	add_to_group("mushroom")
func grass():
	animator.play("grass")
	add_to_group("grass")
func flint():
	animator.play("flint")
	add_to_group("flint")
func crystal():
	animator.play("iceCrystal")
	add_to_group("iceCrystal")
func heart():
	animator.play("heart")
	add_to_group("heart")
