extends Area2D

var hasBeenEntered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_TrolleyZone_body_entered(body):
	if body.name == "Player":
		hasBeenEntered = true
		$specialOne.show()
		var player = get_node("../Player")
		player.showTrolley(false)
		player.karma += 200
