extends Node2D

@onready var taco: Player = $Taco
@onready var camera_2d: Camera2D = $Taco/Camera2D


var player_spawn_location_dict = {
	exit_door = Vector2(32, -5),
	gallery_one_door = Vector2(696, -5)
}


func _ready():
	camera_2d.set_limit(SIDE_BOTTOM, 16)
	camera_2d.set_limit(SIDE_LEFT, -125)
	camera_2d.set_limit(SIDE_RIGHT, 775)
	var initialized_data = SceneManager.get_transfer_data("BarbGallery")
	if initialized_data.has("player_spawn_location") == true:
		$Taco.position = initialized_data["player_spawn_location"]

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


func _on_office_door_barb_office_switch(data):
	SceneManager.switch_scene("BarbOffice", data)


func _on_exit_door_barb_gallery_to_dios_mio(data):
	SceneManager.switch_scene("DiosMio", data)
