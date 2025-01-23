extends Node2D


@onready var taco: Player = $Taco

# Called when the node enters the scene tree for the first time.
func _ready():
	taco.input_enabled = false
	Dialogic.start("sous_salad_hint")
	await Dialogic.timeline_ended
	taco.input_enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
