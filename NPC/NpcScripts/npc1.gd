extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "Oi mate! You! The one with the ugly beard! ...",
		1: "What are those gross rags you're wearing? ...",
		2: "You been rolling around in the mud or something? ...",
		3: "Clean yourself up a bit, you gross loser. ...",
		4: "Anyway, I need a fiver. Can you spot me? ...",
		5: ""
	}
	options = [
		["Yes", "No", 100, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["beggarStand", "beggarSpeak"]
	questions = [5]
	$AnimatedSprite.play(animNames[0])


func choiceAActions(_num):
	annoyedText = "Cheers mate."
	lastBody.removeFiver()
	wantsToSpeak = false
	playerForDeeds.addDeed("You gave money to the rude beggar. You would be unable to buy a third private ...")
	playerForDeeds.addDeed("jet, as all rich people have, but you helped him despite this. ...")

func choiceBActions(_num):
	annoyedText = "Should've expected that from the likes of you."
	wantsToSpeak = false
	playerForDeeds.addDeed("You refused to give money to the beggar. Your selfishness is unparalleled. ...")
