extends Node

@onready var taco: Player = $"../Taco"
@onready var interaction_area: InteractionArea = $InteractionArea


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	taco.input_enabled = false
	taco.animation_player.play("idle")
	Dialogic.start("ttom_ref_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true
