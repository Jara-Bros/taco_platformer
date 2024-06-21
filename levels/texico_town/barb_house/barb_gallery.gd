extends Node2D

@onready var taco: Player = $Taco


func _ready():
	taco.get_child(3).set_limit(SIDE_TOP, 0)
	taco.get_child(3).set_limit(SIDE_LEFT, 0)

var player_spawn_location_dict = {
	taco_house_bottom = Vector2(64, 12),
}

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


func _on_taco_house_bottom_body_entered(_body: Node2D) -> void:
	var texico_town = load("res://levels/texico_town/texico_town.tscn").instantiate()
	texico_town.get_child(0).position = texico_town.get_spawn_location("taco_house_top")
	SceneManager.swap_scenes(texico_town)
	queue_free()
