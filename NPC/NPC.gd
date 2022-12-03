extends Area2D

var playerInside = false
var speakCounter = 0
var dict = {
	0: """OI MATE! UR IN HELL INNIT BRUVNER ...""",
	1: """U SMELL AND U ADDED NUMBERS TO MAFFS ...""",
	2: """""",
}

var maxSpeech = len(dict) - 1

func _ready(): $AnimatedSprite.play("stand")

onready var SpeechBubble = get_node("Speech")
	
func _physics_process(delta):
	if playerInside and Input.is_action_just_pressed("interact"):
		speak()


func _on_NPC_body_entered(body):
	if body.name == "Player": playerInside = true

func _on_NPC_body_exited(body):
	if body.name == "Player": playerInside = false
	$AnimatedSprite.play("stand")
	speakCounter = 0
	SpeechBubble.text = ""

func speak():
	SpeechBubble.show()
	SpeechBubble.text = dict[speakCounter]
	if speakCounter < maxSpeech:
		$AnimatedSprite.play("speak")
		speakCounter += 1
	else:
		$AnimatedSprite.play("stand")
		speakCounter = 0
		SpeechBubble.text = ""
