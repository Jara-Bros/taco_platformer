extends Node2D

@onready var camera_2d: Camera2D = $TacoPlaintainRide/Camera2D

func _ready() -> void:
	camera_2d.set_limit(SIDE_RIGHT, 1150)
	camera_2d.set_limit(SIDE_BOTTOM, 875)


func _on_beach_enter_enter_beach_from_river_ride(data):
	SceneManager.switch_scene("Beach",data)
