extends "res://NPC/NPC.gd"

func _ready(): 
	# set vars for this instance of the dude
	dict = {
		0: "PLEASE HELP ME! I'M STUCK IN QUICKSAND, I'M GONNA DIE! ...",
		1: "Help him?",
		2: ""
	}
	options = [
		["Help", "Do not", 300, -200]
	]
	maxSpeech = len(dict) - 1
	animNames = ["npc1Stand", "npc1Speak"]
	questions = [2]
	$AnimatedSprite.play(animNames[0])

var rescueAnim = false

func choiceAActions(_num):
	rescueAnim = true
	annoyedText = "Thank you so much, I cant wait to see my kids again"
	wantsToSpeak = false
	playerForDeeds.addDeed("You helped Johnnothy out of the quicksand. He would've died otherwise. ...")
	playerForDeeds.addDeed("He didn't pay attention to nature programs that explain how to get out. ...")
	
func choiceBActions(_num):
	annoyedText = "WHAT?! YOU MONSTER! I HAVE A FAMILY!"
	wantsToSpeak = false
	playerForDeeds.addDeed("You refused to help Jimmothy out of the quicksand. ...")
	playerForDeeds.addDeed("He's going to be stuck there until the end of time. ...")

var upTime = 1
var downTime = 1
var speed = 100
var rotSpeed = 800
func _process(delta):
	if rescueAnim:
		if upTime > 0:
			upTime -= delta
			self.position.y -= speed * delta
			self.rotation_degrees -= rotSpeed * delta
		if upTime <= 0 and downTime > 0:
			downTime -= delta
			self.position.y += speed * delta
			self.rotation_degrees = 0
			
		if upTime <= 0 and downTime <= 0:
			self.rotation_degrees = 0
			rescueAnim = false

		$Top.hide()
		$Bottom.hide()
