extends Node2D

var item = load("res://Scenes/item_physics.tscn")
var inventory = []
var invItems = []
var invItemCount: int = 0
var itemCount: int = 0
var itemPos = Vector2(0,0)
signal OpenInv
# Called when the node enters the scene tree for the first time.
func _ready():
	inventory.resize(64)
	invItems.resize(64)
func _process(delta):
	if !Global.inMenu:
		for item in invItems:
			if item != null:
				destroy(item)
	if Input.is_action_just_pressed("Inventory"):
		visible = !visible
		emit_signal("OpenInv")
		if Global.inMenu:
			for item in inventory:
				if item != null:
					instItem(itemPos)

	
func _on_player_add_to_inv(bodyGroup):
	if itemCount != 64:
		inventory[itemCount] = bodyGroup
		itemCount +=1
		print(inventory)
		
		
func instItem(pos):
	var instanceItem = item.instantiate()
	instanceItem.fireflies()
	instanceItem.position = pos
	add_child(instanceItem)



func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	invItems[invItemCount] = body
	invItemCount +=1
	print("weweww")

func destroy(thing):
	thing.queue_free()
