extends Parallax2D

@onready var river: Sprite2D = $River

func _ready() -> void:
	repeat_size = Vector2(river.texture.get_width(), river.texture.get_height())
