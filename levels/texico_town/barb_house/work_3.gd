extends Node

@onready var interaction_area: InteractionArea = $Frame3/InteractionArea
@onready var taco: Player = $Taco
@onready var animation_player: AnimationPlayer = $Taco/AnimationPlayer


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	taco.input_enabled = false
	taco.animation_player.play("idle")
	animation_player.play("idle")
	Dialogic.start("fanart_3_timeline")
	await Dialogic.timeline_ended
	animation_player.play("idle_up")
	taco.input_enabled = true