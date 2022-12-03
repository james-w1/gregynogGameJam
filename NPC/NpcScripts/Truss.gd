extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "im trussy innit ...",
		1: "u wanna play a game?",
		2: ""
	}
	options = [
		["yes", "no", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["trussStand", "trussSpeak"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])


func choiceAActions(num):
	print("play truss game")
	
func choiceBActions(num):
	pass
