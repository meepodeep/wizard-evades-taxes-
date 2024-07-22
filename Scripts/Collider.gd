extends RigidBody2D
@onready var brewer = $"../Brewer"

var currentStatic = true
var currentBody
var potionItems = []
var itemsCount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)
	potionItems.resize(64)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("brewDebug"):
		brew()
	
	if Global.is_dragging:
		visible = true
	else:
		visible = false
	if !Global.is_dragging && currentBody != null && itemsCount != 64:
		currentBody.playAnim()
		potionItems[itemsCount] = currentBody.get_groups()
		itemsCount += 1
		currentBody.destroy()
		print(potionItems)


func _on_body_entered(body):
	currentBody = body

func brew():
	itemsCount = 0
	for ingredient in potionItems:
		if ingredient != null:
			if ingredient == [&"grass"]:
				pass
			else:
				brewer.play("Bad")
	resetBrew()
	print(potionItems)
			
func resetBrew():
	for ingredient in potionItems:
		potionItems[itemsCount] = null
		itemsCount += 1
		
		
func _on_body_exited(body):
	currentBody = null
