extends Node2D

@onready var taco: Player = $Taco


var player_spawn_location_dict = {
	woz_front_door = Vector2(-90, 99),
	barb_front_door = Vector2(215, 12)
}

func _ready():
	taco.get_child(3).set_limit(SIDE_LEFT, -1215)
	taco.get_child(3).set_limit(SIDE_BOTTOM, 425)

var woz_house = preload("res://levels/texico_town/woz_house/woz_house.tscn").instantiate()
var barb_gallery = preload("res://levels/texico_town/barb_house/barb_gallery.tscn").instantiate()


func _on_room_transition_body_entered(_body: Node2D) -> void:
	woz_house_interior.get_child(0).position = woz_house_interior.get_spawn_location("exit_door")
	SceneManager.swap_scenes(woz_house_interior)
	queue_free()

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


func _on_barb_door_body_entered(_body: Node2D) -> void:
	barb_house_interior.get_child(0).position = barb_house_interior.get_spawn_location("exit_door")
	SceneManager.swap_scenes(barb_house_interior)
	queue_free()
