extends Node2D

@onready var taco: Player = $Taco

var barb_gallery_two = preload("res://levels/texico_town/barb_house/barb_gallery_two.tscn").instantiate()


var player_spawn_location_dict = {
	exit_door = Vector2(32, -5),
	gallery_one_door = Vector2(696, -5)
}


func _ready():
		taco.get_child(3).set_limit(SIDE_BOTTOM, 16)
		taco.get_child(3).set_limit(SIDE_LEFT, -48)
		taco.get_child(3).set_limit(SIDE_RIGHT, 720)

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]

func _on_exit_door_body_entered(_body: Node2D) -> void:
	var barb_gallery = load("res://levels/texico_town/barb_house/barb_gallery.tscn").instantiate()
	barb_gallery.get_child(0).position = barb_gallery.get_spawn_location("barb_front_door")
	barb_gallery.get_child(0).get_child(0).flip_h = true
	SceneManager.swap_scenes(barb_gallery)
	queue_free()


func _on_gallery_two_body_entered(_body: Node2D) -> void:
	barb_gallery_two.get_child(0).position = barb_gallery_two.get_spawn_location("gallery_two_door")
	SceneManager.swap_scenes(barb_gallery_two)
	queue_free()
