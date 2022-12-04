extends KinematicBody2D

export (int) var speed = 200

var camera2d
var velocity = Vector2()
var last_direction = Vector2(0, 1)
var karma = 0.0
var canMove = true
var playingGame = false
var hasTrolley
var hasPig = false

var deeds = []

func get_input():
	if canMove:
		velocity = Vector2()
		if Input.is_action_pressed("right"):
			velocity.x += 1
		if Input.is_action_pressed("left"):
			velocity.x -= 1
		if Input.is_action_pressed("down"):
			velocity.y += 1
		if Input.is_action_pressed("up"):
			velocity.y -= 1
	else:
		velocity.x = 0
		velocity.y = 0

	velocity = velocity.normalized() * speed
	
func vector_to_direction(direction: Vector2):
	var norm_direction = direction.normalized()
	if norm_direction.y >= 0.707:
		return "down"
	elif norm_direction.y <= -0.707:
		return "up"
	elif norm_direction.x <= -0.707:
		return "left"
	elif norm_direction.x >= 0.707:
		return "right"
	return "down"
	
func animate_gamer(direction: Vector2):
	if direction != Vector2.ZERO: # if moving
		# update last_direction
		last_direction = direction
		
		# Match the last direction to the way the player is facing and flip
		match vector_to_direction(last_direction):
			"right":
				$AnimatedSprite.play("down")
				$AnimatedSprite.flip_h = false
				$Shadow.flip_h = false
			"left":
				$AnimatedSprite.play("down")
				$AnimatedSprite.flip_h = true
				$Shadow.flip_h = true
			"down":
				$AnimatedSprite.play("down")
			"up":
				$AnimatedSprite.play("up")
	else: #if not moving
		$AnimatedSprite.play("default")

func _physics_process(_delta):
	get_input()
	animate_gamer(velocity) # animate the player character
	if !playingGame:
		velocity = move_and_slide(velocity) # move the player character
	#camera2d = get_node("Camera2D")
	#$HUD/Karma.text = str(karma) # update karma score on hud for debug

# Called by Area2D objects to notify the player if they can interact
func canInteract(toggle):
	if toggle:
		$InteractionMsg.show()
	else:
		$InteractionMsg.hide()

func setCanMove(boolean):
	canMove = boolean
	
func setPlayingGame(boolean):
	playingGame = boolean
	
func removeFiver():
	$HUD/Money.text = "Cash Money: £730,455,117"

func playMashX(boolean):
	if boolean:
		$mashX.show()
		$mashX.play()
	else:
		$mashX.hide()
		$mashX.stop()

func showTrolley(boolean):
	if boolean:
		$Trolley.show()
		hasTrolley = true
	else:
		$Trolley.hide()
		hasTrolley = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$InteractionMsg.hide()
	$mashX.hide()
	#$HUD/Karma.text = str(karma)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
func showSpeech(text):
	$SpeechBubble.show()
	$SpeechBubble/Speech.text = text
	
func hideSpeech():
	$SpeechBubble.hide()

func togglePiggy(boolean):
	hasPig = boolean
	if hasPig:
		$HeadPig.show()
	else:
		$HeadPig.hide()

func _on_PigZone_body_entered(body):
	if hasPig:
		$HeadPig.hide()
		$"/root/Main/PigZone".addPig()
		hasPig = false

func addDeed(string):
	deeds.append(string)
	print(deeds)
