extends Node2D

@onready var taco: Player = $Taco

var barb_office = preload("res://levels/texico_town/barb_house/barb_office.tscn").instantiate()

var player_spawn_location_dict = {
	gallery_two_door = Vector2(-41, -4),
	office_door = Vector2(287, -4)
}


func _ready():
	taco.get_child(3).set_limit(SIDE_BOTTOM, 16)
	taco.get_child(3).set_limit(SIDE_LEFT, -150)
	taco.get_child(3).set_limit(SIDE_RIGHT, 390)

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]

func _on_barb_office_body_entered(_body: Node2D) -> void:
	barb_office.get_child(0).position = barb_office.get_spawn_location("office_exit_door")
	SceneManager.swap_scenes(barb_office)
	queue_free()


func _on_gallery_one_body_entered(_body: Node2D) -> void:
	var barb_gallery_one = load("res://levels/texico_town/barb_house/barb_gallery_one.tscn").instantiate()
	barb_gallery_one.get_child(0).position = barb_gallery_one.get_spawn_location("gallery_one_door")
	SceneManager.swap_scenes(barb_gallery_one)
	queue_free()
