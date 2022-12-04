extends "res://NPC/NPC.gd"

var firstEncounter = true
var returnedCart = false

func _ready():
	# set vars for this instance of the dude
	dict = {
		0: "François Viète! You have completed the tasks essential to your resurrection. ...",
		1: "Now. You will be judged. ...",
		2: "The collective weight of your sins will be measured. ...",
		3: "Is there anything else you'd like to do before we begin? ...",
		4: ""
	}
	options = [
		["I'm\n ready", "Not\n yet", 0, 0]
	]
	maxSpeech = len(dict) - 1
	animNames = ["satanStand", "satanStand"]
	questions = [4]
	$AnimatedSprite.play(animNames[0])
	$AnimatedSprite.flip_h = false
	$Shadow.hide()

func choiceAActions(num):
	recieveJudgement()
	if !firstEncounter:
		$cart.show()
		playerForDeeds.showTrolley(false)
		speakCounter = 6
	firstEncounter = false
	
func choiceBActions(num):
	pass

func recieveJudgement():
	
	questions = []
	dict = {}
	speakCounter = 0
	if playerForDeeds.hasTrolley:
		dict[int(len(dict))] = "First - Seriously? You stole the Morrisons shopping trolley? Why? It's totally useless. ..."
		dict[int(len(dict))] = "Could you be making some kind of sophisticated political statement? ..."
		dict[int(len(dict))] = "Are you campaigning against the £1 coin cost of collecting a trolley outside the supermarket? ..."
		dict[int(len(dict))] = "...No. ..."
		dict[int(len(dict))] = "You wanted to see if I'd comment on the fact that you're wearing the shopping trolley on your head. ..."
		dict[int(len(dict))] = "Clearly you can't be trusted with this. Give it here. ..."
		questions = [int(len(dict) - 1)]
		options = [
			["yes", "no(yes)", 0, 0]
		]
	for deed in playerForDeeds.deeds:
		dict[int(len(dict))] = deed
	if !returnedCart:
		dict[int(len(dict))] = "You didn't put back the lonely shopping trolley. Your sloth knows no bounds. ..."
	
	if len(playerForDeeds.deeds) == 11:
		dict[int(len(dict))] = "You've demonstrated your worth. MI6 agents will arrive shortly to collect you. ..."
		dict[int(len(dict))] = "In the meantime, feel free to explore hell."
		
	else:
		dict[int(len(dict))] = "Your thirst for power and disregard for the people mark you as an unsuitable candidate. Begone! "
	
	# add blank end thing
	dict[int(len(dict) + 1)] = ""
	maxSpeech = len(dict) - 1

func _process(delta):
	pass
