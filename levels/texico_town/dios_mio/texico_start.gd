extends Node2D

@onready var taco: Player = $Taco
@onready var camera_2d: Camera2D = $Taco/Camera2D


var player_spawn_location_dict = {
	woz_front_door = Vector2(-225, -25),
	barb_front_door = Vector2(650, 100)
}


func _ready():
	camera_2d.set_limit(SIDE_BOTTOM, 500)

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]
	
