extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	Dialogic.start("abe_timeline")
	await Dialogic.timeline_ended
