extends Node2D

var introPlaying = true
var playing = true
var canAttack = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$DrawsNear.play("intro")

var introTime = 5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing and !introPlaying and Input.is_action_just_pressed("any"):
		if !canAttack:
			$DrawsNear.play("attack")
			$HPBar.show()
			canAttack = true
		else:
			$DrawsNear.stop()
			$HitAnim.show()
			$HitAnim.play()
			$Timer.start()


func _on_DrawsNear_animation_finished():
	introPlaying = false


func _on_Timer_timeout():
	$HPBar.play()
