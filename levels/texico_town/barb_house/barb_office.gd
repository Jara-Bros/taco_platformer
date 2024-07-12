extends Node2D

@onready var taco: Player = $Taco
@onready var barb: CharacterBody2D = $Barb


var player_spawn_location_dict = {
	office_exit_door = Vector2(-13, -4),
}


func _ready() -> void:
	taco.get_child(3).set_limit(SIDE_BOTTOM, 16)
	taco.get_child(3).set_limit(SIDE_LEFT, -111)
	taco.get_child(3).set_limit(SIDE_RIGHT, 624)


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


func _on_exit_door_body_entered(_body: Node2D) -> void:
	var barb_gallery_one = load("res://levels/texico_town/barb_house/barb_gallery_one.tscn").instantiate()
	barb_gallery_one.get_child(0).position = barb_gallery_one.get_spawn_location("gallery_one_door")
	SceneManager.change_scenes(barb_gallery_one)
	queue_free()
