extends Node2D

var item = load("res://Scenes/Items/item_physics.tscn")
var inventory = []
var invItems = []
var invItemCount: int = 0
var itemCount: int = 0
var itemPos = Vector2(140,0)
signal passLoadIce
signal passLoadFire
signal passLoadHealth
signal passLoadLight
signal passLoadPoison
signal OpenInv
# Called when the node enters the scene tree for the first time.
func _ready():
	inventory.resize(64)
	invItems.resize(64)
func _process(_delta):
	if !Global.inMenu:
		invItemCount = 0
		for item in invItems:
			if item != null:
				destroy(item)
	if Input.is_action_just_pressed("Inventory"):
		visible = !visible
		emit_signal("OpenInv")
		if Global.inMenu:
			for item in inventory:
				if item != null:
					match item:
						[&"grass"]:
							instItem(itemPos,6)
						[&"mushroom"]:
							instItem(itemPos,2)
						[&"flint"]:
							instItem(itemPos,1)
						[&"fireflies"]:
							instItem(itemPos,5)
						[&"iceCrystal"]:
							instItem(itemPos,3)
						[&"heart"]:
							instItem(itemPos,4)

	
func _on_player_add_to_inv(bodyGroup):
	if itemCount != 64:
		inventory[itemCount] = bodyGroup
		itemCount +=1
		
		
func instItem(pos, itemType):
	var instanceItem = item.instantiate()
	match itemType:
		1:
			instanceItem.flint()
		2:
			instanceItem.mushroom()
		3:
			instanceItem.crystal()
		4:
			instanceItem.heart()
		5:
			instanceItem.fireflies()
		6:
			instanceItem.grass()
	instanceItem.position = pos
	add_child(instanceItem)



func _on_area_2d_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	invItems[invItemCount] = body
	invItemCount +=1

func destroy(thing):
	thing.queue_free()
func deleteItem(itemToDel):
	var didDelete = false
	var index = 0
	for items in inventory:
		if items != null:
			if items == itemToDel:
				if didDelete == false:
					inventory[index] = null 
				didDelete = true
		index += 1
	index = 0


func _on_brew_collider_remove_inv(itemCalled):
	deleteItem(itemCalled)


func _on_brew_collider_load_fire():
	passLoadFire.emit()


func _on_brew_collider_load_health():
	passLoadHealth.emit()


func _on_brew_collider_load_ice():
	passLoadIce.emit()


func _on_brew_collider_load_light():
	passLoadLight.emit()


func _on_brew_collider_load_poison():
	passLoadPoison.emit()
