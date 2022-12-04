extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "Hey! I'm about ready to bowl over some kids, but I'm so exhausted from my comedown after ...",
		1: "that last party during COVID that I can't do it alone. Can you lend me a hand?",
		2: ""
	}
	options = [
		["Yes", "No", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["borisStand", "borisSpeak"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])

func choiceAActions(num):
	print("play boris game")
	
	# load all the nodes
	var player = get_node("../Player")
	var playerCam = get_node("../Player/Camera2D")
	var game = get_node("../BorisGame")
	var gamer = get_node("../BorisGame/PlayBoris")
	var bg = get_node("../BorisGame/ParallaxBackground/ParallaxLayer")
	
	# hide everything
	self.hide()
	player.setPlayingGame(true)
	player.canInteract(false)
	player.hide()
	
	gamer.changeMovementLock(false)
	bg.show()
	
	#zoom out
	playerCam.zoom.x = 0.7
	playerCam.zoom.y = 0.7
	
	game.show()
	
	var blockage = get_node("../RoadBlock1")
	blockage.clearBlock()
	
func choiceBActions(num):
	pass
