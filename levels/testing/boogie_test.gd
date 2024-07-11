extends Node2D

@onready var camera_2d: Camera2D = $TacoBoogie/Camera2D

func _ready() -> void:
	camera_2d.set_limit(SIDE_BOTTOM, 2050)
	camera_2d.set_limit(SIDE_LEFT, -3000)
