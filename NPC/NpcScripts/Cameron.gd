extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "Help!! I was just tending to my pigs when they escaped their pen!",
		1: "Can you put them back in their pen over on the right for me?",
		2: "I'm sure me and the boys from Oxford can rustle up some pig head for you, if that's your thing.",
		3: ""
	}
	options = [
		["Sure", "No", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["davidStand", "davidSpeak"]
	questions = [3]
	$AnimatedSprite.play(animNames[0])
	$AnimatedSprite.flip_h = true


func choiceAActions(num):
	print("play cameron game")
	playerForDeeds.addDeed("You rounded up David Cameron's pigs. I'm sure he and the Piers Gaveston Society will be grateful. ...")
	
func choiceBActions(num):
	pass
