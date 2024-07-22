extends RigidBody2D
@onready var brewer = $"../Brewer"

var currentStatic = true
var currentBody
var potionItems = []
var itemsCount = 0
var hasGrass = false
var hasMushroom = false
var hasCrystal = false
var hasFireflies = false
var hasFlint = false
var hasHeart = false
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
	print("wawa")
	currentBody = body

func brew():
	itemsCount = 0
	for ingredient in potionItems:
		if ingredient != null:
			if ingredient == [&"grass"]:
				hasGrass = true
			else:
				match ingredient:
					[&"mushroom"]:
						print("hasMushroom")
						hasMushroom = true
					[&"flint"]:
						print("hasMushroom")
						hasFlint = true
					[&"fireflies"]:
						print("hasMushroom")
						hasFireflies = true
					[&"iceCrystal"]:
						print("hasMushroom")
						hasCrystal = true
					[&"heart"]:
						print("hasMushroom")
						hasHeart = true
	
	finBrew()
	print(potionItems)
			
func resetBrew():
	for ingredient in potionItems:
		potionItems[itemsCount] = null
		itemsCount += 1
	itemsCount = 0
		
func _on_body_exited(_body):
	currentBody = null

func finBrew():
	if hasGrass:
		if hasCrystal:
			brewer.play("Ice")
		if hasFireflies:
			brewer.play("Light")
		if hasFlint:
			brewer.play("Fire")
		if hasMushroom:
			brewer.play("Poison")
		if hasHeart:
			brewer.play("Health")
	else:
		brewer.play("Bad")
	hasMushroom = false
	hasFlint = false
	hasFireflies = false
	hasCrystal = false
	hasHeart = false
	resetBrew()
