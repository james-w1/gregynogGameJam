extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "A lone shopping trolley, abandoned in hell. ...",
		1: "Pick up the shopping trolley?",
		2: ""
	}
	options = [
		["yes", "no", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["shoppingTrolley", "shoppingTrolley"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])


func reparentTrolley():
	queue_free()
	lastBody.showTrolley(true)
	

func choiceAActions(num):
	reparentTrolley()
	
func choiceBActions(num):
	pass
