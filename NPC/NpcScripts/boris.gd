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
	animNames = ["borisStand", "borisSpeak"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])

func choiceAActions(num):
	print("play boris game")
	get_tree().change_scene("res://Minigames/BorisGame/BorisGame.tscn")
	var blockage = get_node("../RoadBlock1")
	blockage.clearBlock()
	
func choiceBActions(num):
	pass
