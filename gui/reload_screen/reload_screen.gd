extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	if Input.is_action_pressed("reload"):
		get_tree().reload_current_scene()
