extends Area2D

var playerInside = false

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

func speak():
	print("uwu")
