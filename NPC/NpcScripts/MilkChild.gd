extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "My parents told me not to talk to strangers. ...",
		1: "Hey! What are you staring at my school milk for?",
		2: ""
	}
	options = [
		["Snatch\n milk", "Do not", -100, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["kidStand", "kidSpeak"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])
	$AnimatedSprite.flip_h = false
	$Shadow.hide()

func choiceAActions(num):
	startQuicktime = true

func choiceBActions(num):
	annoyedText = "Stay away from my school milk!"


onready var player = get_node("../Player")
onready var milk = get_node("Milk")
onready var notify = get_node("../Player/HUD/Notification")

func reparentMilk():
		self.remove_child(milk)
		player.add_child(milk)
		milk.set_owner(player)
		
func showAchievement():
	notify.show()
	var tween = get_node("../Player/HUD/Notification/Tween")
	tween.interpolate_property(notify, "position",
	Vector2(165, -50), Vector2(165, 50), 1,
	Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.interpolate_property(notify, "position", 
	Vector2(165, 50), Vector2(165, -50), 1,
	Tween.TRANS_LINEAR, Tween.EASE_OUT, 7)
	tween.start()

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
		if mashedX > 10:
				lastBody.playMashX(false)
				lastBody.setCanMove(true)
				lastBody.canInteract(true)
				annoyedText = "m... my milk..."
				wantsToSpeak = false
				reparentMilk()
				showAchievement()
				
				startQuicktime = false
		else:
			lastBody.playMashX(false)
			lastBody.setCanMove(true)
			lastBody.canInteract(true)
			wantsToSpeak = true
			annoyedText = "Stay away from my school milk !"
			mashedX = 0
			startQuicktime = false
