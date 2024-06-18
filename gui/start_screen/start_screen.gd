extends Control

var texico_town : Node2D = preload("res://levels/texico_town/texico_town.tscn").instantiate()

func _on_button_pressed() -> void:
	SceneManager.swap_scenes(texico_town)
	queue_free()
