extends Node2D

var introPlaying = true
var playing = false
var canAttack = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var introTime = 5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing and introPlaying:
		$DrawsNear.play("intro")
	if playing and !introPlaying and Input.is_action_just_pressed("any"):
		if !canAttack:
			$DrawsNear.play("attack")
			$HPBar.show()
			canAttack = true
		else:
			$DrawsNear.stop()
			$BackGround.play()
			$HitAnim.show()
			$HitAnim.play()
			$Timer.start()
			$FinishedTimer.start()


func _on_DrawsNear_animation_finished():
	introPlaying = false


func _on_Timer_timeout():
	$HPBar.play()


func _on_FinishedTimer_timeout():
	# go back here
	var player = get_node("../Player")
	var playerCam = get_node("../Player/Camera2D")
	var game = get_node("/root/Main/LettuceFight")
	var truss = get_node("../Truss")
	var wL = get_node("../WorldLettuce/AnimatedSprite")
	
	# immobalise player
	player.setPlayingGame(false)
	player.show()
	
	# stop the game
	game.hide()
	game.playing = false
	
	playerCam.zoom.x = 0.3
	playerCam.zoom.y = 0.3
	
	var bgm = get_node("../BackGroundMusic")
	var minigameBgm = get_node("../MiniGameMusic")
	bgm.play()
	minigameBgm.stop()
	
	wL.play("dead")
	
	truss.annoyedText = "Thank you for helping me outlast that evil lettuce"
	truss.wantsToSpeak = false
	
	var tileMap = get_node("/root/Main/TileMap")
	for i in range(17,27):
		tileMap.set_cellv(Vector2(-37,i), -1)
		tileMap.set_cellv(Vector2(-36,i), -1)
		
	
