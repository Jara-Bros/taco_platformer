extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	var jungle_level = load("res://levels/jungle_level/jungle_level.tscn").instantiate()
	SceneManager.change_scenes(jungle_level)
