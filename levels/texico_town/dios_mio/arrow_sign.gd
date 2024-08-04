extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var taco: Player = $"../../Taco"


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	taco.input_enabled = false
	taco.animation_player.play("idle")
	Dialogic.start("dios_mio_direction_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true
