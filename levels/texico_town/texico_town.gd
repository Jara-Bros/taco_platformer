extends Node2D



var player_spawn_location_dict = {
	woz_front_door = Vector2(-90, 99),
	barb_front_door = Vector2(215, 12)
}


var woz_house_interior = preload("res://levels/texico_town/woz_house_interior/woz_house_interior.tscn").instantiate() 
var barb_house_interior = preload("res://levels/texico_town/barb_house_interior/barb_house_interior.tscn").instantiate()


func _on_room_transition_body_entered(_body: Node2D) -> void:
	
	woz_house_interior.get_child(0).position = woz_house_interior.get_spawn_location("exit_door")
	SceneManager.swap_scenes(woz_house_interior)
	queue_free()

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


func _on_barb_door_body_entered(body: Node2D) -> void:
	
	barb_house_interior.get_child(0).position = barb_house_interior.get_spawn_location("exit_door")
	SceneManager.swap_scenes(barb_house_interior)
	queue_free()
