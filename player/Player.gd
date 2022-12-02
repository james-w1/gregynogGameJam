extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var last_direction = Vector2(0, 1)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

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
			"left":
				$AnimatedSprite.play("down")
				$AnimatedSprite.flip_h = true
			"down":
				$AnimatedSprite.play("down")
			"up":
				$AnimatedSprite.play("up")
	else: #if not moving
		$AnimatedSprite.play("default")

func _physics_process(delta):
	get_input()
	animate_gamer(velocity) # animate the player character
	velocity = move_and_slide(velocity) # move the player character

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
