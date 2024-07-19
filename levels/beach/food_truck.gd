extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var taco: Player = $"../Taco"


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	Dialogic.start("esmeralda_timeline")
	await Dialogic.timeline_ended
