extends Sprite2D

@onready var interaction_area: InteractionArea = $"../InteractionArea"
@onready var barb_gallery_one = preload("res://levels/texico_town/barb_house/barb_gallery_one.tscn").instantiate()
@onready var texico_start: Node2D = $"../.."


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	SceneManager.swap_scenes(barb_gallery_one)
	texico_start.queue_free()
