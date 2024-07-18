extends Parallax2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	repeat_size = Vector2(sprite_2d.texture.get_width(), sprite_2d.texture.get_height())
