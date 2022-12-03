extends Area2D

var playerInside = false
var speakCounter = 0
var maxSpeech = 1
var dict = {
	0: """OI MATE! UR IN HELL INNIT BRUVNER ...""",
	1: """""",
}

onready var SpeechBubble = get_node("Speech")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	if playerInside and Input.is_action_just_pressed("interact"):
		speak()


func _on_NPC_body_entered(body):
	if body.name == "Player": playerInside = true

func _on_NPC_body_exited(body):
	if body.name == "Player": playerInside = false
	speakCounter = 0
	SpeechBubble.text = ""

func speak():
	SpeechBubble.show()
	SpeechBubble.text = dict[speakCounter]
	if speakCounter < maxSpeech:
		speakCounter += 1 
	else:
		speakCounter = 0
		SpeechBubble.text = ""
