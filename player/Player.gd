extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		$AnimatedSprite.play('Up')
		velocity.x += 1
	if Input.is_action_pressed("left"):
		$AnimatedSprite.play('Up')
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		$AnimatedSprite.play('Down')
		velocity.y += 1
	if Input.is_action_pressed("up"):
		$AnimatedSprite.play('Up')
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
