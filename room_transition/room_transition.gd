extends Area2D

var texico_start = load("res://levels/texico_town/dios_mio/texico_start.tscn").instantiate()

func _on_body_entered(_body: Node2D) -> void:
	texico_start.get_child(0).position = texico_start.get_spawn_location("woz_front_door")
	SceneManager.change_scenes(texico_start)
