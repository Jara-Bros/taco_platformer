extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"
@onready var timer: Timer = $Timer
@onready var taco: Player = $"../Taco"


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	taco.input_enabled = false
	Dialogic.start("taco_finds_bleu_timeline")
	await Dialogic.timeline_ended
	canvas_layer.visible = true
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().quit()
