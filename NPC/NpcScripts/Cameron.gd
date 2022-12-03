extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "im david cameron innit ...",
		1: "u wanna play a game?",
		2: ""
	}
	options = [
		["yes", "no", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["davidStand", "davidSpeak"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])


func choiceAActions(num):
	print("play cameron game")
	
func choiceBActions(num):
	pass
