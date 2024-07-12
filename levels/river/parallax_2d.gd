extends Parallax2D

@onready var forest_bg: Sprite2D = $ForestBG



func _ready() -> void:
	repeat_size = Vector2(forest_bg.texture.get_width(), forest_bg.texture.get_height())
