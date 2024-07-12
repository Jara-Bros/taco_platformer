extends Sprite2D


@onready var interaction_area: InteractionArea = $InteractionArea


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	var woz_house = load("res://levels/texico_town/woz_house/woz_house_interior.tscn").instantiate()
	SceneManager.change_scenes(woz_house)
