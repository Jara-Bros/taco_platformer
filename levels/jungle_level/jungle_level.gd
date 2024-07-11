extends Node2D

@onready var camera_2d: Camera2D = $Taco/Camera2D


func _ready() -> void:

# Set camera limits for bottomless pits
	camera_2d.set_limit(SIDE_BOTTOM, 725)
	camera_2d.set_limit(SIDE_TOP, -350)
