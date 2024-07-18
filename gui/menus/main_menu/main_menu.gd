extends Control

var dios_mio = preload("res://levels/texico_town/dios_mio/texico_start.tscn").instantiate()


func _on_play_button_pressed() -> void:
	SceneManager.start_scene(dios_mio)
	queue_free()
