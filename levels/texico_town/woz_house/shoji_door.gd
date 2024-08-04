extends Sprite2D


@onready var interaction_area: InteractionArea = $InteractionArea


signal enter_woz_house(data)

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	enter_woz_house.emit({
		"player_spawn_location": Vector2(162, -4)
	})
