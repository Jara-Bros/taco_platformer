extends Node

# The purpose of this node
# to allow quick reloads by one click
# rather than restarting the whole scene
# NOTE: only for debugging purposes only


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		get_tree().quit()
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()
