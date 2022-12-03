extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "OI MATE COME HERE ...",
		1: "U GOT A FIVER??",
		2: ""
	}
	options = [
		["yes", "no", 100, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["beggarStand", "beggarSpeak"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])


func choiceAActions(_num):
	annoyedText = "cheers m8y"
	lastBody.removeFiver()
	wantsToSpeak = false
	
func choiceBActions(_num):
	annoyedText = "come back when ur a bit nicer"
	wantsToSpeak = false
