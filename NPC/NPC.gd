extends Area2D

var playerInside = false
var speakCounter = 0
var dict = {
	0: """François Viète, the guy who put letters in maths. You've been selected as a potential candidate for ...""",
	1: """'less evil prime minister than Rishi Sunak'. The trials ahead will test your dedication to the ...""",
	2: """people of Britain. Failure means banishment back to the circle of hell from whence you came. Good luck.""",
	3: "give the kid an icecream?",
	4: "do u wanna kill the child?",
	5: ""
}
var questions = [4, 5]
# options to choose from
# [choiceA, choiceB, karmaA, karmaB]
var options = [
	["yes", "no", 100, 0],
	["save", "kill", 0, -100]
]

var lastBody
var maxSpeech = len(dict) - 1

var wantsToSpeak = true
var annoyedText = "go away"

var choosing = false
var mouseInChoiceA = false
var mouseInChoiceB = false
var choicesCounter = 0

onready var SpeechBubble = get_node("SpeechBubble")
onready var SpeechBubbleText = get_node("SpeechBubble/Speech")

# npcs have 2 frames a standing and a speaking
var animNames = ["kidStand", "kidSpeak"]

# idle anim
func _ready(): 
	$AnimatedSprite.play(animNames[0])
	SpeechBubble.hide()
	
func _physics_process(_delta):
	# Speech only proceeds if the player is interacting and is not choosing
	if playerInside and Input.is_action_just_pressed("interact") and !choosing:
		lastBody.canInteract(false) 
		speak()

func _on_NPC_body_entered(body):
	lastBody = body
	if body.name == "Player": playerInside = true
	body.canInteract(true)

func _on_NPC_body_exited(body):
	lastBody = body
	if body.name == "Player": playerInside = false
	body.canInteract(false)
	$AnimatedSprite.play(animNames[0])
	speakCounter = 0
	
	if !choosing:
		SpeechBubble.hide()
		SpeechBubbleText.text = ""
		choicesCounter = 0

func speak():
	if wantsToSpeak:
		SpeechBubble.show()
		if speakCounter < maxSpeech:
			SpeechBubbleText.text = dict[speakCounter]
			$AnimatedSprite.play(animNames[1])
			speakCounter += 1
			
			# add this here for choices
			if speakCounter in questions:
				choice()
		else:
			lastBody.canInteract(true) 
			$AnimatedSprite.play(animNames[1])
			speakCounter = 0
			SpeechBubble.hide()
			SpeechBubbleText.text = ""
	else:
		SpeechBubble.show()
		SpeechBubbleText.text = annoyedText
			
# Choices Logic Below
func choice():
	choosing = true
	
	# setup choices on screen
	$ChoiceA/ChoiceALabel.text = options[choicesCounter][0]
	$ChoiceB/ChoiceBLabel.text = options[choicesCounter][1]

	lastBody.setCanMove(false)

func _on_ChoiceA_mouse_entered(): mouseInChoiceA = true
func _on_ChoiceA_mouse_exited(): mouseInChoiceA = false

func _on_ChoiceA_input_event(_viewport, _event, _shape_idx):
	if mouseInChoiceA and Input.is_action_just_pressed("mouse1") and choosing:
		# do actions associated with choice
		addKarma(options[choicesCounter][2])
		choiceAActions(choicesCounter)
		
		# flush all choice logic
		resetChoicesLogic()

func _on_ChoiceB_input_event(_viewport, _event, _shape_idx):
	if mouseInChoiceB and Input.is_action_just_pressed("mouse1") and choosing:
		# do actions associated with choice
		addKarma(options[choicesCounter][3])
		choiceBActions(choicesCounter)
		
		# flush all choice logic
		resetChoicesLogic()

func resetChoicesLogic():
	if choicesCounter < len(options) - 1:
		choicesCounter += 1
		resetChoiceLabels()
		speak()
	else:
		choosing = false
		resetChoiceLabels()
		lastBody.setCanMove(true)
		speak()
	
func addKarma(karma):
	lastBody.karma += karma
	
func choiceAActions(_num):
	pass
	
func choiceBActions(_num):
	pass
	
func resetChoiceLabels():
	$ChoiceA/ChoiceALabel.text = ""
	$ChoiceB/ChoiceBLabel.text = ""

func _on_ChoiceB_mouse_entered(): mouseInChoiceB = true
func _on_ChoiceB_mouse_exited(): mouseInChoiceB = false
