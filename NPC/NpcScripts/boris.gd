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
	$AnimatedSprite.flip_h = false

func choiceAActions(num):
	print("play boris game")
	
	# load all the nodes
	var player = get_node("../Player")
	var playerC = get_node("../Player/CollisionShape2D")
	var playerCam = get_node("../Player/Camera2D")
	var game = get_node("../BorisGame")
	var gamer = get_node("../BorisGame/PlayBoris")
	
	# hide everything
	self.hide()
	player.setPlayingGame(true)
	player.hide()
	playerC.disabled = true
	
	gamer.changeMovementLock(false)
	
	game.start()
	
	var bgm = get_node("../BackGroundMusic")
	var minigameBgm = get_node("../MiniGameMusic")
	bgm.stop()
	minigameBgm.play()
	
	#zoom out
	playerCam.zoom.x = 0.35
	playerCam.zoom.y = 0.35
	
	game.show()
	
	var blockage = get_node("../RoadBlock1")
	blockage.clearBlock()
	
	annoyedText = "Wow, that really hit the spot. Cheers!"
	wantsToSpeak = false
	
	playerForDeeds.addDeed("You helped Boris bowl over those kids. They deserved it really. ...")
	
func choiceBActions(num):
	pass
