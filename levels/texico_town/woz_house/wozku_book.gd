extends Sprite2D

@onready var area_2d: Area2D = $Area2D
@onready var taco: Player = $"../Taco"

func _on_area_2d_body_entered(_body: Node2D) -> void:
	taco.input_enabled = false
	taco.animation_player.play("idle")
	Dialogic.start("wozku_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true
	area_2d.queue_free()
