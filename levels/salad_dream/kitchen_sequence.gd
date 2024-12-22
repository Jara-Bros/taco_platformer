extends Node2D


var data = null


func _ready() -> void:
	pass
	

func dialogic_conversation():
	Dialogic.start("kitchen_sequence")
	await Dialogic.timeline_ended
