extends RigidBody2D

@onready var animator = $PhysicsItemAnimator

var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPos: Vector2
var level = ""
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("Fire"):
			initialPos = global_position
			freeze = true
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("Fire"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("Fire"):
			freeze = false
			Global.is_dragging = false
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

func _on_mouse_shape_exited(shape_idx):
	if not Global.is_dragging:
		draggable = false

func fireflies():
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
