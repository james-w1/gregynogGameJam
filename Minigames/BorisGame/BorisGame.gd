extends Node2D

export(PackedScene) var child
var score = 20
var started = false
var calledGoBack = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
func start():
	$SpawnTimer.start()
	$Score.text = str(score)

func _on_ChildDestroyer_body_entered(body):
	if "Child" in body.name:
		body.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score <= 0 and !calledGoBack:
		calledGoBack = true
		goBack()
	else:
		pass

func goBack():
	$SpawnTimer.stop()
	$Score.text = ""
	# load all the nodes
	var player = get_node("../Player")
	var playerCam = get_node("../Player/Camera2D")
	var boris = get_node("../Boris")
	var game = get_node("../BorisGame")
	var gamer = get_node("../BorisGame/PlayBoris")
	var playerC = get_node("../Player/CollisionShape2D")
	
	# hide everything
	self.hide()
	player.setPlayingGame(false)
	player.show()
	boris.show()
	playerC.disabled = false
	
		#zoom in
	playerCam.zoom.x = 0.3
	playerCam.zoom.y = 0.3
	
	gamer.changeMovementLock(true)

func _on_SpawnTimer_timeout():
	if score > 0:
		var child_runner = child.instance()
		var child_spawn_location = get_node("SpawnPath/SpawnLocation")
		child_spawn_location.offset = randi()

		# Set the mob's direction perpendicular to the path direction.
		var direction = child_spawn_location.rotation + PI / 2

		# Set the mob's position to a random location.
		child_runner.position = child_spawn_location.position

		# Add some randomness to the direction.
		#direction += rand_range(-PI / 4, PI / 4)
		child_runner.rotation = 0

		# Choose the velocity for the mob.
		var velocity = Vector2(rand_range(150.0, 200.0), 0.0)
		child_runner.linear_velocity = velocity.rotated(direction)

		# Spawn the mob by adding it to the Main scene.
		add_child(child_runner)

func _on_PlayBoris_body_entered(body):
	if "Child" in body.name:
		score -= 1
		$Score.text = str(score)
		var sprite = body.get_node("AnimatedSprite")
		sprite.play("dead")
		var child_spawn_location = get_node("SpawnPath/SpawnLocation")
		body.linear_velocity = Vector2(rand_range(0.0, 0.0), 250.0).rotated(rand_range(-30.0, 30.0) + child_spawn_location.rotation + PI / 2)
		


func _on_PlayBoris_body_exited(body):
	pass
