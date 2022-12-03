extends Area2D

var isBlocked = true
var firstVisit = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var player = get_node("../Player")

func _on_RoadBlock1_body_entered(body):
	if body.name == "Player":
		if isBlocked:
			player.showSpeech("Hmm, this way seems blocked.")
		elif firstVisit:
			player.showSpeech("Guess that roadblock cleared up.")

func _on_RoadBlock1_body_exited(body):
	if body.name == "Player":
		if isBlocked:
			player.hideSpeech()
		elif firstVisit:
			firstVisit = false
			player.hideSpeech()

func clearBlock():
	self.remove_child($StaticBody2D)
	isBlocked = false
