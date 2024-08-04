extends Sprite2D

@onready var interaction_area: InteractionArea = $"../InteractionArea"

signal barb_gallery_switch(data)


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	barb_gallery_switch.emit({
		"player_spawn_location" : Vector2(32, -5)
	})
