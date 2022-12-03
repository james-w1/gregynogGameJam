extends Area2D

var playerInside = false
var speakCounter = 0
var dict = {
	0: """François Viète, the guy who put letters in maths.""",
	1: """ You've been selected as a potential candidate for ... """,
	2: """'less evil prime minister than Rishi Sunak'.""",
	3: """The trials ahead will test your dedication to the ...""",
	4: """people of Britain. Failure means banishment back to the circle ...""",
	5: """of hell from whence you came. Good luck.""",
	6: "give the kid an icecream?",
	7: "do u wanna kill the child?",
	8: ""
}

var lastBody
var maxSpeech = len(dict) - 1

var choosing = false
var mouseInChoiceA = false
var mouseInChoiceB = false
# options to choose from
# [choiceA, choiceB, karmaA, karmaB]
var options = [["yes", "no", 100, 0], ["kill", "save", -100, 0]]
var choicesCounter = 0

# idle anim
func _ready(): $AnimatedSprite.play("stand")

onready var SpeechBubble = get_node("Speech")
	
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
	$AnimatedSprite.play("stand")
	speakCounter = 0
	SpeechBubble.text = ""
	
	choicesCounter = 0

func speak():
	SpeechBubble.show()
	SpeechBubble.text = dict[speakCounter]
	if speakCounter < maxSpeech:
		$AnimatedSprite.play("speak")
		speakCounter += 1
		
		# add this here for choices
		if speakCounter == 7 or speakCounter ==  8:
			choice()
	else:
		lastBody.canInteract(true) 
		$AnimatedSprite.play("stand")
		speakCounter = 0
		SpeechBubble.text = ""
		
# Choices Logic Below
func choice():
	choosing = true
	# setup choices on screen
	$ChoiceA/ChoiceALabel.text = options[choicesCounter][0]
	$ChoiceB/ChoiceBLabel.text = options[choicesCounter][1]


func _on_ChoiceA_mouse_entered(): mouseInChoiceA = true
func _on_ChoiceA_mouse_exited(): mouseInChoiceA = false

func _on_ChoiceA_input_event(_viewport, _event, _shape_idx):
	if mouseInChoiceA and Input.is_action_just_pressed("mouse1") and choosing:
		# do actions associated with choice
		addKarma(options[choicesCounter][2])
		print("chose A")
		
		# flush all choice logic
		resetChoicesLogic()

func _on_ChoiceB_input_event(_viewport, _event, _shape_idx):
	if mouseInChoiceB and Input.is_action_just_pressed("mouse1") and choosing:
		# do actions associated with choice
		addKarma(options[choicesCounter][3])
		print("chose B")
		
		# flush all choice logic
		resetChoicesLogic()

func resetChoicesLogic():
	choosing = false
	$ChoiceA/ChoiceALabel.text = ""
	$ChoiceB/ChoiceBLabel.text = ""
	choicesCounter += 1
	
func addKarma(karma):
	lastBody.karma += karma

func _on_ChoiceB_mouse_entered(): mouseInChoiceB = true
func _on_ChoiceB_mouse_exited(): mouseInChoiceB = false
