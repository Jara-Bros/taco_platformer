extends Control

var texico_start = preload("res://levels/texico_town/dios_mio/texico_start.tscn").instantiate()



func _on_play_button_pressed() -> void:
	SceneManager.swap_scenes(texico_start)
	queue_free()
