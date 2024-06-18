extends Node2D

@onready var taco: Player = $Taco


var player_spawn_location_dict = {
	exit_door = Vector2(32, -7)
}


func _ready():
		taco.get_child(3).set_limit(SIDE_BOTTOM, 16)
		taco.get_child(3).set_limit(SIDE_LEFT, -48)

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]

func _on_exit_door_body_entered(_body: Node2D) -> void:
	var texico_town : Node2D = load("res://levels/texico_town/texico_town.tscn").instantiate()
	texico_town.get_child(0).position = texico_town.get_spawn_location("barb_front_door")
	texico_town.get_child(0).get_child(0).flip_h = true
	SceneManager.swap_scenes(texico_town)
	queue_free()
