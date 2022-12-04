extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "A rusty shopping trolley. One of the wheels doesn't turn properly. ...",
		1: "You think it was stolen from a nearby Morrisons - the only supermarket here in hell.",
		2: "Pick up the shopping trolley?",
		3: ""
	}
	options = [
		["yes", "no", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["shoppingTrolley", "shoppingTrolley"]
	questions = [3]
	$AnimatedSprite.play(animNames[0])
	$Shadow.hide()

func reparentTrolley():
	if !lastBody.hasPig:
		queue_free()
		lastBody.showTrolley(true)
	

func choiceAActions(num):
	reparentTrolley()
	
func choiceBActions(num):
	pass
