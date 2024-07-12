extends Node2D

@onready var taco: Player = $Taco


var player_spawn_location_dict = {
	exit_door = Vector2(32, -5),
	gallery_one_door = Vector2(696, -5)
}


func _ready():

		taco.get_child(3).set_limit(SIDE_BOTTOM, 16)
		taco.get_child(3).set_limit(SIDE_LEFT, -125)
		taco.get_child(3).set_limit(SIDE_RIGHT, 775)

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]

func _on_exit_door_body_entered(_body: Node2D) -> void:
	var texico_start = load("res://levels/texico_town/dios_mio/texico_start.tscn").instantiate()
	texico_start.get_child(0).position = texico_start.get_spawn_location("barb_front_door")
	SceneManager.change_scenes(texico_start)


func _on_office_door_body_entered(_body: Node2D) -> void:
	var barb_office = load("res://levels/texico_town/barb_house/barb_office.tscn").instantiate()
	SceneManager.change_scenes(barb_office)
	queue_free()
