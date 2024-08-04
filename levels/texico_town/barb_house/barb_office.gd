extends Node2D

@onready var taco: Player = $Taco
@onready var barb: CharacterBody2D = $Barb
@onready var camera_2d: Camera2D = $Taco/Camera2D


var player_spawn_location_dict = {
	office_exit_door = Vector2(-13, -4),
}


func _ready() -> void:
	camera_2d.set_limit(SIDE_BOTTOM, 16)
	camera_2d.set_limit(SIDE_LEFT, -111)
	camera_2d.set_limit(SIDE_RIGHT, 624)


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


func _on_exit_door_body_entered(_body: Node2D) -> void:
	SceneManager.switch_scene("BarbGallery", {
		"player_spawn_location" : Vector2(696, -5)
	})
