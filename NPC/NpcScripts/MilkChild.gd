extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "im a kid innit ...",
		1: "wait take ur hands off my school milk m8",
		2: ""
	}
	options = [
		["leave", "steal", 0, -100]
	]
	maxSpeech = len(dict) - 1
	animNames = ["kidStand", "kidSpeak"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])


func choiceAActions(num):
	annoyedText = "stay away from my school milk"
	
func choiceBActions(num):
	print("steal le milk")
	annoyedText = "m... my milk..."
	wantsToSpeak = false

var quickTime = 3
func _process(delta):
	pass
