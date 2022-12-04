extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "IM SATAN!",
		1: ""
	}
	options = [

	]
	maxSpeech = len(dict) - 1
	animNames = ["pigStand", "pigStand"]
	questions = []
	$AnimatedSprite.play(animNames[0])

func choiceAActions(num):
	pass
	
func choiceBActions(num):
	pass
