extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var beach = load("res://levels/beach/beach.tscn").instantiate()
	SceneManager.change_scenes(beach)
