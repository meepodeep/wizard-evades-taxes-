extends Node2D

var item = load("res://Scenes/item_physics.tscn")
var inventory = []
var itemCount: int = 0
var itemPos = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	inventory.resize(64)
func _process(delta):
	var isPressedInv = Input.is_action_pressed("Inventory")
	if Input.is_action_just_pressed("Inventory"):
		for item in inventory:
			if item != null:
				instItem(itemPos)
				print("wawa")

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
