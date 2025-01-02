extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hint_pause()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func hint_pause():
	get_tree().paused = true
	Dialogic.start("salad_dream_instruction")
	Dialogic.timeline_ended
	get_tree().paused = false
	
