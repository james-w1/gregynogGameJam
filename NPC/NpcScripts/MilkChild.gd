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
	$AnimatedSprite.flip_h = false

func choiceAActions(num):
	annoyedText = "stay away from my school milk"
	
func choiceBActions(num):
	print("steal le milk")
	startQuicktime = true

onready var player = get_node("../Player")
onready var milk = get_node("Milk")
onready var notify = get_node("../Player/HUD/Notification")

func reparentMilk():
		self.remove_child(milk)
		player.add_child(milk)
		milk.set_owner(player)
		
func sendMessage():
	notify.text = "stolen!"

var quickTime = 5
var mashedX = 0
var startQuicktime = false
func _process(delta):
	if startQuicktime and quickTime > 0:
		lastBody.playMashX(true)
		lastBody.setCanMove(false)
		lastBody.canInteract(false)
		wantsToSpeak = false
		annoyedText = "STOP!"
		if Input.is_action_just_pressed("X"):
			mashedX += 1
		quickTime -= delta
	elif startQuicktime:
		if mashedX > 20:
				lastBody.playMashX(false)
				lastBody.setCanMove(true)
				lastBody.canInteract(true)
				annoyedText = "m... my milk..."
				wantsToSpeak = false
				reparentMilk()
				sendMessage()
				startQuicktime = false
		else:
			lastBody.playMashX(false)
			lastBody.setCanMove(true)
			lastBody.canInteract(true)
			wantsToSpeak = true
			annoyedText = "stay away from my school milk"
			mashedX = 0
			startQuicktime = false
