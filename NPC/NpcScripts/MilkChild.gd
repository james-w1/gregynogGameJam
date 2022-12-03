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
	startQuicktime = true

var quickTime = 5
var mashedX = 0
var startQuicktime = false
func _process(delta):
	if startQuicktime and quickTime > 0:
		lastBody.setCanMove(false)
		if Input.is_action_just_pressed("X"):
			mashedX += 1
		quickTime -= delta
	elif startQuicktime:
		if mashedX > 20:
				lastBody.setCanMove(true)
				annoyedText = "m... my milk..."
				wantsToSpeak = false
				print("milk stolen")
				startQuicktime = false
		else:
			lastBody.setCanMove(true)
			annoyedText = "stay away from my school milk"
			mashedX = 0
			startQuicktime = false
