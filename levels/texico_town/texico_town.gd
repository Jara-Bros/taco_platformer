extends Node2D

@onready var taco: Player = $Taco

var woz_house = preload("res://levels/texico_town/woz_house/woz_house.tscn").instantiate()
var barb_gallery = preload("res://levels/texico_town/barb_house/barb_gallery.tscn").instantiate()


# Player spawn location for woz house -> taco house transition
var player_spawn_location_dict = {
	woz_house = Vector2(-1190, 320),
	taco_house_top = Vector2(-1075, 345)
}

# Set player camera limits
func _ready():
	taco.get_child(3).set_limit(SIDE_LEFT, -1217)
	taco.get_child(3).set_limit(SIDE_BOTTOM, 375)

# Swap scenes to woz house
func _on_room_transition_body_entered(_body: Node2D) -> void:
	woz_house.get_child(0).position = woz_house.get_spawn_location("taco_house")
	SceneManager.swap_scenes(woz_house)
	queue_free()

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]

# Zoom out camera for cliff peak sunset shot
func _on_zoom_out_body_entered(_body: Node2D) -> void:
	taco.get_child(3).set_zoom(Vector2(1.5, 1.5))
	taco.get_child(3).set_limit(SIDE_LEFT, -525)
	taco.get_child(3).set_limit(SIDE_BOTTOM, 375)

# Reset camera for cliff peak sunset shot
func _on_zoom_out_body_exited(_body: Node2D) -> void:
	taco.get_child(3).set_zoom(Vector2(3.5, 3.5))
	taco.get_child(3).set_limit(SIDE_LEFT, -1217)
	taco.get_child(3).set_limit(SIDE_BOTTOM, 375)

# Swap scenes from taco house to barb gallery
func _on_barb_gallery_body_entered(_body: Node2D) -> void:
	barb_gallery.get_child(0).position = barb_gallery.get_spawn_location("taco_house_bottom")
	SceneManager.swap_scenes(barb_gallery)
	queue_free()
