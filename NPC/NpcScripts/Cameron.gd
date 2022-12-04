extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "Help!! I was just tending to my pigs when they escaped their pen!",
		1: "Can you put them back in their pen for me?",
		2: "I'm sure me and the boys from Oxford can rustle up some pig head for you, if that's your thing.",
		3: ""
	}
	options = [
		["Yes", "No", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["davidStand", "davidSpeak"]
	questions = [3]
	$AnimatedSprite.play(animNames[0])


func choiceAActions(num):
	print("play cameron game")
	var blockage = get_node("../RoadBlock2")
	blockage.clearBlock()
	
func choiceBActions(num):
	pass
