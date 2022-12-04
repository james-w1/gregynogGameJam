extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "That cabbage! It's too strong! You must defeat it for me! ...",
		1: "But first, you'll need to learn how to be a fighter, and not a quitter. ...",
		2: "When the fight begins, you'll enter a new screen. ...",
		3: "Press X to advance past the first dialogue box. ...",
		4: "You'll be at a screen where a white bar is passing over several coloured markers. ...",
		5: "You need to press X to stop the white bar. ...",
		6: "The closer the bar is to the centre, the more damage you'll deal to your foe. ...",
		7: "You'll probably have to attack it between 12 and 18 times since you don't have a weapon. ...",
		8: "Afterwards, you'll need to dodge its counterattack! ...",
		9: "You'll have to move around to avoid the barrage of lethal attacks. ...",
		10: "If an attack is orange, you can move through it - but if you're standing still, you'll get hit.",
		11: "If the attack is blue, you must stay still, or you'll get hit. ...",
		12: "A light green attack won't hurt you! But it'll make you smell like lettuce. ...",
		13: "A dark green attack is a vegan on the hunt. They'll ignore you, so long as you don't smell like lettuce. ...",
		14: "A blue attack is a water attack! You'll take damage and become wet. It'll also wash off lettuce smell. ...",
		15: "A yellow attack is electric. It won't hurt you because your beard provides insulation. ...",
		16: "Unless you're wet, of course. ...",
		17: "A purple attack will... umm... I forgot what a purple attack does. ...",
		18: "A pink attack won't do anything. ...",
		19: "A magenta coloured attack will mark you for death!  ...",
		20: "You need to get hit by another one in less than ten seconds or you'll die. ...",
		21: "A teal coloured attack will switch off your PCs monitor for five seconds. ...",
		22: "A brown attack will polymorph you into a sheep. ...",
		23: "The golden attack will give you money! But it'll also turn your shirt red. ...",
		24: "If you don't like red, don't get hit! Or you'll be stuck wearing it forever. ...",
		25: "You don't have any armour, so getting hit a single time means death. ...",
		26: "You'll be unable to continue. ...",
		27: "The game will also uninstall itself, and delete your System32 folder. ...",
		28: "Good luck! ...",
		29: ""
	}
	options = [
		["Fight!", "Quit", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["trussStand", "trussSpeak"]
	questions = [29]
	$AnimatedSprite.play(animNames[0])


func choiceAActions(num):
	var player = get_node("../Player")
	var playerCam = get_node("../Player/Camera2D")
	var game = get_node("/root/Main/LettuceFight")
	
	# immobalise player
	player.setPlayingGame(true)
	player.hide()
	
	# play the game
	game.show()
	game.playing = true
	
	playerCam.zoom.x = 1
	playerCam.zoom.y = 1
	
func choiceBActions(num):
	pass
