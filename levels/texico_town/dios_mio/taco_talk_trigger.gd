extends Area2D

@onready var taco: Player = $"../Taco"

func _on_body_entered(body: Node2D) -> void:
	taco.input_enabled = false
	Dialogic.start("taco_start_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true
	queue_free()
