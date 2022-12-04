extends Area2D

export var speed = 400
signal hit
var movementLock = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !movementLock:
		var velocity = Vector2.ZERO # The player's movement vector.
		if Input.is_action_pressed("down"):
			velocity.y += 1
		if Input.is_action_pressed("up"):
			velocity.y -= 1

		if velocity.length() > 0:
			velocity = velocity.normalized() * speed

		position += velocity * delta

func changeMovementLock(boolean):
	movementLock = boolean

func _on_Boris_body_entered(body):
	emit_signal("hit")
	# Must be deferred as we can't change physics properties on a physics callback.
	$BorisCollision.set_deferred("disabled", true)
