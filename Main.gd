extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func judgementHall():
	var tileMap = get_node("TileMap")
	for i in range(17,27):
		tileMap.set_cellv(Vector2(-37,i), -1)
		tileMap.set_cellv(Vector2(-36,i), -1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
var tick = 0
func _process(delta):
	tick += delta
