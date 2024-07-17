extends Parallax2D

@onready var forest: Sprite2D = $Forest

func _ready() -> void:
	repeat_size = Vector2(forest.texture.get_width(), forest.texture.get_height())
