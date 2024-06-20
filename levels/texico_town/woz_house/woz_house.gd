extends Node2D

@onready var taco: Player = $Taco


# Set player camera limits
func _ready():
	taco.get_child(3).set_limit(SIDE_BOTTOM, 565)
	taco.get_child(3).set_limit(SIDE_RIGHT, 1035)
	taco.get_child(3).set_zoom(Vector2(2, 2))

# Player spawn location for transition taco house -> woz house
# and woz house interior -> woz front door
var player_spawn_location_dict = {
	taco_house = Vector2(1006, 530),
	woz_front_door = Vector2(689, 325)
}


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]

# Swap scenes from woz house to taco house
func _on_taco_house_body_entered(_body: Node2D) -> void:
	var texico_town = load("res://levels/texico_town/texico_town.tscn").instantiate()
	texico_town.get_child(0).position = texico_town.get_spawn_location("woz_house")
	SceneManager.swap_scenes(texico_town)
	queue_free()

# Swap scenes from woz house to woz house interior
func _on_woz_door_body_entered(_body: Node2D) -> void:
	var woz_house_interior = load("res://levels/texico_town/woz_house/woz_house_interior.tscn").instantiate()
	woz_house_interior.get_child(0).position = woz_house_interior.get_spawn_location("exit_door")
	SceneManager.swap_scenes(woz_house_interior)
	queue_free()
