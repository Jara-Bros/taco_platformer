extends Node2D

@onready var taco: Player = $Taco

var barb_gallery_one = preload("res://levels/texico_town/barb_house/barb_gallery_one.tscn").instantiate()

func _ready():
	taco.get_child(3).set_limit(SIDE_TOP, 0)
	taco.get_child(3).set_limit(SIDE_LEFT, 0)
	taco.get_child(3).set_limit(SIDE_BOTTOM, 600)

var player_spawn_location_dict = {
	taco_house_bottom = Vector2(64, 12),
	barb_front_door = Vector2(435, 162)
}

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


func _on_taco_house_bottom_body_entered(_body: Node2D) -> void:
	var texico_town = load("res://levels/texico_town/texico_town.tscn").instantiate()
	texico_town.get_child(0).position = texico_town.get_spawn_location("taco_house_top")
	SceneManager.swap_scenes(texico_town)
	queue_free()


func _on_gallery_room_one_body_entered(_body: Node2D) -> void:
	barb_gallery_one.get_child(0).position = barb_gallery_one.get_spawn_location("exit_door")
	SceneManager.swap_scenes(barb_gallery_one)
	queue_free()
