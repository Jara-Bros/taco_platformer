extends Sprite2D

@onready var interaction_area: InteractionArea = $"../InteractionArea"



func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	var barb_gallery_one = load("res://levels/texico_town/barb_house/barb_gallery_one.tscn").instantiate()
	SceneManager.change_scenes(barb_gallery_one)
