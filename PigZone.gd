extends Area2D

var pigsInPen = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func addPig():
	pigsInPen += 1
	match pigsInPen:
		1: $pig1.show()
		2: $pig2.show()
		3: $pig3.show()
		4: $pig4.show()
		5: 
			$pig5.show()
			var cam = get_node("/root/Main/Cameron")
			cam.wantsToSpeak = false
			cam.annoyedText = "Thanks for rounding up my pigs"
			
			var blockage = get_node("../RoadBlock2")
			blockage.clearBlock()
			
		_: print("wut")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
