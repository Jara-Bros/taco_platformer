extends Area2D

@onready var jungle_level: Node2D = $".."


func _on_body_entered(_body: Node2D) -> void:
	var river = load("res://levels/river/river.tscn").instantiate()
	river.get_child(0).position = river.get_spawn_location("normal_enter")
	SceneManager.change_scenes(river)
	jungle_level.queue_free()