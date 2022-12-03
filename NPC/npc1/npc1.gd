extends "res://NPC/NPC.gd"

func _ready(): 
	$AnimatedSprite.play("npc1Stand")
	SpeechBubble.hide()
	
	# set vars for this instance of the dude
	dict = {
		0: "OI MATE COME HERE",
		1: "U GOT A FIVER??",
		2: ""
	}
	options = [
		["yes", "no", 100, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["npc1Stand", "npc1Speak"]
	questions = [2]

func choiceAActions(num):
	lastBody.removeFiver()
	
func choiceBActions(num):
	pass
