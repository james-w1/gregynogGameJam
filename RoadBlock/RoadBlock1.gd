extends Area2D

var isBlocked = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var player = get_node("../Player")

func _on_RoadBlock1_body_entered(body):
	if body.name == "Player" and isBlocked:
		player.showSpeech("Hmm, this way seems blocked.")

func _on_RoadBlock1_body_exited(body):
	if body.name == "Player" and isBlocked:
		player.hideSpeech()

func clearBlock():
	self.remove_child($StaticBody2D)
	isBlocked = false
