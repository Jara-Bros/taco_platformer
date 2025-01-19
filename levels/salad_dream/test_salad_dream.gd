extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("sous_salad_hint")
	await Dialogic.timeline_ended


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
