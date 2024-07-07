extends Node2D

var toy_level = preload("res://levels/testing/toy_level.tscn").instantiate()

func _on_toy_level_door_body_entered(body: Node2D) -> void:
	SceneManager.swap_scenes(toy_level)
	queue_free()
