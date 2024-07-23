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
	var barb_gallery_one = load("res://levels/texico_town/barb_house/barb_gallery_one.tscn").instantiate()
	barb_gallery_one.get_child(0).position = barb_gallery_one.get_spawn_location("gallery_one_door")
	SceneManager.change_scenes(barb_gallery_one)
	queue_free()
