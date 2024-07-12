extends Node2D

@onready var camera_2d: Camera2D = $Taco/Camera2D


func _ready() -> void:
	camera_2d.set_limit(SIDE_BOTTOM, 450)
	camera_2d.set_limit(SIDE_RIGHT, 855)
	camera_2d.set_limit(SIDE_TOP, 185)
