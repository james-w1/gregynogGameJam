extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "im boris innit ...",
		1: "u wanna play a game?",
		2: ""
	}
	options = [
		["yes", "no", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["npc1Stand", "npc1Speak"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])


func choiceAActions(num):
	print("play boris game")
	
func choiceBActions(num):
	pass
