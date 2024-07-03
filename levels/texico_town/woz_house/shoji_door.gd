extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var woz_house_interior = preload("res://levels/texico_town/woz_house/woz_house_interior.tscn").instantiate()
@onready var texico_start: Node2D = $"../.."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	SceneManager.swap_scenes(woz_house_interior)
	texico_start.queue_free()