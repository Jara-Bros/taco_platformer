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

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]
