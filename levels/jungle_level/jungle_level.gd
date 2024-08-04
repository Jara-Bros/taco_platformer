extends Node2D

@onready var camera_2d: Camera2D = $Taco/Camera2D

func _ready() -> void:

# Set camera limits for bottomless pits
	camera_2d.set_limit(SIDE_BOTTOM, 875)
	camera_2d.set_limit(SIDE_TOP, -360)
	camera_2d.set_limit(SIDE_LEFT, -4425)


func _on_swap_scene_enter_waterfall(data):
	SceneManager.switch_scene("WaterfallLevel", data)


func _on_butterfly_trigger_enter_waterfall_from_butterfly(data):
	SceneManager.switch_scene("WaterfallLevel",data)
