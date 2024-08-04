extends Node2D

@onready var camera_2d: Camera2D = $Taco/Camera2D


func _ready() -> void:
	camera_2d.set_limit(SIDE_RIGHT, 1250)
	camera_2d.set_limit(SIDE_LEFT, -300)
	


func _on_ride_enter_river_ride_from_river_enter(data):
	SceneManager.switch_scene("RiverPlantain",data)
