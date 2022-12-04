extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "Pick Up the Pig?",
		1: ""
	}
	options = [
		["yes", "no", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["pigStand", "pigStand"]
	questions = [1]
	$AnimatedSprite.play(animNames[0])
	$Shadow.hide()

func reparentPig():
	if lastBody.hasPig:
		$SpeechBubble.show()
		$SpeechBubble/Speech.text = "You are carrying to many pigs!"
	elif lastBody.hasTrolley:
		$SpeechBubble.show()
		$SpeechBubble/Speech.text = "The pig wont fit in the Trolley"
	else:
		queue_free()
		lastBody.togglePiggy(true)

func choiceAActions(num):
	reparentPig()
	
func choiceBActions(num):
	pass
