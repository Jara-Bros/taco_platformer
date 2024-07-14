extends Area2D

@onready var canvas_layer: CanvasLayer = $"../../CanvasLayer"
@onready var taco: Player = $"../../Taco"
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	taco.input_enabled = false
	taco.animation_player.play("idle")
	Dialogic.start("taco_finds_bleu_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true
	canvas_layer.visible = true
	timer.start()
