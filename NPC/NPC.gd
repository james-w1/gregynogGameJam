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
	6: ""
}

var lastBody
var maxSpeech = len(dict) - 1

func _ready(): $AnimatedSprite.play("stand")

onready var SpeechBubble = get_node("Speech")
	
func _physics_process(delta):
	if playerInside and Input.is_action_just_pressed("interact"):
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

func speak():
	SpeechBubble.show()
	SpeechBubble.text = dict[speakCounter]
	if speakCounter < maxSpeech:
		$AnimatedSprite.play("speak")
		speakCounter += 1
	else:
		lastBody.canInteract(true) 
		$AnimatedSprite.play("stand")
		speakCounter = 0
		SpeechBubble.text = ""
