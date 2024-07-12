extends Area2D



func _on_body_entered(_body: Node2D) -> void:
	var texico_start = load("res://levels/texico_town/dios_mio/texico_start.tscn").instantiate()
	SceneManager.change_scenes(texico_start)
	queue_free()
