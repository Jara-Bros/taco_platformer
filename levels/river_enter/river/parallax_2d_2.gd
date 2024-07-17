extends Parallax2D

@onready var river_fg: Sprite2D = $RiverFG

func _ready() -> void:
	repeat_size = Vector2(river_fg.texture.get_width(), river_fg.texture.get_height())
